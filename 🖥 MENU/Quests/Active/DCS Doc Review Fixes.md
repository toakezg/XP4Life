---
quest_id: QST-DCS-DOC-REVIEW-FIXES
name: "DCS Doc Review Fixes"
status: active
category: system
tier: rare
xp_reward: 280
achievement_unlocks:
  - DCS-SYS-001
title_reward: "Coordinate Smith I"
created: 2026-05-10
due:
progress_current: 0
progress_target: 6
quest_type: manual
xp4l_rule_id: dcs-doc-review-fixes
tags:
  - quest
  - system
  - dcs
  - codex
  - xp4l
---
# DCS Doc Review Fixes

## Objective
The DCS document forge is awake, but the review found weak bolts in the frame: draft output can still masquerade as a finished document, mode promises overlap, source intake is thin, and path handling can misread intent. Walk the findings in order, harden the skill, and leave proof that `$dcs-doc` now produces either an honest frame or a completed topic document with no scaffold residue.

## Tasks
- [ ] Add a deterministic final validation gate
  - [ ] Create or specify a validation helper that fails on unfinished draft markers and scaffold phrases.
  - [ ] Make the `$dcs-doc` workflow require the validator before final delivery in `write` and layer modes.
  - [ ] Confirm the validator ignores explicit bad-example blocks or documents how to handle those examples.
- [ ] Split mode-specific output contracts
  - [ ] Separate `write` requirements from `seed`, `core`, `relations`, `structure`, `operation`, `transformation`, `expansion`, `projection`, `map`, and `rcs` requirements.
  - [ ] Remove the contradiction where layer modes are expected to include all `0.0.0` through `7.0.0` sections.
  - [ ] Verify `progress_target`-style expectations map to the actual top-level coordinate groups for each mode.
- [ ] Add a source and context intake path
  - [ ] Decide whether `$dcs-doc` should support `--source`, `--notes`, or a documented manual source-gathering step.
  - [ ] Define what Codex should do when no source exists: ask for material, inspect local context, or write an assumptions section.
  - [ ] Test the flow on a topic that needs real evidence rather than general model knowledge.
- [ ] Harden output path semantics
  - [ ] Decide whether to split `--output-dir` and `--output-file`.
  - [ ] Fix or document the case where a directory-like name with a suffix, such as `v1.0`, could be treated as a file.
  - [ ] Confirm directory output, named file output, and non-`write` mode suffixes still behave as intended.
- [ ] Align README, reference, and skill instructions
  - [ ] Update `SKILL.md`, `references/dcs-reference.md`, and `F:\toakezg\skills-readme\DCS\dcs-doc-README.md` with the same final contract.
  - [ ] Keep the human README concise while still pointing to the required validation command or helper.
  - [ ] Confirm no active docs still imply the helper script alone completes `write` mode.
- [ ] Prove the repaired `$dcs-doc` behavior
  - [ ] Run skill validation with `quick_validate.py`.
  - [ ] Run Python syntax validation for helper scripts.
  - [ ] Generate a sample `write` document and prove final output has no unfinished draft markers or scaffold phrases.
  - [ ] Generate at least one layer mode and one `rcs` or `map` mode to prove mode contracts do not collide.

