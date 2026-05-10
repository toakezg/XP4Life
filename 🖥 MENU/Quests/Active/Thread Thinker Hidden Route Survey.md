---
quest_id: QST-THREAD-THINKER-HIDDEN-ROUTES
name: "Thread Thinker Hidden Route Survey"
status: active
category: system
tier: rare
xp_reward: 260
achievement_unlocks:
  - DCS-SYS-004
title_reward: "Route Surveyor I"
created: 2026-05-10
due:
progress_current: 2
progress_target: 5
quest_type: manual
xp4l_rule_id: thread-thinker-hidden-route-survey
tags:
  - quest
  - system
  - dcs
  - thread-thinker
  - xp4l
---

# Thread Thinker Hidden Route Survey

## Objective
The Thread Thinker board is playable, but the useful signal is now spread across completed passes, ignored local folders, skill notes, and next-prompt gates. Survey the route: lock down what is already proven, keep the hidden machine-state out of the evidence trail, then choose the next bounded pass without letting polish, persistence, or automation slip in through the side door.

## Tasks
- [x] Inventory completed unlocks
  - [x] Confirm the six-puzzle starter pack and solve-gated flow are verified.
  - [x] Confirm DCS-5 visual diagnostics, DCS-6 deterministic helpers, and DCS-7 session loop are documented.
  - [x] Confirm the local `dcs-recursive-forge` skill has validation evidence.
- [x] Separate hidden and ignored state
  - [x] Confirm `.obsidian/`, `.venv/`, `.tmp/`, `.pip-cache/`, and generated marker-toggle screenshots are ignored.
  - [x] Record that `.tmp/` contains permission-denied pip leftovers and should stay out of evidence scans.
  - [x] Keep runtime source checks focused on tracked files and documented artifacts.
- [ ] Choose the next bounded route
  - [ ] Decide between docs-only forward test, implementation-ready DCS-3 node, or playtest-polish pass.
  - [ ] Keep DCS-7 persistence, external agents, save systems, generators, and broad platform work behind explicit approval.
  - [ ] Write the selected next prompt before editing runtime code.
- [ ] Run the selected follow-up
  - [ ] If docs-only, use a target outside Thread Thinker and write only under that target's `docs/dcs`.
  - [ ] If gameplay polish, verify in browser and tie every change to concrete playtest friction.
  - [ ] If diagnostics export is needed, add only the smallest manual copy path.
- [ ] Close the route with proof
  - [ ] Update the DCS handoff packet and progress log with exact commands and results.
  - [ ] Confirm no ignored/cache folders entered the repo evidence.
  - [ ] Write XP4Life event records for the completed follow-up without duplicating this survey event.

