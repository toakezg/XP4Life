---
note_type: map
created: 2026-04-11
status: active
tags:
  - map
  - roadmap
  - mermaid
---
# ROADMAP

This map shows the current project path. Green means complete, purple means in progress, and grey means upcoming.

```mermaid
flowchart TD
    TODO_A["TODO / TASKS"]

    P1["Phase 1: Playable Foundation"]
    P2["Phase 2: Governance, Plugins, Maps, Git Prep"]
    P3["Phase 3: Dashboard and Creation Flow Upgrades"]
    P4["Phase 4: Level Curve, Quest Chains, Visual Progression"]

    TODO_B["TODO / TASKS"]
    GIT["First Clean Git Commit"]
    FUTURE["Future Expansion"]

    TODO_A --> P1
    TODO_A --> P2
    P1 --> TODO_B
    P2 --> TODO_B
    TODO_B --> GIT
    GIT --> P3
    P3 --> P4
    P4 --> FUTURE

    classDef complete fill:#2f7d32,stroke:#1f5c24,color:#ffffff;
    classDef progress fill:#7b3fb3,stroke:#4d2475,color:#ffffff;
    classDef upcoming fill:#e7e7e7,stroke:#9a9a9a,color:#333333;
    classDef task fill:#f5f5f5,stroke:#888888,color:#222222;

    class P1 complete;
    class P2,GIT progress;
    class P3,P4,FUTURE upcoming;
    class TODO_A,TODO_B task;
```

## Scope Gate
Phase 2 should not be considered complete until:
- required docs are current
- health review findings are triaged
- map layer exists
- obvious scratch/test artifacts are handled
- first commit inclusion rules are decided
- first baseline commit is created
