# ADR 0001: Monorepo with pnpm + Turborepo

**Date:** 2026-03-23
**Status:** Accepted

---

## Context

The Decorafit Platform requires a web frontend (Next.js), a backend API (NestJS),
and a job worker (BullMQ). These three applications share types, contracts, and
utility code. We needed a strategy to manage this multi-application codebase.

Options considered:
1. **Polyrepo** — separate git repositories per app.
2. **Monorepo with npm/yarn workspaces** — single repo, standard workspaces.
3. **Monorepo with pnpm workspaces + Turborepo** — single repo, efficient package manager, build orchestrator.

---

## Decision

We chose **pnpm workspaces + Turborepo** (Option 3).

---

## Reasoning

**pnpm** provides:
- Efficient disk usage via content-addressable storage (symlinks, not copies).
- Strict module isolation (`shamefully-hoist=false`) preventing phantom dependencies.
- Native workspace support with `workspace:*` protocol for local packages.
- Fast installation compared to npm/yarn.

**Turborepo** provides:
- Intelligent build caching (local + remote).
- Parallel task execution across packages.
- Dependency graph awareness (builds `@decorafit/domain` before `@decorafit/api`).
- Simple `turbo.json` configuration.

**Monorepo** (vs polyrepo) provides:
- Atomic commits across all apps and packages.
- Single CI pipeline.
- Shared TypeScript types without publish/version overhead.
- Easier refactoring across app boundaries.

---

## Consequences

**Positive:**
- Type changes in `@decorafit/domain` are immediately reflected in all apps.
- Single `pnpm install` installs all dependencies.
- CI runs all checks in one pipeline.

**Negative:**
- Larger repository checkout for contributors touching only one app.
- Turborepo remote cache requires setup for full benefit (not configured in initial bootstrap).
- All apps must be upgraded together for shared dependency changes.

---

## References

- [pnpm workspaces](https://pnpm.io/workspaces)
- [Turborepo documentation](https://turbo.build/repo)
