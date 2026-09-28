---
name: intent-spec
description: Turn a vague, ambiguous, new, or cross-cutting engineering request into an explicit specification with goals, non-goals, constraints, trade-offs, acceptance criteria, edge cases, and success metrics before implementation. Use when the user asks to build a feature, redesign behavior, migrate a system, or when requirements are unclear.
---
# Intent Specification

Treat intent as a first-class engineering artifact.

## Procedure

1. Restate the problem in terms of the user or business outcome.
2. Separate goals from non-goals.
3. Extract functional and non-functional requirements.
4. Record constraints, assumptions, dependencies, and backwards-compatibility requirements.
5. Identify trade-offs and decisions that should not be silently invented during implementation.
6. Define measurable acceptance criteria and important edge cases.
7. Define what evidence would prove the work succeeded.
8. If implementation reveals a requirement conflict, return to the spec instead of silently changing intent.

Do not write production code merely to resolve ambiguity. Make ambiguity explicit and use available repository context to resolve it when possible.
