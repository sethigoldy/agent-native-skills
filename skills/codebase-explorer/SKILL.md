---
name: codebase-explorer
description: Build a focused mental model of an unfamiliar repository before changing code. Use for bug fixes, features, refactors, migrations, or debugging when the relevant architecture and call paths are not already known.
---
# Codebase Explorer

Understand before modifying.

## Procedure

1. Identify repository structure, entry points, and relevant modules.
2. Trace current behavior from caller to implementation to side effects.
3. Identify tests, configuration, contracts, dependencies, and operational assumptions protecting the behavior.
4. Search for neighboring implementations and repository conventions before inventing a new pattern.
5. Summarize only the context relevant to the requested change.
6. State what remains unknown before implementation.

Avoid broad repository archaeology that adds context without helping the task.
