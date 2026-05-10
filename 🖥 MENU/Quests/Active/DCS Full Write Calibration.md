---
quest_id: QST-DCS-FULL-WRITE-CALIBRATION
name: "DCS Full Write Calibration"
status: active
category: system
tier: rare
xp_reward: 300
achievement_unlocks:
  - DCS-SYS-003
title_reward: "Full Write Calibrator"
created: 2026-05-10
due:
progress_current: 0
progress_target: 5
quest_type: manual
xp4l_rule_id: dcs-full-write-calibration
tags:
  - quest
  - system
  - dcs
  - codex-skill
---

# DCS Full Write Calibration

## Objective
The DCS forge now rejects empty shells, but the next gate is subtler: prove that `write` mode produces useful topic documents across real subjects, not just sections with enough words. Build a small calibration lane with example topics, expected quality signals, failure cases, and a repeatable review loop so future `$dcs-doc` changes can be judged against actual full-write behavior.

## Tasks
- [ ] Select calibration topics
  - [ ] Choose at least one Codex/tooling topic
  - [ ] Choose at least one project or product topic
  - [ ] Choose at least one abstract/system topic
  - [ ] Include one intentionally weak or undersourced topic as a failure case
- [ ] Define full-write quality signals
  - [ ] Convert the anti-scaffold rule into a review rubric
  - [ ] Define what counts as topic-specific content beyond word count
  - [ ] Define how assumptions, missing sources, and source labels should appear
- [ ] Build calibration examples
  - [ ] Generate or preserve one passing `write` document per topic
  - [ ] Preserve one failing thin/scaffold example
  - [ ] Record validator command lines and expected outcomes
- [ ] Add repeatable validation workflow
  - [ ] Decide whether examples live inside the skill or the skills README area
  - [ ] Add a lightweight regression command or checklist
  - [ ] Verify `map`, `rcs`, layer modes, and `write` mode stay distinct
- [ ] Review and close evidence
  - [ ] Run the calibration set after one real `$dcs-doc` use
  - [ ] Record pass/fail notes in the quest
  - [ ] Decide whether stricter semantic checks belong in code, docs, or manual review

## Task Order Map
```mermaid
flowchart TD
    TASK_A[Select calibration topics] --> TASK_A_1[Choose at least one Codex/tooling topic]
    TASK_A --> TASK_A_2[Choose at least one project or product topic]
    TASK_A --> TASK_A_3[Choose at least one abstract/system topic]
    TASK_A --> TASK_A_4[Include one intentionally weak or undersourced topic as a failure case]
    TASK_A --> TASK_B[Define full-write quality signals]
    TASK_B --> TASK_B_1[Convert the anti-scaffold rule into a review rubric]
    TASK_B --> TASK_B_2[Define what counts as topic-specific content beyond word count]
    TASK_B --> TASK_B_3[Define how assumptions, missing sources, and source labels should appear]
    TASK_B --> TASK_C[Build calibration examples]
    TASK_C --> TASK_C_1[Generate or preserve one passing write document per topic]
    TASK_C --> TASK_C_2[Preserve one failing thin/scaffold example]
    TASK_C --> TASK_C_3[Record validator command lines and expected outcomes]
    TASK_C --> TASK_D[Add repeatable validation workflow]
    TASK_D --> TASK_D_1[Decide whether examples live inside the skill or the skills README area]
    TASK_D --> TASK_D_2[Add a lightweight regression command or checklist]
    TASK_D --> TASK_D_3[Verify map, rcs, layer modes, and write mode stay distinct]
    TASK_D --> TASK_E[Review and close evidence]
    TASK_E --> TASK_E_1[Run the calibration set after one real dcs-doc use]
    TASK_E --> TASK_E_2[Record pass/fail notes in the quest]
    TASK_E --> TASK_E_3[Decide whether stricter semantic checks belong in code, docs, or manual review]

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
```

## Workflow Map
```mermaid
flowchart TD
    OPENING[DCS maturity pass leaves semantic quality opening] --> TOPICS[Calibration Topics]
    TOPICS --> RUBRIC[Full Write Rubric]
    RUBRIC --> EXAMPLES[Passing and Failing Examples]
    EXAMPLES --> REGRESSION[Repeatable Validation Workflow]
    REGRESSION --> REALUSE[Run After Real dcs-doc Use]
    REALUSE --> DECISION[Code Check vs Doc Rule vs Manual Review]

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
```

## Rewards
- XP: 300
- Achievement Unlocks: DCS-SYS-003
- Title Reward: Full Write Calibrator

## Completion Proof
- A small calibration set exists with passing and failing `$dcs-doc` examples.
- The anti-scaffold rule has an audit rubric that catches generic but wordy output.
- The validation workflow proves `write` is the default full-document path without breaking scaffold-only modes.
- The final notes decide whether future semantic checks should be automated or kept as manual review.

## Source Notes
- Unlocked by [DCS Doc Maturity Pass.md](F:\XP4Life\🖥 MENU\Quests\Active\DCS Doc Maturity Pass.md).
- The completed maturity pass added mechanical controls: fence handling, content sufficiency checks, source labels, note quoting, clean CLI errors, and docs alignment.
- Remaining opening: mechanical sufficiency is not the same as semantic quality.

## Notes
- Hand-authored from the findings, completions, and unlocked opening discovered during the `$dcs-doc` maturity session.
