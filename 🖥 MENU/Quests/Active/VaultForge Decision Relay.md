---
quest_id: QST-VF-DECISION-RELAY
name: "VaultForge Decision Relay"
status: active
category: system
tier: rare
xp_reward: 360
achievement_unlocks:
  - VF-SYS-004
  - VF-BLD-004
title_reward: "Gatekeeper I"
created: 2026-05-10
due:
progress_current: 4
progress_target: 8
quest_type: manual
xp4l_rule_id: vaultforge-decision-relay
tags:
  - quest
  - system
  - build
  - vaultforge
  - xp4l
---
# VaultForge Decision Relay

## Objective
The VaultForge lanes are lit, but the gates still need names, proofs, and clean handoffs. Walk the relay from business priority to final task-board sync: decide what is ready, keep the protected switches closed, and turn every loose thread into a next action that another operator can follow without drift.

## Tasks
- [x] Confirm the VaultForge preflight state
  - [x] Read `F:\vaultforge\NATH_TASKS_STEP_GUIDE_10-05-26.md` ✅ 2026-05-10
  - [x] Check root dirty state and known Workflow B resume flag issue
  - [x] Keep hard gates closed for pricing, licensing, publication, live generation, paid/API use, asset moves, target writes, folder icon application, and engine registry migration
- [ ] Convert the old business priority note into current business tasks
  - [ ] Confirm whether `vaultforge-business` is the current priority lane
  - [ ] Replace vague "business goals" language with the current goal stack
  - [ ] Close or park the old note only after the replacement task shape is clear
- [x] Open or refresh the business thread
  - [x] Name the next milestone
  - [x] Keep the thread scoped to Nath-facing decision surfaces
  - [x] Update `vaultforge-business\SIGN_UP.md` with the handoff
- [x] Draft the paid launch decision note
  - [x] Record what is ready now: intake, prompt bank, wrappers, review flow, contact sheets, gallery, delivery skeleton, and service catalog
  - [x] Record what is not ready yet: legal language, license terms, public pricing, trademark claims, full automation, and broad print promises
  - [x] Present launch posture choices without treating any option as approved
- [x] Decide fragment ownership and registry shape
  - [x] Review `BUSINESS_FRAGMENT_LIBRARY_CANDIDATES.md`
  - [x] Decide between business-local mappings, lane-aware aliases, production constraints, or stable styles only
  - [x] Keep `business-fragment-library-move` blocked until the registry decision is explicit
- [ ] Record the Gallable proposal decision
  - [ ] Review the generated PNG, proposal note, and run log
  - [ ] Choose accept for size check, reroll, reject/park, or separate target apply task
  - [ ] Avoid target-project writes unless the target path and write scope are approved
- [ ] Decide the `#active` and schedule rule
  - [ ] Treat `#active` as a Nath focus signal only if adopted
  - [ ] Use schedule or due metadata only when the timing is real
  - [ ] Update root and affected section docs if the rule changes agent behavior
- [ ] Close the relay cleanly
  - [ ] Update source task boards after decisions are written down
  - [ ] Create separate implementation tasks for anything still incomplete
  - [ ] Copy the prompt-ready handoff for the future thread

## Workflow Map
```dataviewjs
const topTasks = dv.current().file.tasks
  .where(t => !t.parent)
  .array();

const doneByText = Object.fromEntries(
  topTasks.map(t => [t.text.replace(/\s+/g, " ").trim(), t.completed])
);

const stageNodes = {
  "Confirm the VaultForge preflight state": ["PREFLIGHT", "LOCK", "GATES"],
  "Convert the old business priority note into current business tasks": ["GOALS"],
  "Open or refresh the business thread": ["THREAD", "THREAD_SCOPE", "THREAD_HANDOFF"],
  "Draft the paid launch decision note": ["PAID", "PAID_READY", "PAID_NOT_READY", "PAID_DONE"],
  "Decide fragment ownership and registry shape": ["FRAG", "FRAG_REVIEW", "FRAG_LOCAL_DONE", "FRAG_MOVE_READY"],
  "Record the Gallable proposal decision": ["GALLABLE", "IMAGE_FACTS", "ICON_DONE"],
  "Decide the `#active` and schedule rule": ["TAG_RULE", "DOC_TAGS", "DEFER_TAGS", "ROOT_DOCS"],
  "Close the relay cleanly": ["BOARDS", "CLOSE", "DONE_CHECK", "HANDOFF", "COMPLETE"]
};

