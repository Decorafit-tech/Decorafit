#!/usr/bin/env bash
# post-edit-format.sh — Auto-format and lint file after edit
# Receives tool input as JSON on stdin
# Always exits 0 — failures do not block the flow

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | grep -oP '"file_path"\s*:\s*"\K[^"]+' 2>/dev/null || true)

if [[ -z "$FILE_PATH" || ! -f "$FILE_PATH" ]]; then
  exit 0
fi

EXT="${FILE_PATH##*.}"

# ─── FORMATTER ────────────────────────────────────────────────────────────────
PRETTIER_EXTS="js ts jsx tsx json css scss less html md yaml yml"
SHOULD_FORMAT=0
for e in $PRETTIER_EXTS; do
  [[ "$EXT" == "$e" ]] && SHOULD_FORMAT=1 && break
done

if [[ "$SHOULD_FORMAT" -eq 1 ]]; then
  if [[ -x "node_modules/.bin/prettier" ]]; then
    node_modules/.bin/prettier --write "$FILE_PATH" 2>/dev/null || true
  elif command -v prettier &>/dev/null; then
    prettier --write "$FILE_PATH" 2>/dev/null || true
  fi
fi

# ─── LINTER (JS/TS only) ──────────────────────────────────────────────────────
LINT_EXTS="js ts jsx tsx"
SHOULD_LINT=0
for e in $LINT_EXTS; do
  [[ "$EXT" == "$e" ]] && SHOULD_LINT=1 && break
done

if [[ "$SHOULD_LINT" -eq 1 ]]; then
  if [[ -x "node_modules/.bin/eslint" ]]; then
    node_modules/.bin/eslint --fix "$FILE_PATH" 2>/dev/null || true
  elif command -v eslint &>/dev/null; then
    eslint --fix "$FILE_PATH" 2>/dev/null || true
  fi
fi

# ─── ORGANIZE IMPORTS (TypeScript only) ──────────────────────────────────────
if [[ "$EXT" == "ts" || "$EXT" == "tsx" ]]; then
  if command -v organize-imports-cli &>/dev/null; then
    organize-imports-cli "$FILE_PATH" 2>/dev/null || true
  fi
fi

exit 0
