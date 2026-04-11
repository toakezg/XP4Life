---
note_type: guide
created: 2026-04-11
status: active
tags:
  - guide
  - tasks
  - workflow
---
# How to Use Tasks

This guide explains how XP4Life should use the Tasks plugin without making the vault depend on it.

## Core Rule
Markdown checkboxes are the source of truth. The Tasks plugin makes them easier to filter, query, and review.

## Basic Task Format
Use plain checkboxes first:

```md
- [ ] Finish the next quest step #task #quest
- [x] Confirm dashboard renders #task #git-ready 2026-04-11
```

## Helpful Tags
- `#task` for project-level tasks.
- `#quest-task` for tasks inside quest notes.
- `#git-ready` for first-commit preparation.
- `#docs` for documentation updates.
- `#cleanup` for tidying files, links, or folders.
- `#plugin` for plugin setup or validation.
- `#map` for Mermaid maps and orientation work.
- `#scope` for decisions that keep the project from expanding too early.
- `#manual-check` for checks that require Obsidian UI confirmation.

## Query Examples

### All Open Git-Ready Tasks
```tasks
not done
tag includes #git-ready
sort by path
```

### Open Cleanup Tasks
```tasks
not done
tag includes #cleanup
sort by path
```

### Manual Checks
```tasks
not done
tag includes #manual-check
sort by path
```

### Done Today
```tasks
done today
sort by done
```

## Stacking Under Headings
Tasks can live under headings to create structure:

```md
## Active
- [ ] Decide gitignore policy #task #git-ready

## Next
- [ ] Plan quest chains later #task #scope
```

## Subtasks
Use subtasks when the parent task is a container:

```md
- [ ] Git ready #task #git-ready
  - [ ] Add `.gitignore` #cleanup
  - [ ] Review scratch files #cleanup
  - [ ] Confirm plugin policy #plugin
```

## Tips
- Keep task text action-based.
- Add tags sparingly but consistently.
- Avoid burying too many subtasks under one parent.
- Use `#manual-check` when Codex cannot verify something from the terminal.
- Prefer moving completed project work into `TASKS-DONE.md` when it becomes part of the project record.

