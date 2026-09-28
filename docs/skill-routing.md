# Skill routing policy

Use the smallest relevant set. Do not load every skill for every task.

## New feature / vague requirement

Use `intent-spec`, plus `product-context` when user/business outcomes matter, `codebase-explorer`, and `architecture-design` when the change crosses system boundaries.

## Bug fix

Use `codebase-explorer` when the affected area is unfamiliar, `observability-debugging` when runtime evidence is needed, `implementation`, and `verification-evals`.

## Refactor

Use `codebase-explorer`, `architecture-design` when contracts or boundaries change, `implementation`, `verification-evals`, and `risk-assessment` for high-impact changes.

## Security-sensitive change

Use `intent-spec`, `architecture-design`, `risk-assessment`, `adversarial-review`, and `verification-evals`.

## Production incident

Use `observability-debugging`, `risk-assessment`, `implementation` only after evidence supports a fix, `verification-evals`, then `incident-postmortem`.

## Multi-agent task

Use `intent-spec`, `multi-agent-orchestration`, the domain skills needed by delegated workers, `verification-evals`, and `agent-reflection`.

## Guardrails

Do not silently change requirements because implementation is inconvenient. Do not treat passing tests as proof that the user's real goal was achieved. Do not let an agent approve its own high-risk change without an independent verification path.
