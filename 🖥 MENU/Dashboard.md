---
note_type: dashboard
created: 2026-04-10
status: completed
tags:
  - dashboard
  - dataview
---
#  Dashboard

## Active Quests
```dataview
TABLE quest_id AS "Quest ID", category AS "Category", tier AS "Tier", xp_reward AS "XP", due AS "Due"
FROM "🖥 MENU/Quests"
WHERE quest_id AND status = "active"
SORT due ASC
SORT file.name ASC
```

## Open Quest Tasks
```tasks
not done
path includes 🖥 MENU/Quests
sort by due
sort by path
```

## Completed Quests
```dataview
TABLE quest_id AS "Quest ID", category AS "Category", tier AS "Tier", xp_reward AS "XP"
FROM "🖥 MENU/Quests"
WHERE quest_id AND status = "completed"
SORT file.name ASC
```

## Unlocked Achievements
```dataview
TABLE achievement_id AS "Achievement ID", category AS "Category", tier AS "Tier", xp_bonus AS "XP Bonus", unlocked_on AS "Unlocked"
FROM "🖥 MENU/Achievements"
WHERE unlocked = true
SORT unlocked_on DESC
```

## Total XP
```dataviewjs
const completedQuests = dv.pages('"🖥 MENU/Quests"')
  .where(p => p.status === "completed")
  .array();
const unlockedAchievements = dv.pages('"🖥 MENU/Achievements"')
  .where(p => p.unlocked === true)
  .array();

const questXp = completedQuests.reduce((sum, p) => sum + Number(p.xp_reward ?? 0), 0);
const achievementXp = unlockedAchievements.reduce((sum, p) => sum + Number(p.xp_bonus ?? 0), 0);

dv.paragraph(`**${questXp + achievementXp} XP**`);
dv.paragraph(`Quest XP: ${questXp}`);
dv.paragraph(`Achievement XP: ${achievementXp}`);
```

^5af695

## Current Titles
```dataview
TABLE category AS "Category", tier AS "Tier", unlocked_on AS "Unlocked"
FROM "🖥 MENU/Titles"
WHERE unlocked = true
SORT unlocked_on DESC
```

## Progress by Category
```dataviewjs
const questPages = dv.pages('"🖥 MENU/Quests"');
const achievementPages = dv.pages('"🖥 MENU/Achievements"');
const categories = ["build", "system", "creative", "money", "personal"];
const rows = categories.map(category => {
  const completedQuests = questPages.where(p => (p.category ?? "").toLowerCase() === category && p.status === "completed").length;
  const activeQuests = questPages.where(p => (p.category ?? "").toLowerCase() === category && p.status === "active").length;
  const unlockedAchievements = achievementPages.where(p => (p.category ?? "").toLowerCase() === category && p.unlocked === true).length;
  return [category, activeQuests, completedQuests, unlockedAchievements];
});
dv.table(["Category", "Active Quests", "Completed Quests", "Unlocked Achievements"], rows);
```

## Suggested Next Steps
- Complete `Build the Command Deck` to make the dashboard more useful in daily use.
- Run one more quest through the full reward loop now that the foundation plugins are installed.
- Start `Batch Forge Trial` or `Reusable Tool Pass` once a concrete build target is chosen.
- Claim achievements by updating YAML as soon as proof exists.


