---
quest_id: QST-DCS-SHARED-HEARTH-PROMOTION
name: "Shared Hearth Promotion"
status: active
category: system
tier: rare
xp_reward: 240
achievement_unlocks:
  - DCS-SYS-005
title_reward: "Hearth Keeper"
created: 2026-05-10
due:
progress_current: 1
progress_target: 4
quest_type: manual
xp4l_rule_id: dcs-shared-hearth-promotion
tags:
  - quest
  - system
  - dcs
  - workflow
  - shared-workflows
  - xp4l
---
# Shared Hearth Promotion

## Objective
Carry the reusable DCS workflow into the shared hearth at `F:\toakezg\workflows`, prove the route still lines up with the stage-aware maintenance path, and leave behind a stable entry point so future operators can start from the shared root instead of rediscovering the trail.

## Tasks
- [ ] Reopen the hearth map
  - [ ] Re-read the current DCS packet, the reusable workflow note, and the shared-workflows rule.
  - [ ] Confirm the work is sitting at the promotion gate, not a fresh graph audit.
- [ ] Forge the shared README
  - [ ] Create or sync the reusable workflow README under `F:\toakezg\workflows`.
  - [ ] Keep the reusable prompt and stage-aware sequence aligned with the project note.
- [ ] Seal the route
  - [ ] Keep the project note and shared note in sync.
  - [ ] Preserve the stable/one-off split so the shared note stays lean.
- [ ] Prove the path
  - [ ] Confirm future runs can start from `F:\toakezg\workflows`.
  - [ ] Leave a compact next prompt that lands at the shared root cleanly.

## Task Order Map
```dataviewjs
const allTasks = dv.current().file.tasks.array();

const doneByText = Object.fromEntries(
  allTasks.map(t => [t.text.replace(/\s+/g, " ").trim(), t.completed])
);

const taskNodes = {
  "Reopen the hearth map": "REOPEN",
  "Re-read the current DCS packet, the reusable workflow note, and the shared-workflows rule.": "REOPEN_1",
  "Confirm the work is sitting at the promotion gate, not a fresh graph audit.": "REOPEN_2",
  "Forge the shared README": "FORGE",
  "Create or sync the reusable workflow README under `F:\\toakezg\\workflows`.": "FORGE_1",
  "Keep the reusable prompt and stage-aware sequence aligned with the project note.": "FORGE_2",
  "Seal the route": "SEAL",
  "Keep the project note and shared note in sync.": "SEAL_1",
  "Preserve the stable/one-off split so the shared note stays lean.": "SEAL_2",
  "Prove the path": "PROVE",
  "Confirm future runs can start from `F:\\toakezg\\workflows`.": "PROVE_1",
  "Leave a compact next prompt that lands at the shared root cleanly.": "PROVE_2"
};

const doneNodes = [];
for (const [taskText, nodeId] of Object.entries(taskNodes)) {
  if (doneByText[taskText]) doneNodes.push(nodeId);
}

const completeCount = allTasks.filter(t => t.completed).length;
dv.paragraph(`Task map progress: **${completeCount}/${allTasks.length}** checklist items complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    REOPEN[Reopen the hearth map] --> REOPEN_1[Re-read the current DCS packet, the reusable workflow note, and the shared-workflows rule.]
    REOPEN --> REOPEN_2[Confirm the work is sitting at the promotion gate, not a fresh graph audit.]
    REOPEN --> FORGE[Forge the shared README]
    FORGE --> FORGE_1[Create or sync the reusable workflow README under F:\\toakezg\\workflows.]
    FORGE --> FORGE_2[Keep the reusable prompt and stage-aware sequence aligned with the project note.]
    FORGE --> SEAL[Seal the route]
    SEAL --> SEAL_1[Keep the project note and shared note in sync.]
    SEAL --> SEAL_2[Preserve the stable/one-off split so the shared note stays lean.]
    SEAL --> PROVE[Prove the path]
    PROVE --> PROVE_1[Confirm future runs can start from F:\\toakezg\\workflows.]
    PROVE --> PROVE_2[Leave a compact next prompt that lands at the shared root cleanly.]

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
${classLine}`;

dv.paragraph("```mermaid\n" + chart + "\n```");
```

## Workflow Map
```dataviewjs
const topTasks = dv.current().file.tasks
  .where(t => !t.parent)
  .array();

const doneByText = Object.fromEntries(
  topTasks.map(t => [t.text.replace(/\s+/g, " ").trim(), t.completed])
);

const stageNodes = {
  "Reopen the hearth map": ["REVIEW", "STAGE"],
  "Forge the shared README": ["SYNC", "UPDATE"],
  "Seal the route": ["ALIGN", "STABLE"],
  "Prove the path": ["VERIFY", "HANDOFF"]
};

const doneNodes = [];
for (const [taskText, nodes] of Object.entries(stageNodes)) {
  if (doneByText[taskText]) doneNodes.push(...nodes);
}

const completeCount = topTasks.filter(t => t.completed).length;
dv.paragraph(`Workflow progress: **${completeCount}/${topTasks.length}** task groups complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    REVIEW[Re-read evidence and current workflow note] --> STAGE[Identify the promotion-gate stage]
    STAGE --> SYNC[Sync the reusable README]
    SYNC --> UPDATE[Fold the shared-root rule back in]
    UPDATE --> ALIGN[Keep project and shared notes aligned]
    ALIGN --> STABLE[Preserve the stable/one-off split]
    STABLE --> VERIFY[Confirm the shared root works]
    VERIFY --> HANDOFF[Stop and hand off]

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
${classLine}`;

dv.paragraph("```mermaid\n" + chart + "\n```");
```

## Rewards
- XP: 240
- Achievement Unlocks: DCS-SYS-005
- Title Reward: Hearth Keeper

## Completion Proof
- The reusable workflow README exists or has been synced under `F:\toakezg\workflows`.
- The shared-root entry point is explicit and stage-aware.
- The project note and shared note remain aligned without turning the shared note into a dump of local detail.

## Source Notes
- `docs/dcs/4-reflection/REPEATED_CHECK_WORKFLOW.md`
- `docs/dcs/4-reflection/DCS_STABLE_STRUCTURE_REVIEW_001.md`
- `docs/dcs/DCS_HANDOFF_PACKET.md`
- `F:\toakezg\workflows`

## Notes
- This quest is a companion route to `DCS Workflow Relay`, not a duplicate.
- Its purpose is to make the shared-workflows promotion gate feel like a playable mission.
- The shared root is the destination; the workflow note in the project remains the evidence trail.
