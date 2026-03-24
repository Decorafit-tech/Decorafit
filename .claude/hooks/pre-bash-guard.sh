#!/usr/bin/env bash
# pre-bash-guard.sh — Block or warn on destructive bash commands
# Receives tool input as JSON on stdin

set -euo pipefail

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | grep -oP '"command"\s*:\s*"\K[^"]+' 2>/dev/null || true)

if [[ -z "$COMMAND" ]]; then
  exit 0
fi

CMD_LOWER=$(echo "$COMMAND" | tr '[:upper:]' '[:lower:]')

# ─── HARD BLOCK (exit 2) ──────────────────────────────────────────────────────

# rm -rf on root paths
if echo "$COMMAND" | grep -qE 'rm\s+-rf\s+/\s*$|rm\s+-rf\s+/\*|rm\s+-rf\s+~\s*$|rm\s+-rf\s+~/'; then
  echo "BLOQUEADO: 'rm -rf' em diretório raiz/home — operação extremamente destrutiva." >&2
  exit 2
fi

# git push --force / -f to main or master
if echo "$COMMAND" | grep -qE 'git\s+push\s+.*(--force|-f)\s+(origin\s+)?(main|master)'; then
  echo "BLOQUEADO: 'git push --force' para main/master — pode destruir histórico compartilhado." >&2
  exit 2
fi
if echo "$COMMAND" | grep -qE 'git\s+push\s+(--force|-f)\s*$'; then
  echo "BLOQUEADO: 'git push --force' sem branch especificada — risco de sobrescrever main/master." >&2
  exit 2
fi

# SQL DROP statements
if echo "$CMD_LOWER" | grep -qE 'drop\s+(table|database|schema)'; then
  echo "BLOQUEADO: Comando SQL destrutivo detectado (DROP TABLE/DATABASE/SCHEMA)." >&2
  echo "Execute esse comando manualmente com supervisão explícita." >&2
  exit 2
fi

# SQL TRUNCATE
if echo "$CMD_LOWER" | grep -qE 'truncate\s+table'; then
  echo "BLOQUEADO: Comando SQL TRUNCATE TABLE detectado — remove todos os dados da tabela." >&2
  echo "Execute esse comando manualmente com supervisão explícita." >&2
  exit 2
fi

# ─── SOFT WARN (exit 0, print alert) ─────────────────────────────────────────

# rm -rf in general (non-root paths)
if echo "$COMMAND" | grep -qE 'rm\s+-rf\s+'; then
  echo "AVISO: Comando 'rm -rf' detectado: $COMMAND" >&2
  echo "Verifique se o caminho está correto antes de prosseguir." >&2
fi

# DELETE FROM without WHERE
if echo "$CMD_LOWER" | grep -qP 'delete\s+from\s+\S+\s*$' || \
   echo "$CMD_LOWER" | grep -qP 'delete\s+from\s+\S+\s*;'; then
  if ! echo "$CMD_LOWER" | grep -q 'where'; then
    echo "AVISO: 'DELETE FROM' sem cláusula WHERE — pode deletar todos os registros da tabela." >&2
  fi
fi

# git reset --hard
if echo "$COMMAND" | grep -qE 'git\s+reset\s+--hard'; then
  echo "AVISO: 'git reset --hard' detectado — descarta alterações locais permanentemente." >&2
fi

exit 0
