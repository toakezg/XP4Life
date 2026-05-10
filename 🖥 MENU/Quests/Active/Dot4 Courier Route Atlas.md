---
quest_id: QST-VF-DOT4-ROUTE-ATLAS
name: "Dot4 Courier Route Atlas"
status: active
category: system
tier: uncommon
xp_reward: 240
achievement_unlocks:
  - VF-SYS-005
title_reward: "Route Finder I"
created: 2026-05-10
due:
progress_current: 4
progress_target: 5
quest_type: manual
xp4l_rule_id: dot4-courier-route-atlas
tags:
  - quest
  - system
  - dot4
  - courier
  - xp4l
  - vaultforge
---
# Dot4 Courier Route Atlas

## Objective
The courier learned how to look past its first inbox. Chart the route atlas for `.4` targets across `F:\`, keep the scan honest around deep folder traps, and leave behind a cache path that lets the next run re-open discovered inboxes without paying the full search cost again.

## Tasks
- [x] Reopen the courier workspace
  - [x] Read `stub.py` and `README.txt` to confirm the current courier contract.
  - [x] Locate the real `F:\XP4Life` vault and its active quest folder.
  - [x] Confirm the quest-note pattern and the existing active quest style.
- [x] Build the route atlas
  - [x] Add `--target-all` so the courier can scan `F:\` for `.4\inbox\events` targets.
  - [x] Skip common deep folders like `.obsidian`, `.venv`, `node_modules`, and build/cache trees.
  - [x] Add `--save-targets` and `--target-found` for cached route reuse.
  - [x] Keep the default single inbox path intact when no target mode is used.
- [x] Verify the scanner
  - [x] Run `python -m py_compile stub.py`.
  - [x] Run a temp-tree scan/cache round-trip.
  - [x] Check `python stub.py --help`.
- [x] Log the findings
  - [x] Write XP4L event records for the completed courier pass.
  - [x] Capture the discovery of the XP4Life vault and quest conventions.
- [ ] Hand off the next courier gate
  - [ ] Decide whether to surface the cache as a menu note or keep it local only.
  - [ ] Run a live `F:\` discovery pass if the next thread needs fresh routes.

## Task Order Map
```mermaid
flowchart TD
    REOPEN[Reopen the courier workspace] --> REOPEN_1[Read stub.py and README.txt to confirm the current courier contract.]
    REOPEN --> REOPEN_2[Locate the real F:\XP4Life vault and its active quest folder.]
    REOPEN --> REOPEN_3[Confirm the quest-note pattern and the existing active quest style.]
    REOPEN --> ROUTE[Build the route atlas]
    ROUTE --> ROUTE_1[Add --target-all so the courier can scan F:\ for .4\inbox\events targets.]
    ROUTE --> ROUTE_2[Skip common deep folders like .obsidian .venv node_modules and build/cache trees.]
    ROUTE --> ROUTE_3[Add --save-targets and --target-found for cached route reuse.]
    ROUTE --> ROUTE_4[Keep the default single inbox path intact when no target mode is used.]
    ROUTE --> VERIFY[Verify the scanner]
    VERIFY --> VERIFY_1[Run python -m py_compile stub.py.]
    VERIFY --> VERIFY_2[Run a temp-tree scan/cache round-trip.]
    VERIFY --> VERIFY_3[Check python stub.py --help.]
    VERIFY --> LOG[Log the findings]
    LOG --> LOG_1[Write XP4L event records for the completed courier pass.]
    LOG --> LOG_2[Capture the discovery of the XP4Life vault and quest conventions.]
    LOG --> HANDOFF[Hand off the next courier gate]
    HANDOFF --> HANDOFF_1[Decide whether to surface the cache as a menu note or keep it local only.]
    HANDOFF --> HANDOFF_2[Run a live F:\ discovery pass if the next thread needs fresh routes.]

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
    class REOPEN,REOPEN_1,REOPEN_2,REOPEN_3,ROUTE,ROUTE_1,ROUTE_2,ROUTE_3,ROUTE_4,VERIFY,VERIFY_1,VERIFY_2,VERIFY_3,LOG,LOG_1,LOG_2 done;
```

## Workflow Map
```mermaid
flowchart TD
    START[Open the courier session] --> INVENTORY[Inspect stub.py README.txt and XP4Life quest conventions]
    INVENTORY --> SCAN[Add drive-wide route discovery]
    SCAN --> CACHE[Add save-targets and target-found cache flow]
    CACHE --> TEST[Validate compile help and temp-tree discovery]
    TEST --> RECORD[Write XP4L event records for the session]
    RECORD --> QUEST[Draft the active quest note from the workflow]
    QUEST --> HANDOFF[Leave the next courier gate ready for the following thread]

    classDef done fill:#e6ffed,stroke:#2ea043,color:#116329,stroke-width:2px;
    class START,INVENTORY,SCAN,CACHE,TEST,RECORD,QUEST done;
```

## Rewards
- XP: 240
- Achievement Unlocks: VF-SYS-005
- Title Reward: Route Finder I

## Completion Proof
- `stub.py` now supports `--target-all`, `--save-targets`, and `--target-found`.
- The courier was validated with compile checks, a temp-tree scan/cache round-trip, and `--help`.
- XP4L event records were written for the completed session findings.
- The real XP4Life vault and quest conventions were opened and confirmed for the follow-up quest work.

## Source Notes
- `F:\.4\stub.py`
- `F:\.4\README.txt`
- `F:\XP4Life\CODEX_START.md`
- `F:\XP4Life\Templates\New Quest.md`
- `F:\XP4Life\🖥 MENU\Quests\Active\VaultForge Decision Relay.md`
- `F:\XP4Life\🖥 MENU\Quests\Active\Quest Watcher Reliability Pass.md`

## Notes
- Hand-authored from the current terminal session using `$create-quest-from-workflow`.
- The quest stays readable as plain Markdown and keeps the courier changes separate from XP4L scoring logic.
