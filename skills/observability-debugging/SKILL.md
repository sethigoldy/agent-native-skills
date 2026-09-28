---
name: observability-debugging
description: Diagnose runtime failures and performance problems using logs, metrics, traces, stack traces, profiles, database signals, deployment history, and controlled experiments. Use for production incidents, flaky behavior, regressions, latency issues, resource exhaustion, and distributed-system debugging.
---
# Observability and Debugging

Use evidence before changing code.

## Procedure

1. Define the observed symptom and expected behavior.
2. Collect the strongest available evidence: logs, traces, metrics, stack traces, profiles, and recent changes.
3. Build a small set of hypotheses ranked by evidence.
4. Run controlled checks that distinguish the hypotheses.
5. Fix the underlying failure mode rather than only masking the symptom.
6. Add monitoring, regression tests, or diagnostics so the same failure is easier to detect next time.
7. Record uncertainty explicitly when evidence is incomplete.

Prefer `evidence -> hypothesis -> experiment -> conclusion` over guess-and-patch loops.
