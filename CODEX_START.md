# CODEX_START

## What This Project Is
XP4Life is an Obsidian vault that turns real work into a playable progression system using markdown tasks, YAML state, quests, achievements, XP, titles, maps, and lightweight plugin-enhanced dashboards.

## Current Objective
Prepare XP4Life for its first clean Git baseline commit while preserving the new `SEE_ME.md` recovery-planning lane. The vault must remain readable and usable in plain Obsidian markdown.

## Current State
- Status: active build, pre-git baseline.
- Main area in focus: `🖥 MENU/`, `Core/Reviews/`, `TASKS.md`, `CHANGELOG.md`, and Git hygiene.
- Current phase: Phase 2 - governance, plugins, maps, Menu Hub organization, and git-prep stabilization.
- Last meaningful milestone: Menu Hub restructure accepted as the current layout, git initialized on `main`, and pre-git review created.
- Newest planning input: `SEE_ME.md` requests a recovery implementation plan for retroactive XP, recovered quests, hidden achievements, titles, rewards, dot4 scanner practice, and VaultForge XP tag parsing.
- Known blockers: do not stage/commit/push until the user explicitly approves that final Git action. Also decide whether recovery docs/content belong before or after the first baseline.
- Last validation: 131 visible untracked baseline files, 23 intentionally ignored files, JSON plugin settings valid, no empty files, and no raw Templater tags outside templates/handoff/docs.

## Start Here
If resuming work, begin in this order:
1. Read `AGENTS.md`.
2. Read this file.
3. Read `README.md`.
4. Check `TASKS.md`.
5. Review `CHANGELOG.md`.
6. Read the latest note in `Core/Reviews/`.
7. Read `SEE_ME.md` and `RECOVERY_PLAN.md` if recovery work is in scope.
8. Run `git status --short --ignored`.

## Main Files / Folders
- `AGENTS.md` - project working rules and plugin-light constraint.
- `README.md` - high-level project overview and current navigation.
- `SYSTEM.md` - system laws and state rules.
- `PLAN.md` - phase orientation and near-term direction.
- `TASKS.md` - current project-development tasks.
- `TASKS-DONE.md` - completed project-development tasks.
- `CHANGELOG.md` - notable user/Codex changes.
- `SEE_ME.md` - newest recovery-planning brief and source conversation.
- `RECOVERY_PLAN.md` - scoped recovery, dot4 scanner, XP tag, reward, and thread plan.
- `Core/Reviews/` - health checks, content reviews, and pre-git review notes.
- `Core/XP4Life System Overview.md` - core loop and operating model.
- `🖥 MENU/Dashboard.md` - live Dataview/Tasks dashboard.
- `🖥 MENU/Quests/` - active and completed quest notes.
- `🖥 MENU/Achievements/` - achievement definitions and unlock state.
- `🖥 MENU/Titles/` - title/rank notes.
- `🖥 MENU/Guides/` - practical user-facing guides.
- `Templates/` - global Templater templates; raw `<% %>` tags belong here.
- `MAPS/` - Mermaid roadmap, current-state, and future quest-chain maps.
- `⚙ SETUP/README.md` - plugin waves and setup rules.
- `.gitignore` - first-baseline repo hygiene.

## Current Workflow
- Plan in `PLAN.md`, `TASKS.md`, and review notes.
- Keep playable content under `🖥 MENU/`.
- Keep source-of-truth state in YAML frontmatter.
- Use markdown tasks inside quest notes for execution.
- Use plugins only as additive views or creation helpers.
- After a meaningful work session, update `CHANGELOG.md`, `TASKS.md`, `TASKS-DONE.md`, and this file.
- Before any commit, run a quick health sweep and add or update a review note in `Core/Reviews/`.

## What To Preserve
- Plugin-light rule: plain markdown and YAML must remain enough to use the system.
- Menu Hub layout for playable/user-facing areas.
- Root docs as the project spine.
- `Core/Reviews/` as the location for review snapshots.
- Templater tags only in `Templates/`.
- `.obsidian/workspace.json` ignored.
- Plugin `main.js` and `styles.css` ignored.
- Plugin manifests/settings may be tracked when small and useful.
- Warm, practical, game-flavored tone without turning docs into fluff.

## What To Avoid
- Do not stage, commit, or push without explicit user approval.
- Do not add new plugins as core dependencies.
- Do not start quest chains before the first baseline commit.
- Do not expand Phase 3 dashboard/automation work before the baseline.
- Do not leave raw Templater `<% %>` tags in real quest, achievement, or title notes.
- Do not scatter duplicate reviews in `Core/`; put them in `Core/Reviews/`.
- Do not reintroduce root-level pasted images or scratch `Untitled.md` files.

## If Making Changes
Prefer:
- small complete passes
- clear file placement
- path updates whenever folders move
- final verification with `git status --short --ignored`
- concise handoff summaries
- updating this file before a long break or new thread

## Active Next Steps
- Decide whether the recovery planning docs land before or after the first baseline commit.
- Get explicit user approval before staging and committing any baseline.
- Run `git status --short --ignored` immediately before staging.
- If committing, stage the intended baseline files and use a clear message such as `Initial XP4Life vault baseline`.
- If continuing recovery work first, review `RECOVERY_PLAN.md`, then create YAML-bearing recovered notes and dot4 scanner specs in a separate focused pass.
- Only after the baseline exists, consider Phase 3 dashboard and creation-flow upgrades.

## Notes For Future Codex Sessions
- The user moved quests, achievements, titles, dashboard, and guides into `🖥 MENU/`; treat that as the current structure.
- The user wants `CODEX_START.md` updated whenever the project pauses for a real break or a new thread starts.
- The active quest `🖥 MENU/Quests/Active/gotta git ready.md` represents this pre-commit milestone; do not mark its final commit task done until a commit actually exists.
- The `#CODEX` task about `<% %>` was answered by removing Templater cursor tags from real notes and keeping them only in `Templates/`.
- The first commit should be a baseline, not a feature-expansion commit.
