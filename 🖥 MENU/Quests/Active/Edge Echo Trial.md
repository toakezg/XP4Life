---
quest_id: QST-DCS-EDGE-ECHO-TRIAL
name: "Edge Echo Trial"
status: active
category: system
tier: rare
xp_reward: 220
achievement_unlocks:
  - DCS-SYS-004
title_reward: "Echo Warden"
created: 2026-05-10
due:
progress_current: 4
progress_target: 5
quest_type: manual
xp4l_rule_id: dcs-edge-echo-trial
tags:
  - quest
  - system
  - dcs
  - graph
  - semantics
  - xp4l
  - shared-workflows
---
# Edge Echo Trial

## Objective
Enter the mirror hall where graph edges repeat their own names, prove which echoes are true and which are just reflections, and carry the verdict back to the forge so future runs start from a clean rule instead of a guessed symmetry.

## Tasks
- [x] Reopen the mirror room
  - [x] Re-read the DCS packet and the graph-semantics audit note.
  - [x] Confirm the repaired `.venv` and the endpoint integrity stay intact.
- [x] Count the echoes
  - [x] List the reciprocal pairs hidden in `data/network.yaml`.
  - [x] Confirm that 19 YAML edge records collapse to 17 runtime edges under `nx.Graph()`.
- [x] Speak the verdict
  - [x] Record that reciprocal records are redundant under the current undirected model.
  - [x] Keep the conclusion data-only and tiny instead of changing graph behavior.
- [x] Mark the shared hearth
  - [x] Anchor the result in the reusable workflow note.
  - [x] Keep `F:\toakezg\workflows` as the shared landing point for future workflow growth.
- [ ] Hand off the next gate
  - [ ] Leave the next bounded prompt in the workflow form that matches the current stage.
  - [ ] Keep this quest as a fun companion route, not a duplicate of the workflow relay quest.

## Task Order Map
```dataviewjs
const allTasks = dv.current().file.tasks.array();

const doneByText = Object.fromEntries(
  allTasks.map(t => [t.text.replace(/\s+/g, " ").trim(), t.completed])
);

const taskNodes = {
  "Reopen the mirror room": "REOPEN",
  "Re-read the DCS packet and the graph-semantics audit note.": "REOPEN_1",
  "Confirm the repaired `.venv` and the endpoint integrity stay intact.": "REOPEN_2",
  "Count the echoes": "COUNT",
  "List the reciprocal pairs hidden in `data/network.yaml`.": "COUNT_1",
  "Confirm that 19 YAML edge records collapse to 17 runtime edges under `nx.Graph()`.": "COUNT_2",
  "Speak the verdict": "VERDICT",
  "Record that reciprocal records are redundant under the current undirected model.": "VERDICT_1",
  "Keep the conclusion data-only and tiny instead of changing graph behavior.": "VERDICT_2",
  "Mark the shared hearth": "HEARTH",
  "Anchor the result in the reusable workflow note.": "HEARTH_1",
  "Keep `F:\\toakezg\\workflows` as the shared landing point for future workflow growth.": "HEARTH_2",
  "Hand off the next gate": "HANDOFF",
  "Leave the next bounded prompt in the workflow form that matches the current stage.": "HANDOFF_1",
  "Keep this quest as a fun companion route, not a duplicate of the workflow relay quest.": "HANDOFF_2"
};

const doneNodes = [];
for (const [taskText, nodeId] of Object.entries(taskNodes)) {
  if (doneByText[taskText]) doneNodes.push(nodeId);
}

const completeCount = allTasks.filter(t => t.completed).length;
dv.paragraph(`Task map progress: **${completeCount}/${allTasks.length}** checklist items complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    REOPEN[Reopen the mirror room] --> REOPEN_1[Re-read the DCS packet and the graph-semantics audit note.]
    REOPEN --> REOPEN_2[Confirm the repaired .venv and the endpoint integrity stay intact.]
    REOPEN --> COUNT[Count the echoes]
    COUNT --> COUNT_1[List the reciprocal pairs hidden in data/network.yaml.]
    COUNT --> COUNT_2[Confirm that 19 YAML edge records collapse to 17 runtime edges under nx.Graph().]
    COUNT --> VERDICT[Speak the verdict]
    VERDICT --> VERDICT_1[Record that reciprocal records are redundant under the current undirected model.]
    VERDICT --> VERDICT_2[Keep the conclusion data-only and tiny instead of changing graph behavior.]
    VERDICT --> HEARTH[Mark the shared hearth]
    HEARTH --> HEARTH_1[Anchor the result in the reusable workflow note.]
    HEARTH --> HEARTH_2[Keep F:\\toakezg\\workflows as the shared landing point for future workflow growth.]
    HEARTH --> HANDOFF[Hand off the next gate]
    HANDOFF --> HANDOFF_1[Leave the next bounded prompt in the workflow form that matches the current stage.]
    HANDOFF --> HANDOFF_2[Keep this quest as a fun companion route, not a duplicate of the workflow relay quest.]

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
  "Reopen the mirror room": ["REVIEW", "VERIFY"],
  "Count the echoes": ["COUNT", "AUDIT"],
  "Speak the verdict": ["DECIDE"],
  "Mark the shared hearth": ["SHARED", "RECORD"],
  "Hand off the next gate": ["PROMPT", "HANDOFF"]
};

const doneNodes = [];
for (const [taskText, nodes] of Object.entries(stageNodes)) {
  if (doneByText[taskText]) doneNodes.push(...nodes);
}

const completeCount = topTasks.filter(t => t.completed).length;
dv.paragraph(`Workflow progress: **${completeCount}/${topTasks.length}** task groups complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    REVIEW[Re-read evidence and current workflow note] --> VERIFY[Confirm stable graph evidence]
    VERIFY --> COUNT[Count the echoes]
    COUNT --> AUDIT[Audit the reciprocal pairs]
    AUDIT --> DECIDE[Set the verdict]
    DECIDE --> RECORD[Record the decision]
    RECORD --> SHARED[F:\\toakezg\\workflows]
    SHARED --> PROMPT[Hand off a reusable prompt]
    PROMPT --> HANDOFF[Stop and hand off]

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
${classLine}`;

dv.paragraph("```mermaid\n" + chart + "\n```");
```

## Rewards
- XP: 220
- Achievement Unlocks: DCS-SYS-004
- Title Reward: Echo Warden

## Completion Proof
- The reciprocal-edge verdict is recorded against the current undirected graph model.
- The workflow note keeps the shared-workflow landing point explicit.
- The next bounded prompt is still stage-aware, not flattened into one generic repeat.

## Source Notes
- `docs/dcs/3-operations/GRAPH_SEMANTICS_AUDIT.md`
- `docs/dcs/4-reflection/REPEATED_CHECK_WORKFLOW.md`
- `docs/dcs/DCS_HANDOFF_PACKET.md`
- `F:\toakezg\workflows`

## Notes
- This is a game-like companion quest, not a duplicate of `DCS Workflow Relay`.
- The mission is built from the already-verified graph-semantics finding and the workflow-growth process.
- The remaining open gate is the next bounded prompt handoff, which keeps the quest alive without reopening the graph model decision.
