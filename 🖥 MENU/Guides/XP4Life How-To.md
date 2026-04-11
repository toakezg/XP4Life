---
note_type: guide
created: 2026-04-11
status: active
tags:
  - guide
  - how-to
  - workflow
---
# XP4Life How-To

This is the practical operating guide for the vault.

## Start Your Session
1. Open [[Dashboard]].
2. Check active quests and open quest tasks.
3. Pick one main quest and one smaller support task.
4. Do the next visible checkbox, not the perfect checkbox.

## Make a New Quest

### Templater Command Method
1. Make sure `templater-obsidian` is enabled.
2. Open the command palette.
3. Run `Templater: Create new note from template`, or run the direct command `Create New Quest`.
4. Choose `New Quest`.
5. Save the new note into `🖥 MENU/Quests/Active/`.
6. Templater should:
   - set `name` from the new file title
   - set `created` to today's date
   - place the cursor in the `Objective` section

### Manual Method
1. Open [[Templates/New Quest]].
2. Duplicate the note into `🖥 MENU/Quests/Active/`.
3. Rename it to the quest name.
4. Update the YAML:
   - `quest_id`
   - `status`
   - `category`
   - `tier`
   - `xp_reward`
   - `achievement_unlocks`
   - `title_reward`
   - `due`
5. Replace the sample tasks with real checkboxes.
6. Add proof or notes as you work.

## Make a New Achievement

### Templater Command Method
1. Run `Templater: Create new note from template`, or run `Create New Achievement`.
2. Choose `New Achievement`.
3. Save the new note into `🖥 MENU/Achievements/Core/`.
4. Update:
   - `achievement_id`
   - `category`
   - `tier`
   - `global_rarity`
   - `industry_rarity`
   - `criteria`
   - `rewards`
   - `xp_bonus`
   - `linked_quests`
5. Leave `unlocked: false` until it is actually earned.

### Manual Method
1. Open [[Templates/New Achievement]].
2. Duplicate it into `🖥 MENU/Achievements/Core/`.
3. Rename it to the achievement name.

## Make a New Title

### Templater Command Method
1. Run `Templater: Create new note from template`, or run `Create New Title`.
2. Choose `New Title`.
3. Save the new note into `🖥 MENU/Titles/`.
4. Update:
   - `title_id`
   - `unlock_condition`
   - `category`
   - `tier`
   - `linked_achievements`
5. Leave `unlocked: false` until the proof is real.

### Manual Method
1. Open [[Templates/New Title]].
2. Duplicate it into `🖥 MENU/Titles/`.
3. Rename it to the title name.

## Complete a Quest
1. Finish the quest checkboxes.
2. Change quest `status` to `completed`.
3. Move the note into `🖥 MENU/Quests/Completed/`.
4. Fill in the `Completion Proof` section with links, outputs, screenshots, or notes.

## Claim Linked Achievements
1. Open each achievement listed in the quest `achievement_unlocks`.
2. Change:
   - `unlocked: true`
   - `unlocked_on: YYYY-MM-DD`
3. Add proof links to the achievement note.
4. If a title condition is now met, unlock the title too.

## Update a Title
1. Open the relevant title note in `🖥 MENU/Titles/`.
2. Confirm the linked achievements or unlock condition are actually satisfied.
3. Change:
   - `unlocked: true`
   - `unlocked_on: YYYY-MM-DD`
4. Add a short proof note if useful.

## Check XP
1. Open [[Dashboard]].
2. Look at `Total XP`.
3. Quest XP comes from completed quests.
4. Achievement XP comes from unlocked achievements.

## Use The Dashboard
- `Active Quests` shows current mission notes from `🖥 MENU/Quests/Active`.
- `Open Quest Tasks` uses the Tasks plugin to show unfinished quest checkboxes.
- `Completed Quests` shows finished missions.
- `Unlocked Achievements` shows milestone progress.
- `Current Titles` shows earned identity rewards.

## Recommended Folder Rules
- Put active quest notes in `🖥 MENU/Quests/Active/`.
- Put finished quest notes in `🖥 MENU/Quests/Completed/`.
- Keep achievements in `🖥 MENU/Achievements/Core/` unless you later choose to separate unlocked notes.
- Keep titles in `🖥 MENU/Titles/`.
- Keep system docs in `Core/`, `Systems/`, `🖥 MENU/Guides/`, and `⚙ SETUP/`.

## Current Template Locations
- Quest template: [[Templates/New Quest]]
- Achievement template: [[Templates/New Achievement]]
- Title template: [[Templates/New Title]]
- Quest icon template: [[Templates/New Quest Icon]]

## Templater Setup In This Vault
- Templater `templates_folder` is set to `Templates`.
- Direct create commands are enabled for `New Quest`, `New Achievement`, `New Title`, and `New Quest Icon`.
- The generic command is `Templater: Create new note from template`.

## Best Practice
- Keep the action inside quests.
- Keep the state in YAML.
- Keep achievements proof-based.
- Keep titles rare enough to mean something.
- If a plugin breaks, keep operating manually.
