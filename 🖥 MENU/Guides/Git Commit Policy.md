---
note_type: guide
created: 2026-04-11
status: active
tags:
  - guide
  - git
  - git-ready
---
# Git Commit Policy

## Goal
Create a clean first baseline commit that preserves the XP4Life system without committing noisy local state.

## Track
- Markdown vault content.
- Core project docs.
- Templates.
- Maps.
- Intentional assets under `Assets/`.
- Obsidian plugin enablement and small settings files where useful.

## Ignore
- `.obsidian/workspace.json`, because it contains personal window state and stale file history.
- Third-party plugin binaries under `.obsidian/plugins/*/main.js` and `.obsidian/plugins/*/styles.css`.
- Empty scratch notes and temporary untitled files.
- Root-level pasted images unless they are moved into an intentional asset/proof folder.
- OS/editor junk and caches.

## Plugin Decision
Plugin binaries should not be tracked for the first commit. The vault should document plugin requirements and keep small settings files, but downloaded third-party code can be reinstalled.

## Workspace Decision
Do not track `.obsidian/workspace.json` for now. It is useful locally but noisy for a repository baseline.

## Before First Commit
1. Confirm `.gitignore` exists.
2. Confirm no raw Templater tags exist outside `Templates/`.
3. Confirm scratch files are removed or intentionally kept.
4. Confirm maps render in Obsidian.
5. Confirm git is initialized on `main`.
6. Review `git status --short --ignored`.
7. Stage and commit only after user approval.
