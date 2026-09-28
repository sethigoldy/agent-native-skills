# Agent-Native Engineering Skills

A portable set of coding-agent skills inspired by the AI-native engineering patterns used by Google Developers: shift left on intent, shift up on engineering judgment, orchestrate agents, verify aggressively, and continuously feed learning back into the system.

The repository uses the open `SKILL.md` format so the same skills can be installed into multiple coding agents. Many current agents can discover skills directly from `.agents/skills`; others also support native skill directories.

## Included skills

| Skill | Purpose |
|---|---|
| `intent-spec` | Turn requests into explicit goals, constraints, trade-offs, acceptance criteria, and non-goals. |
| `codebase-explorer` | Build a focused mental model of an unfamiliar repository before changes. |
| `architecture-design` | Design system boundaries, data flow, failure modes, scalability, and trade-offs. |
| `implementation` | Execute against approved intent without silently inventing requirements. |
| `verification-evals` | Verify implementation against intent with tests, evals, and evidence. |
| `adversarial-review` | Stress-test code and designs for security, correctness, and failure modes. |
| `risk-assessment` | Match autonomy and review to blast radius and reversibility. |
| `observability-debugging` | Diagnose runtime behavior with evidence and controlled experiments. |
| `incident-postmortem` | Turn failures into durable improvements to tests, rules, skills, and architecture. |
| `agent-reflection` | Capture observable lessons from agent execution and tool friction. |
| `skill-curator` | Convert recurring lessons into focused reusable skills. |
| `multi-agent-orchestration` | Coordinate planner, coder, reviewer, risk, and verification roles. |
| `product-context` | Translate user/business needs into measurable engineering outcomes. |

## How automatic selection works

Every skill has a precise `name` and `description`. Agent Skills-compatible agents receive those descriptions and decide which skills are relevant to the user's request. The repository therefore prefers small, composable skills over one giant system prompt.

A typical flow looks like:

```text
request
  -> intent / product context
  -> repository understanding
  -> architecture when needed
  -> implementation
  -> verification
  -> risk / adversarial review when needed
  -> reflection
  -> reusable learning
```

## Install

### Universal cross-agent layout

```bash
./scripts/install.sh --agent universal --scope project
```

This installs into `.agents/skills/`.

### Individual agents

```bash
./scripts/install.sh --agent codex --scope project
./scripts/install.sh --agent claude --scope project
./scripts/install.sh --agent gemini --scope project
./scripts/install.sh --agent cursor --scope project
./scripts/install.sh --agent opencode --scope project
./scripts/install.sh --agent copilot --scope project
./scripts/install.sh --agent cline --scope project
./scripts/install.sh --agent roo --scope project
./scripts/install.sh --agent windsurf --scope project
./scripts/install.sh --agent pi --scope project
```

### Everything

```bash
./scripts/install.sh --agent all --scope project
```

Global install:

```bash
./scripts/install.sh --agent codex --scope global
```

Windows PowerShell:

```powershell
./scripts/install.ps1 -Agent all -Scope project
```

## One-skill install

Useful for testing or for controlled adoption:

```bash
./scripts/install.sh --agent universal --scope project --skill verification-evals
```

## Agent coverage

The adapter map lives in `scripts/agents.json`. It currently covers Claude Code, OpenAI Codex, Gemini CLI, Cursor, OpenCode, GitHub Copilot, Cline, Roo Code, Windsurf, Pi, and the interoperable `.agents/skills` layout.

## Principles

- Intent before execution.
- Delegate tasks, not judgment.
- Verification is a first-class deliverable.
- Risk controls should scale with blast radius.
- Production failures should create reusable learning.
- Skills should remain narrow enough for reliable automatic routing.
