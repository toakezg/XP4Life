---
quest_id: QST-DCS-WORKFLOW-RELAY
name: "DCS Workflow Relay"
status: active
category: system
tier: rare
xp_reward: 280
achievement_unlocks:
  - DCS-SYS-003
title_reward: "Workflow Cartographer"
created: 2026-05-10
due:
progress_current: 4
progress_target: 5
quest_type: manual
xp4l_rule_id: dcs-workflow-relay
tags:
  - quest
  - system
  - dcs
  - workflow
  - xp4l
  - shared-workflows
---
# DCS Workflow Relay

## Objective
Keep the DCS workflow from living only inside one repo. Carry the repeatable check loop into a shared, stage-aware maintenance path, prove the stable evidence still holds, and leave behind a short prompt that another operator can pick up without re-deriving the route.

## Tasks
- [x] Ground the repeated checks
  - [x] Re-read the DCS packet and current workflow note
  - [x] Verify the repaired `.venv` and the graph-collapse result
- [x] Build the reusable workflow note
  - [x] Add universal DCS workflow framing
  - [x] Record improvements and weaknesses
  - [x] Add stage-aware sequencing
- [x] Add the prompt-ready entry forms
  - [x] Add the reusable prompt structure
  - [x] Add the short prompt
- [x] Anchor the shared workflows home
  - [x] Point the note to `F:\toakezg\workflows`
  - [x] Mark project docs as local evidence
- [ ] Promote the workflow README to the shared home
  - [ ] Create or sync the reusable workflow README under `F:\toakezg\workflows`
  - [x] Keep project note and shared note aligned ✅ 2026-05-10
  - [ ] Confirm future runs can start from the shared root

## Task Order Map
```dataviewjs
const allTasks = dv.current().file.tasks.array();

const doneByText = Object.fromEntries(
  allTasks.map(t => [t.text.replace(/\s+/g, " ").trim(), t.completed])
);

const taskNodes = {
  "Ground the repeated checks": "GROUND",
  "Re-read the DCS packet and current workflow note": "GROUND_1",
  "Verify the repaired `.venv` and the graph-collapse result": "GROUND_2",
  "Build the reusable workflow note": "BUILD",
  "Add universal DCS workflow framing": "BUILD_1",
  "Record improvements and weaknesses": "BUILD_2",
  "Add stage-aware sequencing": "BUILD_3",
  "Add the prompt-ready entry forms": "PROMPT",
  "Add the reusable prompt structure": "PROMPT_1",
  "Add the short prompt": "PROMPT_2",
  "Anchor the shared workflows home": "HOME",
  "Point the note to `F:\\toakezg\\workflows`": "HOME_1",
  "Mark project docs as local evidence": "HOME_2",
  "Promote the workflow README to the shared home": "PROMOTE",
  "Create or sync the reusable workflow README under `F:\\toakezg\\workflows`": "PROMOTE_1",
  "Keep project note and shared note aligned": "PROMOTE_2",
  "Confirm future runs can start from the shared root": "PROMOTE_3"
};

const doneNodes = [];
for (const [taskText, nodeId] of Object.entries(taskNodes)) {
  if (doneByText[taskText]) doneNodes.push(nodeId);
}

const completeCount = allTasks.filter(t => t.completed).length;
dv.paragraph(`Task map progress: **${completeCount}/${allTasks.length}** checklist items complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    GROUND[Ground the repeated checks] --> GROUND_1[Re-read the DCS packet and current workflow note]
    GROUND --> GROUND_2[Verify the repaired .venv and the graph-collapse result]
    GROUND --> BUILD[Build the reusable workflow note]
    BUILD --> BUILD_1[Add universal DCS workflow framing]
    BUILD --> BUILD_2[Record improvements and weaknesses]
    BUILD --> BUILD_3[Add stage-aware sequencing]
    BUILD --> PROMPT[Add the prompt-ready entry forms]
    PROMPT --> PROMPT_1[Add the reusable prompt structure]
    PROMPT --> PROMPT_2[Add the short prompt]
    PROMPT --> HOME[Anchor the shared workflows home]
    HOME --> HOME_1[Point the note to F:\\toakezg\\workflows]
    HOME --> HOME_2[Mark project docs as local evidence]
    HOME --> PROMOTE[Promote the workflow README to the shared home]
    PROMOTE --> PROMOTE_1[Create or sync the reusable workflow README under F:\\toakezg\\workflows]
    PROMOTE --> PROMOTE_2[Keep project note and shared note aligned]
    PROMOTE --> PROMOTE_3[Confirm future runs can start from the shared root]

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
  "Ground the repeated checks": ["REVIEW", "VERIFY"],
  "Build the reusable workflow note": ["BUILD", "UPDATE"],
  "Add the prompt-ready entry forms": ["SEQUENCE", "PROMPT"],
  "Anchor the shared workflows home": ["SHARED"],
  "Promote the workflow README to the shared home": ["PROMOTE", "HANDOFF"]
};

const doneNodes = [];
for (const [taskText, nodes] of Object.entries(stageNodes)) {
  if (doneByText[taskText]) doneNodes.push(...nodes);
}

const completeCount = topTasks.filter(t => t.completed).length;
dv.paragraph(`Workflow progress: **${completeCount}/${topTasks.length}** task groups complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    REVIEW[Re-read evidence and current workflow note] --> STAGE[Identify where the work is at]
    STAGE --> SEQUENCE[Pick the matching sequence]
    SEQUENCE --> VERIFY[Run the smallest useful checks]
    VERIFY --> UPDATE[Fold the improvement back in]
    UPDATE --> SHARED[F:\\toakezg\\workflows]
    SHARED --> PROMOTE[Promote the reusable README]
    PROMOTE --> HANDOFF[Stop and hand off]

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
${classLine}`;

dv.paragraph("```mermaid\n" + chart + "\n```");
```

## Rewards
- XP: 280
- Achievement Unlocks: DCS-SYS-003
- Title Reward: Workflow Cartographer

## Completion Proof
- The reusable workflow note exists and is stage-aware.
- The prompt-ready short form exists for repeated maintenance runs.
- The shared workflows home is named explicitly.
- The remaining promotion gate is tracked as a deliberate open task, not forgotten state.

## Source Notes
- `docs/dcs/4-reflection/REPEATED_CHECK_WORKFLOW.md`
- `docs/dcs/4-reflection/DCS_STABLE_STRUCTURE_REVIEW_001.md`
- `docs/dcs/DCS_HANDOFF_PACKET.md`
- `F:\toakezg\workflows`

## Notes
- Hand-authored from the repeated DCS workflow evidence and the `$create-quest-from-workflow` quest pattern.
- This quest is intentionally `active`, not completed.
- The remaining open gate is the shared-workflows promotion step, which keeps the workflow growth honest and future-facing.
