---
quest_id: QST-XP4L-WATCHER-RELIABILITY-PASS
name: "Quest Watcher Reliability Pass"
status: active
category: system
tier: uncommon
xp_reward: 220
achievement_unlocks:
  - VF-SYS-003
title_reward: "Watch Keeper I"
created: 2026-05-10
due:
progress_current: 0
progress_target: 5
quest_type: manual
xp4l_rule_id: quest-watcher-reliability-pass
tags:
  - quest
  - system
  - watcher
  - xp4l
  - vaultforge
---

# Quest Watcher Reliability Pass

## Objective
The quest watcher is awake, but it is still a hidden process tied to the current Windows session. Turn the terminal findings into a sturdier operating path: prove when the watcher is alive, decide whether it needs Task Scheduler persistence, widen its task matching carefully, and prepare XP4L event records without letting automation mark vague work as done.

## Tasks
- [ ] Confirm the watcher operating contract
  - [ ] Record the current launch command, PID file, log path, and 20-second scan interval.
  - [ ] Document what survives terminal inactivity, sleep, reboot, and logout.
  - [ ] Keep the stop command visible for manual control.
- [ ] Decide persistence level
  - [ ] Choose between hidden session process, manual launch, or Windows Task Scheduler.
  - [ ] If Task Scheduler is chosen, define trigger, working directory, and log/exit handling before implementation.
  - [ ] Keep plugin-like watcher behavior optional and additive to plain markdown.
- [ ] Expand completion matching carefully
  - [ ] Add only evidence-backed task detectors for recurring quest types.
  - [ ] Avoid marking taste, approval, live generation, paid/API, asset movement, or target-write decisions complete without explicit proof.
  - [ ] Keep active quest notes and proposal/source notes synchronized where both exist.
- [ ] Prepare XP4L event relay
  - [ ] Dry-run event records for completed watcher, quest scan, and DCS maturity work.
  - [ ] Review inferred event source, category, action, context, and tags before live write.
  - [ ] Write to `.4/inbox/events` only after explicit live/write approval.
- [ ] Verify and close the pass
  - [ ] Run one watcher scan after changes and confirm the log timestamp updates.
  - [ ] Confirm no duplicate event records are created.
  - [ ] Update the relevant quest notes with final proof and remaining limits.

## Task Order Map
```dataviewjs
const allTasks = dv.current().file.tasks.array();

const doneByText = Object.fromEntries(
  allTasks.map(t => [t.text.replace(/\s+/g, " ").trim(), t.completed])
);

const taskNodes = {
  "Confirm the watcher operating contract": "TASK_CONTRACT",
  "Record the current launch command, PID file, log path, and 20-second scan interval.": "TASK_CONTRACT_1",
  "Document what survives terminal inactivity, sleep, reboot, and logout.": "TASK_CONTRACT_2",
  "Keep the stop command visible for manual control.": "TASK_CONTRACT_3",
  "Decide persistence level": "TASK_PERSIST",
  "Choose between hidden session process, manual launch, or Windows Task Scheduler.": "TASK_PERSIST_1",
  "If Task Scheduler is chosen, define trigger, working directory, and log/exit handling before implementation.": "TASK_PERSIST_2",
  "Keep plugin-like watcher behavior optional and additive to plain markdown.": "TASK_PERSIST_3",
  "Expand completion matching carefully": "TASK_MATCHING",
  "Add only evidence-backed task detectors for recurring quest types.": "TASK_MATCHING_1",
  "Avoid marking taste, approval, live generation, paid/API, asset movement, or target-write decisions complete without explicit proof.": "TASK_MATCHING_2",
  "Keep active quest notes and proposal/source notes synchronized where both exist.": "TASK_MATCHING_3",
  "Prepare XP4L event relay": "TASK_EVENTS",
  "Dry-run event records for completed watcher, quest scan, and DCS maturity work.": "TASK_EVENTS_1",
  "Review inferred event source, category, action, context, and tags before live write.": "TASK_EVENTS_2",
  "Write to `.4/inbox/events` only after explicit live/write approval.": "TASK_EVENTS_3",
  "Verify and close the pass": "TASK_VERIFY",
  "Run one watcher scan after changes and confirm the log timestamp updates.": "TASK_VERIFY_1",
  "Confirm no duplicate event records are created.": "TASK_VERIFY_2",
  "Update the relevant quest notes with final proof and remaining limits.": "TASK_VERIFY_3"
};

const doneNodes = [];
for (const [taskText, nodeId] of Object.entries(taskNodes)) {
  if (doneByText[taskText]) doneNodes.push(nodeId);
}

const completeCount = allTasks.filter(t => t.completed).length;
dv.paragraph(`Task map progress: **${completeCount}/${allTasks.length}** checklist items complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    TASK_CONTRACT[Confirm the watcher operating contract] --> TASK_CONTRACT_1[Record launch command PID log and interval]
    TASK_CONTRACT --> TASK_CONTRACT_2[Document terminal sleep reboot logout behavior]
    TASK_CONTRACT --> TASK_CONTRACT_3[Keep stop command visible]
    TASK_CONTRACT --> TASK_PERSIST[Decide persistence level]
    TASK_PERSIST --> TASK_PERSIST_1[Choose hidden process manual launch or Task Scheduler]
    TASK_PERSIST --> TASK_PERSIST_2[Define scheduler trigger working directory and log handling]
    TASK_PERSIST --> TASK_PERSIST_3[Keep watcher optional and additive]
    TASK_PERSIST --> TASK_MATCHING[Expand completion matching carefully]
    TASK_MATCHING --> TASK_MATCHING_1[Add evidence-backed detectors]
    TASK_MATCHING --> TASK_MATCHING_2[Keep approval and live gates manual]
    TASK_MATCHING --> TASK_MATCHING_3[Sync active and proposal notes]
    TASK_MATCHING --> TASK_EVENTS[Prepare XP4L event relay]
    TASK_EVENTS --> TASK_EVENTS_1[Dry-run completed-work event records]
    TASK_EVENTS --> TASK_EVENTS_2[Review source category action context and tags]
    TASK_EVENTS --> TASK_EVENTS_3[Live write only after approval]
    TASK_EVENTS --> TASK_VERIFY[Verify and close the pass]
    TASK_VERIFY --> TASK_VERIFY_1[Run watcher scan and check log]
    TASK_VERIFY --> TASK_VERIFY_2[Confirm no duplicate events]
    TASK_VERIFY --> TASK_VERIFY_3[Update quest proof and limits]

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
  "Confirm the watcher operating contract": ["START", "CONTRACT"],
  "Decide persistence level": ["PERSIST", "SCHEDULER"],
  "Expand completion matching carefully": ["MATCHING", "GATES"],
  "Prepare XP4L event relay": ["EVENTS", "DRYRUN"],
  "Verify and close the pass": ["VERIFY", "DONE"]
};

