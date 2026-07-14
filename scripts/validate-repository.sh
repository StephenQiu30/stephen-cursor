#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "README.md"
  "CURSOR.md"
  "CURSOR.local.md"
  "WORKFLOW.md"
  ".env.example"
  ".cursor/skills/agent-browser/SKILL.md"
  ".cursor/skills/harness-local-server/SKILL.md"
  ".cursor/skills/harness-playwright-evidence/SKILL.md"
  ".cursor/skills/harness-linear-loop/SKILL.md"
  ".cursor/skills/harness-quality-gate/SKILL.md"
  ".cursor/skills/debug/SKILL.md"
  ".cursor/skills/commit/SKILL.md"
  ".cursor/skills/pull/SKILL.md"
  ".cursor/skills/push/SKILL.md"
  ".cursor/skills/land/SKILL.md"
  ".cursor/skills/land/land_watch.py"
  ".cursor/skills/linear/SKILL.md"
  ".github/pull_request_template.md"
  "docs/README.md"
  "docs/prd/README.md"
  "docs/plans/README.md"
  "docs/design/README.md"
  "docs/acceptance/README.md"
  "docs/operations/README.md"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    printf 'Missing required file: %s\n' "$file" >&2
    exit 1
  fi
done

for script in scripts/*.sh; do
  [[ -f "$script" ]] || continue
  bash -n "$script"
done

python -m py_compile .cursor/skills/land/land_watch.py

if [[ -d .agents ]]; then
  printf 'Unexpected generated directory: .agents\n' >&2
  exit 1
fi

if [[ -f skills-lock.json ]]; then
  printf 'Unexpected generated lock file: skills-lock.json\n' >&2
  exit 1
fi
