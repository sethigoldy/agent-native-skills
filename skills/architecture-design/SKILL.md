---
name: architecture-design
description: Design or review system architecture for cross-cutting changes, new services, migrations, data flows, APIs, concurrency, scalability, reliability, security, or deployment. Use before implementing changes that affect system boundaries or operational behavior.
---
# Architecture Design

Work at the level of systems, boundaries, and trade-offs before individual lines of code.

## Procedure

1. Define components and ownership boundaries.
2. Trace data and control flow, including failure paths.
3. Identify external dependencies, state, concurrency, and consistency requirements.
4. Consider security, privacy, reliability, performance, scalability, and operability.
5. Compare meaningful alternatives and document the chosen trade-offs.
6. Define migration, rollout, rollback, and compatibility strategy when relevant.
7. Identify observability signals needed to detect incorrect assumptions in production.

Do not optimize a local implementation while ignoring a system-level constraint.