const doneNodes = [];
for (const [taskText, nodes] of Object.entries(stageNodes)) {
  if (doneByText[taskText]) doneNodes.push(...nodes);
}

const completeCount = topTasks.filter(t => t.completed).length;
dv.paragraph(`Workflow progress: **${completeCount}/${topTasks.length}** task groups complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    START[Start at F vaultforge] --> READ[Read this guide plus CODEX_START CURRENT_STATE THREAD_MAP TASKS]
    READ --> PREFLIGHT[Preflight git state and known dirty surfaces]
    PREFLIGHT --> LOCK[Resolve or work around missing Workflow B execute flags]
    LOCK --> GATES[Keep Nath hard gates closed]

    GATES --> PRIORITY{Business lane is current priority?}
    PRIORITY -->|Confirm| GOALS[Convert old business priority note into current business goal stack]
    PRIORITY -->|Defer| PARK_GOALS[Park old business priority note with reason]

    GOALS --> THREAD[Open or refresh business thread]
    THREAD --> THREAD_SCOPE[Name milestone and scope thread as decision surfaces only]
    THREAD_SCOPE --> THREAD_HANDOFF[Update business SIGN_UP with thread and handoff]

    THREAD_HANDOFF --> PAID[Draft PAID_LAUNCH_DECISION_NOTE]
    PAID --> PAID_READY[Record ready surfaces: intake prompt bank wrappers review contact sheets gallery delivery skeleton service catalog]
    PAID_READY --> PAID_NOT_READY[Record not ready surfaces: legal licensing public pricing trademark claims automation print promises]
    PAID_NOT_READY --> LAUNCH_POSTURE{Nath chooses launch posture?}
    LAUNCH_POSTURE -->|Hold| HOLD[Keep internal and test workflow only]
    LAUNCH_POSTURE -->|Beta| BETA[Create beta package rules and review language]
    LAUNCH_POSTURE -->|Paid trial| TRIAL[Create pricing and terms task after approval]
    LAUNCH_POSTURE -->|Public launch| PUBLIC[Create publication licensing and delivery QA tasks after approval]
    HOLD --> PAID_DONE[Paid launch note done when options risks and approval line are explicit]
    BETA --> PAID_DONE
    TRIAL --> PAID_DONE
    PUBLIC --> PAID_DONE

    PAID_DONE --> FRAG[Decide business fragment ownership and registry shape]
    FRAG --> FRAG_REVIEW[Use BUSINESS_FRAGMENT_LIBRARY_CANDIDATES as evidence]
    FRAG_REVIEW --> FRAG_CHOICE{Registry shape chosen?}
    FRAG_CHOICE -->|Business local| LOCAL[Keep wrapper mappings as production path]
    FRAG_CHOICE -->|Lane aliases| ALIAS[Design namespaced engine aliases]
    FRAG_CHOICE -->|Production constraints| CONSTRAINT[Separate constraints from mood]
    FRAG_CHOICE -->|Styles only| STYLES[Move only stable style aliases first]
    LOCAL --> FRAG_LOCAL_DONE[Write decision and keep migration blocked]
    ALIAS --> ENGINE_TASK[Create engine design task before movement]
    CONSTRAINT --> ENGINE_TASK
    STYLES --> ENGINE_TASK
    ENGINE_TASK --> FRAG_MOVE_READY[Only then unblock business fragment library move]

    FRAG_LOCAL_DONE --> GALLABLE[Review Gallable proposal image and logs]
    FRAG_MOVE_READY --> GALLABLE
    GALLABLE --> IMAGE_FACTS[Confirm facts: 1024 square transparent corners opaque center geometric mark broad glow]
    IMAGE_FACTS --> TASTE{Nath taste decision?}
    TASTE -->|Accept| SIZE_CHECK[Approve resize and readability check only]
    TASTE -->|Reroll| REROLL[Write scoped reroll prompt changes and require API approval]
    TASTE -->|Reject or park| REJECT[Record reason in icon docs and tasks]
    TASTE -->|Apply to target| TARGET[Create separate target apply task with exact path and write scope]
    SIZE_CHECK --> ICON_DONE[Icon task done when decision is recorded without target writes]
    REROLL --> ICON_DONE
    REJECT --> ICON_DONE
    TARGET --> ICON_DONE

    ICON_DONE --> TAG_RULE[Decide schedules and active tag rule]
    TAG_RULE --> TAG_CHOICE{Adopt now?}
    TAG_CHOICE -->|Yes| DOC_TAGS[Define active as Nath focus signal and use dates only when real]
    TAG_CHOICE -->|No| DEFER_TAGS[Park rule with clear reason]
    DOC_TAGS --> ROOT_DOCS[Update root TASKS THREAD_MAP and affected section docs]
    DEFER_TAGS --> ROOT_DOCS

    ROOT_DOCS --> BOARDS[Update source task boards after decisions]
    BOARDS --> CLOSE[Close or supersede old Nath notes only after docs are updated]
    CLOSE --> DONE_CHECK{Completion checklist all true?}
    DONE_CHECK -->|No| NEXT_TASK[Create separate next implementation task with lane owner scope blockers and approval gates]
    NEXT_TASK --> BOARDS
    DONE_CHECK -->|Yes| HANDOFF[Copy prompt ready handoff for future thread]
    HANDOFF --> COMPLETE[Done: decisions recorded docs synced gates preserved implementation unblocked only where approved]

    GATES -. never without explicit Nath approval .-> BLOCKED[Blocked actions: pricing licensing publication live generation paid API use asset moves target writes folder icon application engine registry migration]
    BLOCKED -. if requested later .-> NEXT_TASK

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
${classLine}`;

dv.paragraph("```mermaid\n" + chart + "\n```");
```

## Rewards
- XP: 360
- Achievement Unlocks: VF-SYS-004, VF-BLD-004
- Title Reward: Gatekeeper I

## Completion Proof
- The VaultForge Nath decision wave has written decisions, updated source task boards, and a prompt-ready handoff.
- Any remaining implementation work is split into separate tasks with lane owner, scope, blockers, and approval gates.

## Source Notes
- [[NATH_TASKS_STEP_GUIDE_10-05-26]]
- `F:\vaultforge\vaultforge-xp4l\VAULT_OUTPUT_SHAPE.md`
- `F:\vaultforge\vaultforge-xp4l\QUEST_QUERY_FIX_2026-04-17.md`

## Notes
- This is a hand-authored quest. It follows the XP4Life quest surface and keeps generated XP4L output separate.
- Deep scan 2026-05-10: preflight was verified against root `git status`, `HARD_GATES.md`, `NATH_TASKS_STEP_GUIDE_10-05-26.md`, and the known Workflow B resume-command caveat.
- Business thread refresh is evidenced by `vaultforge-business/NATH_START.md`, `README.md`, and `SIGN_UP.md`, including the paid-launch decision note handoff and next-step framing.
- Paid launch decision note is complete as a decision surface at `vaultforge-business/BUSINESS_PAID_LAUNCH_DECISION_NOTE.md`; it names ready/not-ready surfaces and keeps pricing, licensing, publication, and live/API generation as explicit decisions.
- Fragment ownership has a scoped answer in the current engine/business bridge: engine commit `c0e2d37` and business commit `4e59f85` support approved business-facing aliases and production constraints while keeping remaining business-only fragments lane-owned unless later approved.
- Still open: old business-priority note conversion, Gallable taste decision, `#active`/schedule rule, and final task-board closure.
