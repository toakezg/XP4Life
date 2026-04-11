---
tags:
  - core
  - system
---
# SYSTEM

## Purpose
XP4Life exists to make real progress visible, motivating, and expandable without losing clarity.

## Design Law
If every plugin disappeared tomorrow, XP4Life should still function.

That means:
- Core logic lives in files.
- YAML is the source of truth.
- Markdown tasks remain valid without automation.
- Plugins improve visibility, speed, and convenience.

## Core Loop
Tasks -> Quests -> Achievements -> XP -> Titles -> Progression

## Behavior

### Tasks
- Small actions.
- Usually stored as markdown checkboxes inside quest notes.

### Quests
- Bundles of meaningful work.
- Hold status, tier, category, due dates, rewards, and links to achievements.

### Achievements
- Recognize proof-based milestones.
- Carry rarity, criteria, XP bonus, and linked quests.

### XP
- Quantifies motion and proof.
- Comes from completed quests and unlocked achievements.

### Titles
- Identity rewards.
- Should stay sparse and meaningful.

## Plugin Policy

### Core Without Plugins
- Folder structure
- YAML frontmatter
- Quest, achievement, and title notes
- Markdown tasks
- Manual reward claiming
- Overview docs, indexes, and handoff notes

### Plugin Enhancements
- `dataview` for dashboard and rollups
- `tasks` for action filtering and daily execution views
- `templater-obsidian` for consistent note creation
- `mermaid-tools`, `mehrmaid`, `mermaid-themes`, and `export-graph-view` for maps, diagrams, and visual orientation
- `metaedit`, `quickadd`, `buttons` for convenience and speed
- `tracker`, `obsidian-progress-bar`, `obsidian-charts`, `metadata-menu`, `juggl` for later polish

## State Rules
- `status` fields drive quest state.
- `unlocked` and `unlocked_on` drive achievement and title state.
- Completed quests should be moved into `🖥 MENU/Quests/Completed/` after rewards are claimed.

## Documentation Rules
- Keep docs short, direct, and operational.
- Prefer updating existing system notes over scattering duplicate explanations.
- Use YAML consistently and avoid custom fields unless they add real value.
- Treat root docs as the project spine and vault notes as the game world.

## Task Rules
- `TASKS.md` tracks current project-development work on the vault itself.
- Quest tasks track in-world execution and progression.
- Keep active project tasks limited and specific.
- Move finished project tasks into `TASKS-DONE.md` once the result is real.