## Task Order Map
```dataviewjs
const allTasks = dv.current().file.tasks.array();

const doneByText = Object.fromEntries(
  allTasks.map(t => [t.text.replace(/\s+/g, " ").trim(), t.completed])
);

const taskNodes = {
  "Inventory completed unlocks": "TASK_UNLOCKS",
  "Confirm the six-puzzle starter pack and solve-gated flow are verified.": "TASK_UNLOCKS_1",
  "Confirm DCS-5 visual diagnostics, DCS-6 deterministic helpers, and DCS-7 session loop are documented.": "TASK_UNLOCKS_2",
  "Confirm the local `dcs-recursive-forge` skill has validation evidence.": "TASK_UNLOCKS_3",
  "Separate hidden and ignored state": "TASK_HIDDEN",
  "Confirm `.obsidian/`, `.venv/`, `.tmp/`, `.pip-cache/`, and generated marker-toggle screenshots are ignored.": "TASK_HIDDEN_1",
  "Record that `.tmp/` contains permission-denied pip leftovers and should stay out of evidence scans.": "TASK_HIDDEN_2",
  "Keep runtime source checks focused on tracked files and documented artifacts.": "TASK_HIDDEN_3",
  "Choose the next bounded route": "TASK_ROUTE",
  "Decide between docs-only forward test, implementation-ready DCS-3 node, or playtest-polish pass.": "TASK_ROUTE_1",
  "Keep DCS-7 persistence, external agents, save systems, generators, and broad platform work behind explicit approval.": "TASK_ROUTE_2",
  "Write the selected next prompt before editing runtime code.": "TASK_ROUTE_3",
  "Run the selected follow-up": "TASK_RUN",
  "If docs-only, use a target outside Thread Thinker and write only under that target's `docs/dcs`.": "TASK_RUN_1",
  "If gameplay polish, verify in browser and tie every change to concrete playtest friction.": "TASK_RUN_2",
  "If diagnostics export is needed, add only the smallest manual copy path.": "TASK_RUN_3",
  "Close the route with proof": "TASK_CLOSE",
  "Update the DCS handoff packet and progress log with exact commands and results.": "TASK_CLOSE_1",
  "Confirm no ignored/cache folders entered the repo evidence.": "TASK_CLOSE_2",
  "Write XP4Life event records for the completed follow-up without duplicating this survey event.": "TASK_CLOSE_3"
};

const doneNodes = [];
for (const [taskText, nodeId] of Object.entries(taskNodes)) {
  if (doneByText[taskText]) doneNodes.push(nodeId);
}

const completeCount = allTasks.filter(t => t.completed).length;
dv.paragraph(`Task map progress: **${completeCount}/${allTasks.length}** checklist items complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    TASK_UNLOCKS[Inventory completed unlocks] --> TASK_UNLOCKS_1[Six-puzzle starter pack verified]
    TASK_UNLOCKS --> TASK_UNLOCKS_2[DCS-5 6 7 documented]
    TASK_UNLOCKS --> TASK_UNLOCKS_3[dcs-recursive-forge validation evidence]
    TASK_UNLOCKS --> TASK_HIDDEN[Separate hidden and ignored state]
    TASK_HIDDEN --> TASK_HIDDEN_1[Ignored local and generated folders confirmed]
    TASK_HIDDEN --> TASK_HIDDEN_2[Permission-denied pip leftovers noted]
    TASK_HIDDEN --> TASK_HIDDEN_3[Evidence stays on tracked source and docs]
    TASK_HIDDEN --> TASK_ROUTE[Choose the next bounded route]
    TASK_ROUTE --> TASK_ROUTE_1[Pick docs-only DCS-3 node or polish]
    TASK_ROUTE --> TASK_ROUTE_2[Keep persistence agents saves generators gated]
    TASK_ROUTE --> TASK_ROUTE_3[Write selected next prompt]
    TASK_ROUTE --> TASK_RUN[Run the selected follow-up]
    TASK_RUN --> TASK_RUN_1[Docs-only target outside Thread Thinker]
    TASK_RUN --> TASK_RUN_2[Gameplay polish with browser proof]
    TASK_RUN --> TASK_RUN_3[Small manual diagnostics export if needed]
    TASK_RUN --> TASK_CLOSE[Close the route with proof]
    TASK_CLOSE --> TASK_CLOSE_1[Update handoff and progress]
    TASK_CLOSE --> TASK_CLOSE_2[Confirm ignored folders stayed out]
    TASK_CLOSE --> TASK_CLOSE_3[Write non-duplicate XP4L events]

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
  "Inventory completed unlocks": ["UNLOCKS", "DCS567", "SKILL"],
  "Separate hidden and ignored state": ["HIDDEN", "IGNORE"],
  "Choose the next bounded route": ["ROUTE", "GATES"],
  "Run the selected follow-up": ["FOLLOW"],
  "Close the route with proof": ["PROOF"]
};

const doneNodes = [];
for (const [taskText, nodes] of Object.entries(stageNodes)) {
  if (doneByText[taskText]) doneNodes.push(...nodes);
}

const completeCount = topTasks.filter(t => t.completed).length;
dv.paragraph(`Workflow progress: **${completeCount}/${topTasks.length}** task groups complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    SOURCE[game-nanny source and Thread Thinker docs] --> UNLOCKS[Completed playable unlocks]
    UNLOCKS --> DCS567[DCS-5 visual diagnostics DCS-6 helpers DCS-7 session loop]
    DCS567 --> SKILL[dcs-recursive-forge skill validation]
    SOURCE --> HIDDEN[Hidden and local machine state]
    HIDDEN --> IGNORE[Gitignore and ignored checks]
    SKILL --> ROUTE[Next bounded route]
    IGNORE --> ROUTE
    ROUTE --> GATES{Approval gates}
    GATES -->|docs-only| FOLLOW[Forward-test outside Thread Thinker]
    GATES -->|playtest friction| POLISH[Narrow gameplay polish]
    GATES -->|diagnostics needed| COPY[Manual diagnostics copy]
    FOLLOW --> PROOF[Handoff progress and event proof]
    POLISH --> PROOF
    COPY --> PROOF

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
${classLine}`;

dv.paragraph("```mermaid\n" + chart + "\n```");
```

## Rewards
- XP: 260
- Achievement Unlocks: DCS-SYS-004
- Title Reward: Route Surveyor I

## Completion Proof
- Selected next route is written as a bounded prompt.
- Follow-up pass is verified with exact commands or browser proof.
- `docs/dcs/DCS_HANDOFF_PACKET.md` and `progress.md` are updated with the result.
- Ignored/cache folders remain out of repo evidence and XP4Life event context.

## Source Notes
- `F:\projects\game-nanny\thread-thinker\docs\dcs\DCS_HANDOFF_PACKET.md`
- `F:\projects\game-nanny\thread-thinker\progress.md`
- `F:\projects\game-nanny\thread-thinker\docs\core\PLAN.md`
- `F:\projects\game-nanny\thread-thinker\docs\core\TASKS.md`
- `F:\projects\game-nanny\thread-thinker\docs\dcs\4-reflection\DCS_STABILITY_REVIEW_001.md`
- `F:\projects\game-nanny\.gitignore`

## Notes
- Hand-authored from the live repo survey on 2026-05-10.
- The hidden state found during inspection is operational evidence only, not quest content to import into the repo.
