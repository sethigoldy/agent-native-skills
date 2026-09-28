#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG="$ROOT/scripts/agents.json"
SCOPE="project"
AGENT=""
SKILL=""
DRY_RUN=0

usage() {
  echo "Usage: $0 --agent <name|all> [--scope project|global] [--skill <name>] [--dry-run]"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --agent) AGENT="${2:-}"; shift 2 ;;
    --scope) SCOPE="${2:-}"; shift 2 ;;
    --skill) SKILL="${2:-}"; shift 2 ;;
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

[[ -n "$AGENT" ]] || { usage >&2; exit 2; }
[[ "$SCOPE" == "project" || "$SCOPE" == "global" ]] || { echo "Invalid scope: $SCOPE" >&2; exit 2; }

if [[ "$AGENT" == "all" ]]; then
  AGENTS=(universal codex claude gemini cursor opencode copilot cline roo windsurf pi)
else
  AGENTS=("$AGENT")
fi

for agent in "${AGENTS[@]}"; do
  dest="$(python3 - "$CONFIG" "$agent" "$SCOPE" <<'PY'
import json, sys
cfg=json.load(open(sys.argv[1]))
agent=sys.argv[2]
scope=sys.argv[3]
if agent not in cfg:
    raise SystemExit(f"Unknown agent: {agent}")
print(cfg[agent][scope])
PY
)"

  if [[ "$SCOPE" == "project" ]]; then
    dest="$ROOT/$dest"
  else
    dest="${dest/#\~/$HOME}"
  fi

  echo "Installing $agent -> $dest"
  [[ "$DRY_RUN" -eq 1 ]] || mkdir -p "$dest"

  for skill_dir in "$ROOT/skills"/*; do
    [[ -d "$skill_dir" ]] || continue
    name="$(basename "$skill_dir")"
    [[ -z "$SKILL" || "$name" == "$SKILL" ]] || continue
    if [[ "$DRY_RUN" -eq 1 ]]; then
      echo "  + $name"
      continue
    fi
    rm -rf "$dest/$name"
    cp -R "$skill_dir" "$dest/$name"
  done
done

if [[ "$SCOPE" == "project" && ( "$AGENT" == "universal" || "$AGENT" == "all" ) ]]; then
  cat > "$ROOT/AGENTS.md" <<'EOF2'
# Agent-Native Engineering Skills

Reusable skills live under `.agents/skills/`.

Select skills based on the current request and load only the smallest relevant set. Prefer intent/specification work before implementation for ambiguous or cross-cutting changes. Treat verification, risk assessment, and feedback as first-class parts of engineering work.

See `docs/skill-routing.md` for the routing policy.
EOF2
fi

echo "Done."
