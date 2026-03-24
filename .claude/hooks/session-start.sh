#!/usr/bin/env bash
# session-start.sh — Re-inject project context at session start

set -uo pipefail

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")

echo "╔══════════════════════════════════════════╗"
echo "║   DecorFit Platform — Contexto Injetado  ║"
echo "╚══════════════════════════════════════════╝"
echo "  Branch atual: $BRANCH"
echo ""

# CLAUDE.md
if [[ -f "CLAUDE.md" ]]; then
  echo "── CLAUDE.md ──────────────────────────────"
  cat "CLAUDE.md"
  echo ""
fi

# Project constitution
if [[ -f ".specify/memory/constitution.md" ]]; then
  echo "── Constitution ────────────────────────────"
  cat ".specify/memory/constitution.md"
  echo ""
fi

# Feature specs for current branch
if [[ -d ".specify/features" ]]; then
  FEATURE_SPECS=$(find ".specify/features" -name "spec.md" 2>/dev/null || true)
  if [[ -n "$FEATURE_SPECS" ]]; then
    echo "── Feature Specs ───────────────────────────"
    while IFS= read -r spec; do
      FEATURE_DIR=$(dirname "$spec" | xargs basename)
      echo "  Feature: $FEATURE_DIR"
      cat "$spec"
      echo ""
    done <<< "$FEATURE_SPECS"
  fi
fi

exit 0
