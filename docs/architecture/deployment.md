# Deployment Architecture

## Overview

Decorafit Platform is deployed on a **single VPS** (Hostinger) using **Docker containers**
orchestrated by **Coolify**. All services run as Docker containers.

---

## Infrastructure

| Component | Technology | Notes |
|-----------|-----------|-------|
| VPS | Hostinger | Single server, initial phase |
| Orchestration | Coolify | Self-hosted PaaS on VPS |
| Containers | Docker | Multi-stage builds |
| Reverse Proxy | Traefik (via Coolify) | HTTPS, auto certificates |
| Database | PostgreSQL via Supabase | Self-hosted on same VPS |
| Auth | Supabase Auth | Self-hosted on same VPS |
| File Storage | Supabase Storage | Self-hosted on same VPS |
| Queue | Redis 7 | Standalone container |
| Monitoring | Sentry (cloud) + PostHog (cloud) | SaaS, no self-hosting |

---

## Deployment Flow

1. Developer pushes to `main` branch on GitHub.
2. GitHub Actions CI runs (lint → typecheck → test → build).
3. If CI passes, Coolify webhook is triggered.
4. Coolify pulls the latest code, builds Docker images, and redeploys containers.
5. Zero-downtime deployment via container rollover.

---

## Container Configuration

Each service has its own `Dockerfile` with multi-stage builds:

| Service | Dockerfile | Port | Container Name |
|---------|-----------|------|----------------|
| web | `apps/web/Dockerfile` | 3000 | decorafit-web |
| api | `apps/api/Dockerfile` | 3001 | decorafit-api |
| worker | `apps/worker/Dockerfile` | — | decorafit-worker |
| redis | `redis:7-alpine` | 6379 | decorafit-redis |

---

## Environment Variables

All environment variables are configured in Coolify's UI.
Never stored in git. See `.env.example` for the full list of required variables.

---

## Operations Rules

- **Primary deployment:** via Coolify (never manual SSH).
- **Database migrations:** run as a pre-deploy step via `prisma migrate deploy`.
- **Backups:** see `docs/runbooks/backup-restore.md`.
- **Scaling:** vertical (upgrade VPS) before horizontal (multi-instance). Current architecture supports single instance.
