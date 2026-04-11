---
note_type: system
created: 2026-04-10
status: active
tags:
  - system
  - plugins
---
# Plugin and System Notes

## Current Detected Plugins
- `dataview`
- `obsidian-tasks-plugin`
- `templater-obsidian`
- `obsidian-file-color`
- `css-editor`
- `treefocus`

## Current Status
The foundation plugin wave is now installed. The vault still relies on markdown and YAML first, which matches the intended design law, and the plugins now enhance dashboards, task views, and note creation rather than holding the system together.

## Design Law
If every plugin disappeared tomorrow, XP4Life should still function.

The base system lives in markdown, folders, and YAML. Plugins only enhance speed, visibility, and convenience.

## Recommended Roles

### Dataview
- State and summary layer.
- Use for active quests, completed quests, unlocked achievements, title lists, and XP totals.

### Tasks
- Action layer.
- Use for daily execution, due dates, recurring items, and filtered task views across quest notes.

### Templater
- Creation layer.
- Best for generating new quest, achievement, or title notes with consistent YAML.

### MetaEdit and Metadata Menu
- Metadata editing layer.
- Useful for toggling `status`, `unlocked`, `unlocked_on`, `xp_reward`, or tier fields without manually rewriting frontmatter.

### QuickAdd and Buttons
- Command layer.
- Good future fit for "Create Quest", "Claim Achievement", or "Add XP" actions.

### Progress Bar, Tracker, Charts
- Feedback layer.
- Useful once enough history exists to visualize streaks, category progress, and XP growth.

### Folder Notes and Waypoint
- Navigation layer.
- Helpful for turning folders into readable zones and auto-generated indexes.

### Juggl
- Graph layer.
- Best reserved for a future skill-tree style view once the quest and achievement network is denser.

## System Rules
- YAML is the source of truth.
- Tasks live inside quests unless there is a strong reason to keep them elsewhere.
- Quest completion should usually trigger achievement review.
- Achievements grant milestone meaning and bonus XP.
- Titles should stay sparse and meaningful so they still feel earned.

## Manual Claim Flow For Pass 1
1. Complete all required task checkboxes in the quest note.
2. Change quest `status` to `completed`.
3. Move the quest note to `🖥 MENU/Quests/Completed/`.
4. Update linked achievement notes with `unlocked: true` and `unlocked_on: YYYY-MM-DD`.
5. If a title condition is met, set that title note to unlocked.
6. Review the dashboard and indexes.
