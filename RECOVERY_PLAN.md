---
tags:
  - core
  - recovery
  - planning
note_type: plan
created: 2026-04-14
status: active
phase: phase-2
---
# RECOVERY_PLAN

## Purpose
Turn `SEE_ME.md` into an implementation path for recovered XP, recovered quests, hidden achievements, title progress, rewards, and dot4 scanner practice.

## Guardrails
- Keep markdown and YAML as the source of truth.
- Treat scanner output, Dataview, Tasks, and future automation as optional enhancement layers.
- Do not stage, commit, or push without user approval.
- Do not let recovery work accidentally become Phase 3 automation. The first pass should be human-readable content and parser specs.
- Adapt generic `MENU/` references from the recovery pack to the current Menu Hub structure.

## Current Inputs
- `SEE_ME.md` contains the retroactive recovery conversation and Recovery Pack Phase 1.
- Existing templates define one YAML-bearing note per quest, achievement, and title.
- The dashboard totals completed quests from the Menu Hub quest area and unlocked achievements from the Menu Hub achievement area.
- The git baseline was ready on 2026-04-11, but 2026-04-14 has new SEE_ME, plugin, and icon changes. Decide whether to commit the old baseline first or include the recovery plan in a new baseline scope.

## Implementation Order

### Step 1 - Scope Decision
Choose one:
- Baseline first: commit the existing vault before adding recovery pack content.
- Recovery docs first: include this plan and task updates before the baseline, then add recovered content after.

Recommended: baseline first if the goal is a clean historical commit. Recovery docs first if `SEE_ME.md` is now the next active build direction.

### Step 2 - Recovery Content Shape
Convert aggregate recovery pack items into normal XP4Life notes rather than keeping all recovered quests in one note.

Use ID ranges:
- `QST-REC-001` and upward for recovered quests.
- `ACH-REC-001` and upward for recovered achievements.
- `TTL-REC-001` and upward for recovered titles.
- `RWD-REC-001` and upward if rewards get YAML later.

Recovered notes should use normal fields:
- Quests: `status`, `category`, `tier`, `xp_reward`, `achievement_unlocks`, `title_reward`, `created`, `completed_on`, and `tags`.
- Achievements: `unlocked`, `unlocked_on`, `xp_bonus`, `linked_quests`, and `tags`.
- Titles: `unlocked`, `unlocked_on`, `linked_achievements`, and `tags`.

### Step 3 - Folder Pass
After scope approval, create:
- A recovered quest folder under the Menu Hub quest area.
- A recovered achievement folder under the Menu Hub achievement area.
- A recovered title folder under the Menu Hub title area.
- A rewards area under the Menu Hub.
- `Systems/Dot4 XP Node Spec.md`.
- A recovered progress workflow guide under the Menu Hub guides area.
- A recovered XP rarity note under the Menu Hub guide tables area.

If exact path names are uncertain in tools because of emoji encoding, resolve them from `rg --files` before editing.

### Step 4 - Seed Content
Create recovered quest notes for confirmed work:
- VaultForge Engine Extraction Pass.
- VaultForge Business Retarget Cleanup.
- Shared Engine Naming / Compatibility Cleanup.
- Batch Generation System.
- Obsidian/System Integration Thinking.
- Dot4 Scanner Discovery Pass.

Create recovered achievements:
- Engine Architect I.
- Workflow Hacker.
- System Thinker I.
- Unseen Progress.
- Dot Finder.

Create recovered titles:
- Finder.
- Engine Architect I.
- Pipeline Builder.
- System Explorer.
- Orchestrator as in-progress.

### Step 5 - Rewards Seed
Keep rewards lightweight:
- Rest.
- Field Notebook.
- Iron Toolbelt.
- Architect's Draftbook.

Do not build item economy, gear rules, or visual generation yet. Capture those as future tasks only.

### Step 6 - Dot4 Scanner Practice
Start with human-readable `.4/see-me.txt` payload lines:
- `XP: quest | Name | +250xp`
- `Achievement: unlock | Name | +110xp`
- `Title: earned | Name | +120xp`
- `Reward: earned | Name | +50xp`

Parser order:
1. Scan for `.4/see-me.txt`.
2. Parse payload lines into a report.
3. Dedupe by source path and item name.
4. Add support for XP tags like `#120XP`.
5. Add support for bonus tags like `#200XP/bonus`.
6. Only later consider automatic note creation.

### Step 7 - Dashboard Later
Once content exists, add a Dataview block for recovered totals or make the existing totals include recovered folders by path. Keep dashboards optional and plugin-enhanced.

## Recommended Future Threads
- Baseline Commit Thread: stage and commit after final approval and a health check.
- Recovery Pack Drop-In Thread: create recovered notes and folders from this plan.
- Dot4 Scanner Practice Thread: define payload examples, scan `.4` nodes, and produce a report before automation.
- VaultForge XP Tag Sync Thread: parse `#120XP` and `#200XP/bonus` tags from VaultForge notes after scanner basics work.
- Reward Seed Thread: design item and gear reward YAML examples without building currency mechanics.
- Phase 3 Dashboard Thread: add recovered totals and quality-of-life views after baseline and recovery content are stable.

## Open Questions
- Should recovery content be included before the first baseline commit, or should the old baseline happen first?
- Should recovered XP count toward the main total immediately, or be shown separately until confirmed?
- Should VaultForge scanner work live inside XP4Life, VaultForge, or a neutral tools folder?
