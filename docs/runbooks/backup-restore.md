# Runbook: Database Backup & Restore

## Overview

The primary database is PostgreSQL hosted via self-hosted Supabase on the production VPS.
This runbook describes how to back up and restore the database.

---

## Backup

### Manual Backup

SSH into the VPS and run:

```bash
docker exec decorafit-supabase-db pg_dump \
  -U postgres \
  -d postgres \
  --format=custom \
  --file=/var/backups/decorafit-$(date +%Y%m%d-%H%M%S).dump
```

### Automated Backups (Planned)

Automated daily backups via cron job are planned but not yet configured.
The target is: daily backup retained for 30 days, weekly backup retained for 90 days.

When implemented, a backup script will be added to `infrastructure/scripts/backup-db.sh`.

---

## Restore

### From a dump file

```bash
docker exec -i decorafit-supabase-db pg_restore \
  -U postgres \
  -d postgres \
  --clean \
  --if-exists \
  /var/backups/decorafit-<timestamp>.dump
```

**Warning:** `--clean` drops existing objects before restoring. Run only on a maintenance window.

---

## Verification

After restore, verify:

1. Prisma can connect: `pnpm --filter @decorafit/api exec prisma db pull`
2. Row counts are consistent with pre-backup state.
3. Application health check passes: `GET /api/health`

---

## Contacts

- VPS access: configured in 1Password under "Decorafit Infrastructure".
- Coolify access: configured in 1Password under "Decorafit Coolify".

---

*This runbook will be updated when automated backup automation is implemented.*
