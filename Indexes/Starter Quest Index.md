---
note_type: index
created: 2026-04-10
status: active
tags:
  - index
  - quests
---
# Starter Quest Index

## Main Questline
1. Forge Foundations
2. Build the Command Deck
3. Quest Engine Setup
4. Reusable Tool Pass
5. Batch Forge Trial
6. Signal to Market
7. First Client Run

## Live Quest Table
```dataview
TABLE status AS "Status", category AS "Category", tier AS "Tier", xp_reward AS "XP", achievement_unlocks AS "Achievement Unlocks"
FROM "🖥 MENU/Quests"
WHERE quest_id
SORT tier ASC, file.name ASC
```

## By Category
```dataview
TABLE rows.file.link AS "Quests", rows.tier AS "Tier", rows.status AS "Status"
FROM "🖥 MENU/Quests"
WHERE quest_id
GROUP BY category
```

## Notes
- Keep active quests visible and limited.
- Move completed quest notes into `🖥 MENU/Quests/Completed/` once the reward is claimed.
