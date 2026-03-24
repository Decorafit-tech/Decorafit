# C4 Model — Context Diagram

## System: Decorafit Platform

The Decorafit Platform is a residential renovation management system.
It connects three types of actors: Backoffice (Decorafit team), Executors (contractors),
and Clients (apartment owners).

---

## Actors (People)

| Actor | Description | Interaction |
|-------|-------------|-------------|
| **Backoffice** | Decorafit internal team | Manages reforms, quality control, tooling |
| **Executor** | External contractor | Receives assignments, reports progress |
| **Client** | Apartment owner | Reviews projects, approves deliveries |

---

## External Systems

| System | Purpose | Integration |
|--------|---------|-------------|
| **Supabase Auth** | Authentication (Google OAuth, email, magic link) | JWT tokens |
| **Supabase Storage** | File storage (photos, documents, contracts) | S3-compatible API |
| **PostgreSQL (Supabase)** | Primary database | Prisma ORM |
| **Redis** | Job queue backing store | BullMQ |
| **Sentry** | Error tracking and alerting | SDK |
| **PostHog** | Product analytics | SDK |

---

## System Boundary

Everything inside `decorafit-platform/` is the system. External services are outside the boundary.

The system exposes:
- A web application (Next.js) — accessed via browser
- A REST API (NestJS) — consumed by the web app and potentially mobile (future)
