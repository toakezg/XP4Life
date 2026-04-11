---
note_type: system
created: 2026-04-10
status: active
tags:
  - core
  - system
  - overview
---
# XP4Life System Overview

XP4Life is a playable progression system for real-world work, creative output, money moves, and personal growth. The vault is meant to feel like an RPG layer over actual execution, not a replacement for practical planning.

## The Core Loop
Tasks -> Quests -> Achievements -> XP -> Titles -> Progression

### Tasks
- Small actionable steps.
- Stored as markdown checkboxes inside quest notes or daily working notes.
- Best used to create momentum and visible execution.

### Quests
- Multi-step missions made of tasks.
- The main bridge between action and progression.
- Carry status, tier, category, due dates, XP rewards, and linked achievements.

### Achievements
- Milestones that recognize meaningful progress.
- Use global rarity and industry rarity so wins feel grounded and real.
- Can unlock titles, new quest paths, or new system layers later.

### XP
- Reward currency earned from completed quests and unlocked achievements.
- Tracks motion across categories without relying on mood or guesswork.
- Can support future level scaling once the base system has enough history.

### Titles
- Identity rewards earned through repeated proof, not wishful thinking.
- Mark a new phase of capability such as Builder, Toolsmith, or Forge Operator.

## Design Intent
- Readability first.
- YAML is the source of truth.
- Dataview and DataviewJS provide summaries and totals.
- Tasks plugin handles the action layer.
- The system should stay modular, easy to extend, and easy to maintain by hand.

## Rarity Model
- `global_rarity` estimates how rare an achievement is across the general population.
- `industry_rarity` estimates how rare it is among people in the relevant field.
- Tiers reflect feel as well as rarity:

| Tier | Global Range | Meaning |
| --- | --- | --- |
| Common | 20-80% | Reachable with basic follow-through |
| Uncommon | 5-20% | Requires effort and intent |
| Rare | 1-5% | Requires real commitment |
| Epic | 0.1-1% | Signals strong capability |
| Legendary | below 0.1% | Major, uncommon achievement |
| Mythic | below 0.01% | Elite and exceptional |

## Operating Rhythm
1. Pick active quests from the dashboard.
2. Work the checkboxes inside those quest notes.
3. When quest criteria are met, mark the quest completed and move it to `🖥 MENU/Quests/Completed/`.
4. Claim any linked achievements by setting `unlocked: true` and adding `unlocked_on`.
5. Update any title that should now be active.
6. Let the dashboard reflect the new state.

## Long-Term Direction
- Achievement chains and unlock paths.
- QuickAdd or Buttons actions for claiming rewards.
- DataviewJS for richer XP and category summaries.
- Tracker or Charts for streaks and progression history.
- Possible future automation hooks tied to VaultForge or other outputs.
