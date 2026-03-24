#!/usr/bin/env bash
# stop-verify.sh — Run quality checks when Claude session ends
# Always exits 0 — does not block session termination

set -uo pipefail

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   Claude Code — Verificação Final    ║"
echo "╚══════════════════════════════════════╝"

HAS_PKG=0
[[ -f "package.json" ]] && HAS_PKG=1

if [[ "$HAS_PKG" -eq 0 ]]; then
  echo "  ⓘ  Nenhum package.json encontrado — verificações puladas."
  echo ""
  exit 0
fi

run_check() {
  local label="$1"
  local cmd="$2"
  printf "  %-20s " "$label"
  if eval "$cmd" &>/dev/null 2>&1; then
    echo "✓"
  else
    echo "✗  (verifique manualmente)"
  fi
}

# Check if a npm script exists in package.json
has_script() {
  local script="$1"
  node -e "const p=require('./package.json'); process.exit(p.scripts && p.scripts['$script'] ? 0 : 1);" 2>/dev/null
}

# Lint
if has_script "lint"; then
  run_check "Lint:" "npm run lint --silent"
else
  printf "  %-20s %s\n" "Lint:" "— (sem script)"
fi

# Typecheck
if has_script "typecheck"; then
  run_check "TypeCheck:" "npm run typecheck --silent"
elif has_script "type-check"; then
  run_check "TypeCheck:" "npm run type-check --silent"
else
  printf "  %-20s %s\n" "TypeCheck:" "— (sem script)"
fi

# Tests
if has_script "test"; then
  # Try with --passWithNoTests flag first (Jest/Vitest)
  if npm run test -- --passWithNoTests &>/dev/null 2>&1; then
    printf "  %-20s %s\n" "Tests:" "✓"
  elif npm run test &>/dev/null 2>&1; then
    printf "  %-20s %s\n" "Tests:" "✓"
  else
    printf "  %-20s %s\n" "Tests:" "✗  (verifique manualmente)"
  fi
else
  printf "  %-20s %s\n" "Tests:" "— (sem script)"
fi

echo ""
exit 0
