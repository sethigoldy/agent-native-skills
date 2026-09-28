---
name: implementation
description: Implement an approved requirement or design in an existing codebase while preserving explicit intent, repository conventions, contracts, and constraints. Use when the task is ready for code changes after requirements or architecture are sufficiently clear.
---
# Implementation

Execute; do not silently redesign the user's intent.

## Procedure

1. Read the relevant specification, architecture notes, and repository rules.
2. Make the smallest coherent change that satisfies stated intent.
3. Reuse existing patterns and abstractions where they fit.
4. Keep changes reviewable and avoid unrelated cleanup.
5. Add or update tests and instrumentation required by the intended behavior.
6. If a discovered constraint conflicts with approved intent, stop at the decision boundary and surface the conflict.
7. Before declaring success, hand the result to verification.

Prefer explicit decisions over hidden assumptions.
