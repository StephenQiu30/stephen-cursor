#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "README.md"
  "CURSOR.md"
  "CURSOR.local.md"
  "WORKFLOW.md"
  "openspec/config.yaml"
  "openspec/specs/agent-governance/spec.md"
  ".env.example"
  ".cursor/skills/agent-browser/SKILL.md"
  ".cursor/skills/openspec-new-change/SKILL.md"
  ".cursor/skills/openspec-apply-change/SKILL.md"
  ".cursor/skills/openspec-verify-change/SKILL.md"
  ".cursor/skills/harness-local-server/SKILL.md"
  ".cursor/skills/harness-playwright-evidence/SKILL.md"
  ".cursor/skills/harness-linear-loop/SKILL.md"
  ".cursor/skills/harness-quality-gate/SKILL.md"
  ".cursor/skills/using-superpowers/SKILL.md"
  ".cursor/skills/test-driven-development/SKILL.md"
  ".cursor/skills/executing-plans/SKILL.md"
  ".cursor/skills/verification-before-completion/SKILL.md"
  "scripts/vendor-superpowers-skills.sh"
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
  test -f "$file"
done

grep -q "tracker:" WORKFLOW.md
grep -q "kind: linear" WORKFLOW.md
grep -q "project_slug" WORKFLOW.md
grep -q "## Cursor Workpad" WORKFLOW.md
grep -q "command: cursor-agent" WORKFLOW.md
grep -q "Human Review" WORKFLOW.md
grep -q "harness-quality-gate" WORKFLOW.md
grep -q "superpowers" WORKFLOW.md

test ! -d .agents
test ! -f skills-lock.json

git diff --check
