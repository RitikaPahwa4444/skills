#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
canonical="$root/testing/android-instrumented-test-overhaul"

for target in \
  "$root/.github/skills/android-instrumented-test-overhaul" \
  "$root/.agents/skills/android-instrumented-test-overhaul"; do
  if ! diff -ru --exclude=.DS_Store "$canonical" "$target"; then
    echo "Skill mirror is out of sync: ${target#"$root/"}" >&2
    exit 1
  fi
done

echo "Skill mirrors match the canonical source."
