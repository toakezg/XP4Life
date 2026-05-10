---
quest_id: QST-VF-WFB-RESUME-FLAG-REPAIR
name: "Workflow B Resume Flag Repair"
status: active
category: system
tier: uncommon
xp_reward: 220
achievement_unlocks:
  - VF-OPS-WFB-002
title_reward: "Resume Keeper I"
created: 2026-05-10
due:
progress_current: 1
progress_target: 5
quest_type: manual
xp4l_rule_id: vaultforge-workflow-b-resume-flag-repair
tags:
  - quest
  - system
  - ops
  - vaultforge
  - xp4l
---
# Workflow B Resume Flag Repair

## Objective
Patch the one loose switch in the Workflow B control room. A resume command that claims execution must carry the execution flag, and the fix needs proof that plan-only and execute-mode handoffs still tell the truth.

## Tasks
- [x] Confirm the current bug shape
  - [x] Read the active root task `root-workflow-b-resume-execute-flag`.
  - [x] Inspect generated resume commands in recent Workflow B run packets.
  - [x] Identify exactly where `Execute: True` loses `--execute`.
- [ ] Patch the command builder
  - [ ] Update only the Workflow B controller or prompt/handoff code that emits resume commands.
  - [ ] Preserve existing arguments, quoting, lane selection, cycle budget, hard-gate mode, and commit mode.
- [ ] Add focused verification
  - [ ] Add or update a test for execute-mode resume command emission.
  - [ ] Add or update a test for plan-only resume command emission.
- [ ] Run checks
  - [ ] Run the Workflow B unit or smoke tests already used by the repo.
  - [ ] Run a no-execute packet generation check if safe.
- [ ] Record the repair
  - [ ] Update `TASKS.md` and `CHANGELOG.md`.
  - [ ] Note any remaining Workflow B run-packet risks separately.

## Workflow Map
```mermaid
flowchart TD
    START[Start from active root task] --> INSPECT[Inspect generated resume command source]
    INSPECT --> PATCH[Patch command emission]
    PATCH --> TESTS[Add execute and plan-only verification]
    TESTS --> CHECKS[Run focused checks]
    CHECKS --> RECORD[Update task and changelog records]
    RECORD --> DONE[Resume command truth restored]
```

## Rewards
- XP: 220
- Achievement Unlocks: VF-OPS-WFB-002
- Title Reward: Resume Keeper I

## Completion Proof
- A resume command generated from execute-mode state includes `--execute`.
- A resume command generated from plan-only state does not imply execution.
- Tests or smoke output prove both shapes.
- Root `TASKS.md` and `CHANGELOG.md` record the repair.

## Source Notes
- `F:\vaultforge\TASKS.md`
- `F:\vaultforge\MULTI_AGENT_WORKFLOW_B.md`
- `F:\vaultforge\workflow_b_controller.py`
- `F:\vaultforge\runs\workflow-b\`
- `F:\XP4Life\🖥 MENU\Quests\VaultForge XP4L\Workflow B Resume Flag Repair Proposal.md`

## Notes
- Promoted from the VaultForge XP4L proposal draft on 2026-05-10.
- This quest is intentionally `active`, not completed.
