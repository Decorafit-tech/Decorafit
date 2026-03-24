#!/usr/bin/env bash
# config-change-audit.sh — Audit changes to Claude config files
# Receives tool input as JSON on stdin

set -uo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | grep -oP '"file_path"\s*:\s*"\K[^"]+' 2>/dev/null || true)

if [[ -z "$FILE_PATH" ]]; then
  exit 0
fi

# Only audit Claude config files
IS_CONFIG=0
[[ "$FILE_PATH" == ".claude/settings.json" ]] && IS_CONFIG=1
[[ "$FILE_PATH" == .claude/hooks/* ]] && IS_CONFIG=1
[[ "$FILE_PATH" == .claude/commands/* ]] && IS_CONFIG=1

if [[ "$IS_CONFIG" -eq 0 ]]; then
  exit 0
fi

echo "── Auditoria de Configuração ─────────────────────"
echo "  Arquivo alterado: $FILE_PATH"
echo "  Data/hora: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

if command -v git &>/dev/null && git rev-parse --git-dir &>/dev/null 2>&1; then
  echo "  Diff HEAD vs disco:"
  git diff HEAD -- "$FILE_PATH" 2>/dev/null || echo "  (arquivo não rastreado pelo git)"
else
  echo "  (git não disponível ou não é repositório)"
fi

echo "──────────────────────────────────────────────────"

exit 0