## Task Order Map
```dataviewjs
const allTasks = dv.current().file.tasks.array();

const doneByText = Object.fromEntries(
  allTasks.map(t => [t.text.replace(/\s+/g, " ").trim(), t.completed])
);

const taskNodes = {
  "Add a deterministic final validation gate": "TASK_VALIDATE",
  "Create or specify a validation helper that fails on unfinished draft markers and scaffold phrases.": "TASK_VALIDATE_1",
  "Make the `$dcs-doc` workflow require the validator before final delivery in `write` and layer modes.": "TASK_VALIDATE_2",
  "Confirm the validator ignores explicit bad-example blocks or documents how to handle those examples.": "TASK_VALIDATE_3",
  "Split mode-specific output contracts": "TASK_MODES",
  "Separate `write` requirements from `seed`, `core`, `relations`, `structure`, `operation`, `transformation`, `expansion`, `projection`, `map`, and `rcs` requirements.": "TASK_MODES_1",
  "Remove the contradiction where layer modes are expected to include all `0.0.0` through `7.0.0` sections.": "TASK_MODES_2",
  "Verify `progress_target`-style expectations map to the actual top-level coordinate groups for each mode.": "TASK_MODES_3",
  "Add a source and context intake path": "TASK_SOURCE",
  "Decide whether `$dcs-doc` should support `--source`, `--notes`, or a documented manual source-gathering step.": "TASK_SOURCE_1",
  "Define what Codex should do when no source exists: ask for material, inspect local context, or write an assumptions section.": "TASK_SOURCE_2",
  "Test the flow on a topic that needs real evidence rather than general model knowledge.": "TASK_SOURCE_3",
  "Harden output path semantics": "TASK_PATHS",
  "Decide whether to split `--output-dir` and `--output-file`.": "TASK_PATHS_1",
  "Fix or document the case where a directory-like name with a suffix, such as `v1.0`, could be treated as a file.": "TASK_PATHS_2",
  "Confirm directory output, named file output, and non-`write` mode suffixes still behave as intended.": "TASK_PATHS_3",
  "Align README, reference, and skill instructions": "TASK_DOCS",
  "Update `SKILL.md`, `references/dcs-reference.md`, and `F:\\toakezg\\skills-readme\\DCS\\dcs-doc-README.md` with the same final contract.": "TASK_DOCS_1",
  "Keep the human README concise while still pointing to the required validation command or helper.": "TASK_DOCS_2",
  "Confirm no active docs still imply the helper script alone completes `write` mode.": "TASK_DOCS_3",
  "Prove the repaired `$dcs-doc` behavior": "TASK_PROVE",
  "Run skill validation with `quick_validate.py`.": "TASK_PROVE_1",
  "Run Python syntax validation for helper scripts.": "TASK_PROVE_2",
  "Generate a sample `write` document and prove final output has no unfinished draft markers or scaffold phrases.": "TASK_PROVE_3",
  "Generate at least one layer mode and one `rcs` or `map` mode to prove mode contracts do not collide.": "TASK_PROVE_4"
};

const doneNodes = [];
for (const [taskText, nodeId] of Object.entries(taskNodes)) {
  if (doneByText[taskText]) doneNodes.push(nodeId);
}

const completeCount = allTasks.filter(t => t.completed).length;
dv.paragraph(`Task map progress: **${completeCount}/${allTasks.length}** checklist items complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    TASK_VALIDATE[Add a deterministic final validation gate] --> TASK_VALIDATE_1[Create validation helper]
    TASK_VALIDATE --> TASK_VALIDATE_2[Require validator in write and layer modes]
    TASK_VALIDATE --> TASK_VALIDATE_3[Handle bad-example blocks]
    TASK_VALIDATE --> TASK_MODES[Split mode-specific output contracts]
    TASK_MODES --> TASK_MODES_1[Separate mode requirements]
    TASK_MODES --> TASK_MODES_2[Remove layer mode contradiction]
    TASK_MODES --> TASK_MODES_3[Verify target counts by mode]
    TASK_MODES --> TASK_SOURCE[Add a source and context intake path]
    TASK_SOURCE --> TASK_SOURCE_1[Choose source or notes surface]
    TASK_SOURCE --> TASK_SOURCE_2[Define no-source behavior]
    TASK_SOURCE --> TASK_SOURCE_3[Test evidence-dependent topic]
    TASK_SOURCE --> TASK_PATHS[Harden output path semantics]
    TASK_PATHS --> TASK_PATHS_1[Decide output-dir vs output-file]
    TASK_PATHS --> TASK_PATHS_2[Handle suffix-like directory names]
    TASK_PATHS --> TASK_PATHS_3[Confirm output behavior]
    TASK_PATHS --> TASK_DOCS[Align README reference and skill instructions]
    TASK_DOCS --> TASK_DOCS_1[Update all docs]
    TASK_DOCS --> TASK_DOCS_2[Keep README concise]
    TASK_DOCS --> TASK_DOCS_3[Remove helper-is-final implication]
    TASK_DOCS --> TASK_PROVE[Prove repaired dcs-doc behavior]
    TASK_PROVE --> TASK_PROVE_1[Run quick_validate]
    TASK_PROVE --> TASK_PROVE_2[Run Python syntax validation]
    TASK_PROVE --> TASK_PROVE_3[Test final write output]
    TASK_PROVE --> TASK_PROVE_4[Test layer and map or rcs modes]

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
  "Add a deterministic final validation gate": ["FINDINGS", "VALIDATOR", "VALIDATOR_GATE"],
  "Split mode-specific output contracts": ["MODE_CONFLICT", "MODE_CONTRACTS"],
  "Add a source and context intake path": ["SOURCE_GAP", "SOURCE_INTAKE"],
  "Harden output path semantics": ["PATH_RISK", "PATH_FIX"],
  "Align README, reference, and skill instructions": ["DOC_DRIFT", "DOC_ALIGN"],
  "Prove the repaired `$dcs-doc` behavior": ["VERIFY", "DONE"]
};

