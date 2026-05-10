---
tags:
  - core
  - tasks
---
#  TASKS

## Active
- [ ] Decide whether Recovery Pack content lands before or after the first baseline commit. 2026-04-14 #task #recovery #git-ready
- [ ] Review `RECOVERY_PLAN.md` and approve the first recovery content drop. 2026-04-14 #task #recovery #docs

## Completed Today
- [x] Read `SEE_ME.md` and created a recovery implementation plan for retroactive XP, recovered quests, hidden achievements, titles, rewards, and dot4 scanner practice. 2026-04-14 #task #recovery #docs
- [x] Approved the Menu Hub restructure as the current layout and updated path references across docs, dashboard, guides, indexes, and reviews. 2026-04-11 #task #git-ready #menu
- [x] Checked the `#CODEX` `<% %>` concern: Templater tags are valid only inside `Templates/`, so leftover cursor tags were removed from real quest, achievement, title, and placeholder notes. 2026-04-11 #task #cleanup #templater
- [x] Run one more real quest through the full quest -> achievement -> title flow. 2026-04-11 #task #quest-loop #manual-check
- [x] Confirmed `Templater: Create new note from template` shows `New Quest`, `New Achievement`, `New Title`, and `New Quest Icon` after an Obsidian reload. 2026-04-11 #task #plugin #manual-check
- [x] Read the vault health review and converted findings into cleanup tasks. 2026-04-11 #task #git-ready
- [x] Added Tasks usage guide and task tagging system. 2026-04-11 #task #docs
- [x] Applied task tags to the project task list. 2026-04-11 #task #docs
- [x] Added git commit policy and `.gitignore`. 2026-04-11 #task #git-ready
- [x] Decided `.obsidian/workspace.json` should be ignored for the first baseline. 2026-04-11 #task #git-ready
- [x] Decided downloaded plugin binaries should be ignored while plugin settings/manifests can be tracked. 2026-04-11 #task #git-ready
- [x] Removed raw Templater cursor tags from non-template quest notes. 2026-04-11 #task #cleanup
- [x] Removed empty scratch artifacts `Untitled.md` and `Untitled/`. 2026-04-11 #task #cleanup
- [x] Moved the remaining legacy quest template into the global `Templates/` folder. 2026-04-11 #task #cleanup
- [x] Confirmed Mermaid maps render correctly in Obsidian. 2026-04-11 #task #map
- [x] Decided to keep `Welcome.md` in the vault for now. 2026-04-11 #task #docs
- [x] Confirmed the Tasks and Dataview dashboard views render cleanly after Obsidian reload. 2026-04-11 #task #plugin
- [x] Initialized git, renamed the default branch to `main`, and confirmed `.gitignore` behavior. 2026-04-11 #task #git-ready
- [x] Moved the loose XP4Life emblem image into `Assets/`. 2026-04-11 #task #cleanup
- [x] Decided to keep the completed `Manual Make` proof quest in the first baseline. 2026-04-11 #task #git-ready #scope
- [x] Reviewed first git status after initialization. 2026-04-11 #task #git-ready
- [x] Moved review notes into `Core/Reviews/` and created a pre-git review. 2026-04-11 #task #review #git-ready
- [x] Created `CODEX_START.md` for future thread/session re-entry. 2026-04-11 #task #handoff
- [x] Removed empty scratch files before the baseline review. 2026-04-11 #task #cleanup

## Next
- [ ] Stage and commit the first baseline when approved. #task #git-ready
- [ ] Convert Recovery Pack aggregate notes into YAML-bearing recovered quest, achievement, and title notes. #task #recovery
- [ ] Create the Dot4 XP Node Spec and scanner practice payload examples. #task #scanner #dot4
- [ ] Test scanner reporting on `.4/see-me.txt` before parsing XP tags. #task #scanner #dot4
- [ ] Add a parser plan for XP tags like `#120XP` and `#200XP/bonus` after dot4 parsing works. #task #scanner #vaultforge
- [ ] Keep rewards to seed items for now; defer gear rules, currency mechanics, and visual generators. #task #rewards #scope
- [ ] Add daily quest structure only if it improves execution rather than clutter. #task #scope
- [ ] Design a simple level curve after real XP has been earned. #task #xp
- [ ] Add QuickAdd or Buttons only after the manual flow feels correct. #task #plugin #scope
- [ ] Create pass 3 dashboard upgrades once plugin installation is confirmed. #task #dashboard
- [ ] Plan quest chains after the first git baseline and at least two real quest completion loops. #task #scope
