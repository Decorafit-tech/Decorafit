#!/usr/bin/env bash
# pre-edit-guard.sh — Block edits to sensitive/protected files
# Receives tool input as JSON on stdin

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | grep -oP '"file_path"\s*:\s*"\K[^"]+' 2>/dev/null || true)

if [[ -z "$FILE_PATH" ]]; then
  exit 0
fi

BLOCKED=0
REASON=""

check_pattern() {
  local pattern="$1"
  local msg="$2"
  if [[ "$FILE_PATH" == $pattern ]]; then
    BLOCKED=1
    REASON="$msg"
  fi
}

# .env files
[[ "$FILE_PATH" == ".env" ]] && BLOCKED=1 && REASON="arquivo .env (variáveis de ambiente)"
[[ "$FILE_PATH" == .env.* ]] && BLOCKED=1 && REASON="arquivo .env.* (variáveis de ambiente)"
[[ "$FILE_PATH" == */.env ]] && BLOCKED=1 && REASON="arquivo .env (variáveis de ambiente)"
[[ "$FILE_PATH" == */.env.* ]] && BLOCKED=1 && REASON="arquivo .env.* (variáveis de ambiente)"

# Certificates and keys
[[ "$FILE_PATH" == *.pem ]] && BLOCKED=1 && REASON="arquivo de certificado (.pem)"
[[ "$FILE_PATH" == *.key ]] && BLOCKED=1 && REASON="arquivo de chave privada (.key)"
[[ "$FILE_PATH" == *.p12 ]] && BLOCKED=1 && REASON="arquivo de certificado (.p12)"
[[ "$FILE_PATH" == *.pfx ]] && BLOCKED=1 && REASON="arquivo de certificado (.pfx)"
[[ "$FILE_PATH" == *.crt ]] && BLOCKED=1 && REASON="arquivo de certificado (.crt)"

# Secret/credential/password files (case-insensitive basename check)
BASENAME=$(basename "$FILE_PATH" | tr '[:upper:]' '[:lower:]')
[[ "$BASENAME" == *secret* ]] && BLOCKED=1 && REASON="arquivo com 'secret' no nome"
[[ "$BASENAME" == *credential* ]] && BLOCKED=1 && REASON="arquivo com 'credential' no nome"
[[ "$BASENAME" == *password* ]] && BLOCKED=1 && REASON="arquivo com 'password' no nome"

# Dangerous migration files
[[ "$BASENAME" == *migration*drop* ]] && BLOCKED=1 && REASON="migration destrutiva (drop)"
[[ "$BASENAME" == *migration*truncate* ]] && BLOCKED=1 && REASON="migration destrutiva (truncate)"

# Protect Claude config itself
[[ "$FILE_PATH" == ".claude/settings.json" ]] && BLOCKED=1 && REASON="configuração do Claude Code (.claude/settings.json)"
[[ "$FILE_PATH" == .claude/hooks/* ]] && BLOCKED=1 && REASON="hooks do Claude Code (.claude/hooks/)"

if [[ "$BLOCKED" -eq 1 ]]; then
  echo "BLOQUEADO: Edição de '$FILE_PATH' não permitida — $REASON" >&2
  echo "Se precisar editar este arquivo, faça manualmente fora do Claude Code." >&2
  exit 2
fi

exit 0
