# C4 Model — Container Diagram

## Containers

```
┌─────────────────────────────────────────────────────┐
│                   Decorafit Platform                 │
│                                                     │
│  ┌─────────────┐  ┌─────────────┐  ┌────────────┐ │
│  │   Web App   │  │     API     │  │   Worker   │ │
│  │  (Next.js)  │  │  (NestJS)   │  │  (BullMQ)  │ │
│  │  Port 3000  │  │  Port 3001  │  │            │ │
│  └──────┬──────┘  └──────┬──────┘  └─────┬──────┘ │
│         │                │               │         │
└─────────┼────────────────┼───────────────┼─────────┘
          │                │               │
          ▼                ▼               ▼
    HTTPS/REST      PostgreSQL +      Redis (Queue)
    (internal)    Supabase Storage
```

### `apps/web` (Next.js 14+)

- Serves 3 portals: Backoffice, Executor, Client.
- Single codebase, route-based separation.
- App Router: Server Components by default.
- Communicates with `apps/api` via HTTP/REST.
- Auth: Supabase Auth SDK (client-side session).

### `apps/api` (NestJS)

- Modular monolith. One deployable unit.
- Modules: `identity-access` + one module per feature.
- Validates JWT from Supabase Auth.
- Reads/writes PostgreSQL via Prisma.
- Enqueues jobs to Redis via BullMQ.
- Stores/retrieves files via Supabase Storage.

### `apps/worker` (BullMQ)

- Consumes jobs from Redis queues.
- Runs background processing (notifications, reports, scheduled tasks).
- Shares domain types with `apps/api` via `@decorafit/domain`.
- No HTTP server — queue consumer only.

---

## Shared Packages

| Package | Used By | Purpose |
|---------|---------|---------|
| `@decorafit/domain` | api, worker, web | TypeScript types and enums |
| `@decorafit/contracts` | api, web | Request/response schemas |
| `@decorafit/shared` | api, worker, web | Formatters, validators, utilities |
| `@decorafit/ui` | web | Design system (Tailwind components) |
| `@decorafit/testing` | api, worker, web | Test factories and helpers |
| `@decorafit/config` | all | ESLint, tsconfig, Prettier, Vitest base configs |
