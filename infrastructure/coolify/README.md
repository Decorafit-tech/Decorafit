# Coolify Deployment

Decorafit Platform is deployed via [Coolify](https://coolify.io) on a single VPS (Hostinger).

## Services

| Service | Docker Image | Port |
|---------|-------------|------|
| api | decorafit/api | 3001 |
| web | decorafit/web | 3000 |
| worker | decorafit/worker | — |
| redis | redis:7-alpine | 6379 |
| supabase | self-hosted | 5432 / 8000 |

## Setup Steps

1. Add this repository as a Git source in Coolify.
2. Create a new Application for each service (api, web, worker).
3. Set the Dockerfile path for each:
   - api: `apps/api/Dockerfile`
   - web: `apps/web/Dockerfile`
   - worker: `apps/worker/Dockerfile`
4. Configure environment variables per service (see `.env.example`).
5. Enable automatic deployments on push to `main`.

## Environment Variables

See `.env.example` in the repository root for required environment variables.
Configure each in Coolify's environment variable UI — never commit secrets.

## Networking

All services communicate on an internal Docker network managed by Coolify.
Only the `web` (port 3000) and `api` (port 3001) services are exposed externally via HTTPS reverse proxy.
