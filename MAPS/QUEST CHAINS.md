---
note_type: map
created: 2026-04-11
status: planned
tags:
  - map
  - quest-chains
  - mermaid
---
# QUEST CHAINS

Quest chains are not being built in detail yet. This note reserves the direction for Phase 4 so the current work stays scoped.

```mermaid
flowchart TD
    CORE["Core System Questline"]
    BUILD["Build Track"]
    CREATIVE["Creative Track"]
    MONEY["Money Track"]
    PERSONAL["Personal Track"]

    CHAINS["Quest Chains System"]
    ACH["Achievement Unlock Paths"]
    TITLES["Title Progression"]
    MAP["Visual Skill / Quest Map"]

    CORE --> CHAINS
    BUILD --> CHAINS
    CREATIVE --> CHAINS
    MONEY --> CHAINS
    PERSONAL --> CHAINS
    CHAINS --> ACH
    ACH --> TITLES
    TITLES --> MAP

    classDef progress fill:#7b3fb3,stroke:#4d2475,color:#ffffff;
    classDef upcoming fill:#e7e7e7,stroke:#9a9a9a,color:#333333;
    classDef planned fill:#f2f2f2,stroke:#b7b7b7,color:#444444;

    class CORE progress;
    class BUILD,CREATIVE,MONEY,PERSONAL,CHAINS,ACH,TITLES,MAP upcoming;
```

## Scope Rule
Do not build quest chains yet. Plan them only after:
- the first git baseline exists
- the dashboard is stable
- at least two real quest completion loops have been completed
- level and title rules are clearer

