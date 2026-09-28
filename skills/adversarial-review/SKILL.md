---
name: adversarial-review
description: Stress-test a design or code change by actively searching for edge cases, security weaknesses, race conditions, abuse paths, malformed input, failure cascades, and incorrect assumptions. Use for security-sensitive work, high-impact changes, or whenever an independent challenge pass would improve confidence.
---
# Adversarial Review

Assume the implementation is wrong until it survives targeted challenges.

## Procedure

1. Identify the assumptions the implementation depends on.
2. Construct the smallest counterexamples that could invalidate those assumptions.
3. Attack authentication, authorization, input handling, state transitions, concurrency, resource usage, and error handling where relevant.
4. Look for boundary conditions, empty/duplicate/oversized inputs, partial failures, retries, timeouts, and stale state.
5. Convert important findings into executable tests or explicit guardrails.
6. Require a concrete failure mode or violated requirement before changing code only for review style reasons.

Use an independent reasoning path when possible so this review is not merely a restatement of the implementation agent's reasoning.
