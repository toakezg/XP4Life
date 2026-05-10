---
note_type: dashboard
created: 2026-04-10
status: completed
tags:
  - dashboard
  - dataview
---
____
![[XP4Life-emblem.png]]

#  Dashboard
____

#  ![154](../Assets/images/attatched/(imagename)/total.png)TOTAL XP  
```dataviewjs
const summaries = dv.pages('"Systems/XP4L"')
  .where(p => p.note_type === "xp4l_summary")
  .sort(p => p.file.mtime, 'desc')
  .array();

const latest = summaries[0];

const completedQuests = dv.pages('"🖥 MENU/Quests"')
  .where(p => p.status === "completed")
  .array();

const unlockedAchievements = dv.pages('"🖥 MENU/Achievements"')
  .where(p => p.unlocked === true)
  .array();

const questXp = completedQuests.reduce((sum, p) => sum + Number(p.xp_reward ?? 0), 0);
const achievementXp = unlockedAchievements.reduce((sum, p) => sum + Number(p.xp_bonus ?? 0), 0);
const eventXp = Number(latest?.cumulative_total_xp ?? latest?.event_xp_awarded ?? 0);

dv.paragraph(`**${questXp + achievementXp + eventXp} XP**`);
dv.paragraph(`Quest XP: ${questXp}`);
dv.paragraph(`Achievement XP: ${achievementXp}`);
dv.paragraph(`Event XP: ${eventXp}`);
dv.paragraph(`Events Processed: ${latest?.cumulative_events_processed ?? 0}`);
dv.paragraph(`Rewards Issued: ${latest?.total_rewards_issued_count ?? 0}`);
```
____
## ![189](../Assets/images/attatched/(imagename)/open%20quets-2.png)Progress by Category   
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
____



___
##  ![154](../Assets/images/attatched/(imagename)/quest_book-1.png)Active Quests
```dataview
TABLE quest_id AS "Quest ID", category AS "Category", tier AS "Tier", xp_reward AS "XP", due AS "Due"
FROM "🖥 MENU/Quests"
WHERE quest_id AND status = "active"
SORT due ASC
SORT file.name ASC
```
____


## ![169](../Assets/images/attatched/(imagename)/quest_book.png)Completed Quests
```dataview
TABLE quest_id AS "Quest ID", category AS "Category", tier AS "Tier", xp_reward AS "XP"
FROM "🖥 MENU/Quests"
WHERE quest_id AND status = "completed"
SORT file.name ASC
```
_____
_____
## ![174](../Assets/images/attatched/(imagename)/achievment.png)Unlocked Achievements
```dataview
TABLE achievement_id AS "Achievement ID", category, tier, xp_bonus AS "XP Bonus", unlocked, unlocked_on
FROM "🖥 MENU/Achievements/Unlocked"
WHERE xp4l_generated = true
SORT unlocked_on DESC
```

____



## ![172](../Assets/images/attatched/(imagename)/open%20quets-1.png)Current Titles
```dataview
TABLE category AS "Category", tier AS "Tier", unlocked_on AS "Unlocked"
FROM "🖥 MENU/Titles"
WHERE unlocked = true
SORT unlocked_on DESC
```
___





____

##   ![167](../Assets/images/attatched/(imagename)/open.png) QUEST TASKS
```dataview
 TASK
 WHERE !completed
```


```#tasks
not done
path includes 🖥 MENU/Quests
sort by due
sort by path
```

## Suggested Next Steps
- Complete `Build the Command Deck` to make the dashboard more useful in daily use.
- Run one more quest through the full reward loop now that the foundation plugins are installed.
- Start `Batch Forge Trial` or `Reusable Tool Pass` once a concrete build target is chosen.
- Claim achievements by updating YAML as soon as proof exists.


