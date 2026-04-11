---
note_type: index
created: 2026-04-10
status: active
tags:
  - index
  - achievements
---
# Starter Achievement Index

## Achievement Table
```dataview
TABLE category AS "Category", tier AS "Tier", global_rarity AS "Global", industry_rarity AS "Industry", unlocked AS "Unlocked"
FROM "🖥 MENU/Achievements/Core"
WHERE achievement_id
SORT category ASC, tier ASC, file.name ASC
```

## Unlocked Achievement Table
```dataview
TABLE category AS "Category", tier AS "Tier", xp_bonus AS "XP Bonus", unlocked_on AS "Unlocked"
FROM "🖥 MENU/Achievements"
WHERE unlocked = true
SORT unlocked_on DESC
```

## Rarity Reminder
- Common: basic follow-through.
- Uncommon: intentional effort.
- Rare: real commitment.
- Epic: strong capability.
- Legendary: major milestone.
- Mythic: elite proof.