const doneNodes = [];
for (const [taskText, nodes] of Object.entries(stageNodes)) {
  if (doneByText[taskText]) doneNodes.push(...nodes);
}

const completeCount = topTasks.filter(t => t.completed).length;
dv.paragraph(`Workflow progress: **${completeCount}/${topTasks.length}** task groups complete.`);

const classLine = doneNodes.length ? `    class ${doneNodes.join(",")} done;` : "";

const chart = String.raw`flowchart TD
    FINDINGS[Review findings: dcs-doc weak points] --> VALIDATOR[No deterministic final validation]
    VALIDATOR --> VALIDATOR_GATE[Add validator and require final gate]

    FINDINGS --> MODE_CONFLICT[Mode contract conflict]
    MODE_CONFLICT --> MODE_CONTRACTS[Split write layer map and rcs requirements]

    FINDINGS --> SOURCE_GAP[No source or context intake path]
    SOURCE_GAP --> SOURCE_INTAKE[Add source notes assumptions or ask behavior]

    FINDINGS --> PATH_RISK[Output path suffix risk]
    PATH_RISK --> PATH_FIX[Clarify output-dir vs output-file behavior]

    FINDINGS --> DOC_DRIFT[README reference and skill can drift]
    DOC_DRIFT --> DOC_ALIGN[Align docs around final contract]

    VALIDATOR_GATE --> VERIFY[Run validation and sample outputs]
    MODE_CONTRACTS --> VERIFY
    SOURCE_INTAKE --> VERIFY
    PATH_FIX --> VERIFY
    DOC_ALIGN --> VERIFY
    VERIFY --> DONE[DCS Doc hardening proven]

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
${classLine}`;

dv.paragraph("```mermaid\n" + chart + "\n```");
```

## Rewards
- XP: 280
- Achievement Unlocks: DCS-SYS-001
- Title Reward: Coordinate Smith I

## Completion Proof
- `$dcs-doc` has a deterministic final validation gate for draft markers and scaffold phrases.
- Mode-specific requirements no longer contradict each other.
- Source/context intake is defined for evidence-dependent topics.
- Output path behavior is hardened or explicitly documented.
- `SKILL.md`, `references/dcs-reference.md`, and `F:\toakezg\skills-readme\DCS\dcs-doc-README.md` agree on the final contract.
- Sample `write`, layer, and `map` or `rcs` outputs pass the final checks.

## Source Notes
- Source review findings from the `$dcs-doc` skill review.
- `C:\Users\natha\.codex\skills\dcs-doc\SKILL.md`
- `C:\Users\natha\.codex\skills\dcs-doc\scripts\build_dcs_doc.py`
- `C:\Users\natha\.codex\skills\dcs-doc\references\dcs-reference.md`
- `F:\toakezg\skills-readme\DCS\dcs-doc-README.md`

## Notes
- Hand-authored from the review findings using `$create-quest-from-workflow`.
- The workflow graph is embedded above and should stay aligned with the top-level task groups.