const doneNodes = [];
for (const [taskText, nodes] of Object.entries(stageNodes)) {
  if (doneByText[taskText]) doneNodes.push(...nodes);
}

const completeCount = topTasks.filter(t => t.completed).length;
dv.paragraph(`Workflow progress: **${completeCount}/${topTasks.length}** task groups complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    START[Terminal findings] --> CONTRACT[Watcher contract]
    CONTRACT --> PERSIST[Persistence decision]
    PERSIST --> SCHEDULER{Task Scheduler needed?}
    SCHEDULER -->|No| MATCHING[Keep hidden process and manual restart]
    SCHEDULER -->|Yes| SCHEDULER_PLAN[Define scheduled task before implementation]
    MATCHING --> GATES[Evidence-backed matching and manual gates]
    SCHEDULER_PLAN --> GATES
    GATES --> EVENTS[XP4L event relay]
    EVENTS --> DRYRUN[Dry-run event records first]
    DRYRUN --> LIVE{Explicit live/write approval?}
    LIVE -->|No| VERIFY[Keep dry-run output as review material]
    LIVE -->|Yes| WRITE[Write .4 event batch]
    WRITE --> VERIFY
    VERIFY --> DONE[Watcher reliability pass closed]

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
${classLine}`;

dv.paragraph("```mermaid\n" + chart + "\n```");
```

## Rewards
- XP: 220
- Achievement Unlocks: VF-SYS-003
- Title Reward: Watch Keeper I

## Completion Proof
- Watcher persistence choice is documented.
- Manual stop/restart commands are visible.
- New task matching rules are evidence-based and gate-safe.
- XP4L event records are dry-run reviewed before any live `.4` write.
- Watcher log proves the final scan is running.

## Source Notes
- `F:\XP4Life\Systems\XP4L\Tools\watch-vaultforge-quest-tasks.ps1`
- `F:\XP4Life\Systems\XP4L\State\vaultforge-quest-watch.log`
- `F:\XP4Life\🖥 MENU\Quests\Active\Reusable Tool Pass.md`
- `F:\XP4Life\🖥 MENU\Quests\Completed\✔ VaultForge Six Hour Workflow B Reconciliation.md`
- `F:\XP4Life\🖥 MENU\Quests\Active\DCS Doc Maturity Pass.md`

## Notes
- Hand-authored from this terminal output stream using `$create-quest-from-workflow`.
- Keep the watcher an enhancement layer. XP4Life quests must remain readable and usable as plain Obsidian markdown.
