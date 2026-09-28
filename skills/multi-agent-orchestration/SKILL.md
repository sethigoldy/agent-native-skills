---
name: multi-agent-orchestration
description: Decompose a complex engineering task across specialized agents and coordinate planner, implementer, tester, reviewer, security, and risk roles with explicit inputs, outputs, dependencies, and human decision boundaries. Use when a task benefits from parallel or staged agent execution.
---
# Multi-Agent Orchestration

Delegate work, not judgment.

## Procedure

1. Start with the intent/spec and define final acceptance criteria.
2. Decompose work into independently understandable tasks with explicit inputs and outputs.
3. Assign the smallest useful number of specialized roles.
4. Prefer independent verification paths for important decisions.
5. Keep agent context scoped; do not broadcast every artifact unnecessarily.
6. Define synchronization points and disagreement handling.
7. Escalate high-risk or ambiguous decisions to the human decision boundary.
8. Finish with integrated verification against the original intent.

Avoid agent sprawl. Add another agent only when it contributes a distinct capability or independent verification path.
