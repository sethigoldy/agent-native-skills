---
name: verification-evals
description: Verify that an implementation actually satisfies its specification using tests, evals, regression checks, invariants, acceptance criteria, and runtime evidence. Use after code changes, migrations, refactors, bug fixes, or generated code that needs trustworthy validation.
---
# Verification and Evals

Verification is a first-class engineering deliverable.

## Procedure

1. Start from intended outcome and acceptance criteria, not only implementation.
2. Choose evidence appropriate to the risk: unit, integration, end-to-end, property, performance, security, migration, or manual checks.
3. Run the narrowest useful checks first, then widen coverage as risk requires.
4. Inspect failures and distinguish product defects, test defects, environment defects, and unrelated failures.
5. Verify critical invariants and regressions explicitly.
6. Report evidence, not confidence language. Say what was actually checked.

Passing tests is not sufficient when the tests do not exercise the user's real success criteria.
