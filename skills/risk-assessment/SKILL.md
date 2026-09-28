---
name: risk-assessment
description: Classify the blast radius of a code change, migration, deployment, security change, or automated action and determine the appropriate verification and human-review boundary. Use for production-impacting, irreversible, security-sensitive, data-changing, or high-scale operations.
---
# Risk Assessment

Match autonomy to blast radius.

## Procedure

1. Identify affected users, systems, data, and environments.
2. Classify reversibility, failure probability, impact, and detection quality.
3. Identify whether the change alters security boundaries, persistent data, external contracts, or production availability.
4. Select an appropriate control level: autonomous, automated review, staged rollout, or mandatory human approval.
5. Define rollback and containment before execution for high-risk changes.
6. Require stronger independent verification as impact or irreversibility increases.

Do not use a low-risk path simply because implementation is technically easy.
