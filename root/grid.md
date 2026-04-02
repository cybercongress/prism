---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

screen layout grid for [[prysm]]

the coordinate system of [[cyb]]. every atom, molecule, and cell positions itself within this grid. two viewports, one grid logic

## viewports

| mode | baseline | breakpoint |
|------|----------|------------|
| desktop | 1920 × 1080 | > 768px |
| mobile | 390 × 844 | <= 768px |

## desktop zones (1920 × 1080)

```
+--------+----------------------+--------+
| app    |                      | avatar |
+--------+                      +--------+
| brain  |                      |        |
| menu   |      content         |   Σ    |
|        |                      |        |
|   S    |                      |        |
|        |                      |        |
+--------+----------+-----------+--------+
| graph  | commander|   time    |
| + aips |          |           |
+--------+----------+-----------+
```

### top row

| zone | position | size | content |
|------|----------|------|---------|
| app + menu | top-left | 48 × 48 + dropdown | active [[aip]] icon + name, tap opens app menu list |
| avatar | top-right | 48 × 48 | active [[neuron]] [[prysm/avatar]], tap to switch accounts |

### left side

| zone | position | size | content |
|------|----------|------|---------|
| brain menu (expanded) | left edge, below app | 200 × auto | [[cyb/brain]] file tree: main, Particles, brain, Stats, Blocks, Txs, Contracts, Libs |
| sense side button | left edge, vertical center | 32 × 48 | [[cyb/sense]] collapsed, shows unread count |
| sense (expanded) | left edge | 320 × auto | messaging panel |

### right side

| zone | position | size | content |
|------|----------|------|---------|
| sigma side button | right edge, vertical center | 32 × 48 | [[cyb/sigma]] collapsed |
| sigma (expanded) | right edge | 320 × auto | wallet panel |

### center

| zone | position | size | content |
|------|----------|------|---------|
| adviser | top center, below app/avatar row | fills between sidebars × 32 | contextual [[prysm/adviser]] messages, hidden when empty |
| content | center | fills remaining space | scrollable, max-width 960px centered, padding 24px |

### bottom row

three zones side by side, no overlap:

| zone | position | size | content |
|------|----------|------|---------|
| graph preview + aip ring | bottom-left | 200 × 200 | minimap of current position in [[cybergraph]], surrounded by [[aip]] icons for quick app switching |
| commander | bottom-center | flexible width × 48 | [[prysm/mind]]: [[prysm/input]] (search/command) + navigation arrows + sign button |
| time | bottom-right | 200 × 200 | [[prysm/time-widget]]: recent actions feed ("Teleport 37 sec ago") + machine time counter ("20 543 days 07:51") |

## mobile grid (390 × 844)

```
+---------+-------------------+---------+
| context |      adviser      | avatar  |
+---------+                   +---------+
|  menu   |                   |  menu   |
|         |                   |         |
|         |                   |         |
|         |                   |         |
|S        |       space       |        Σ|
|         |                   |         |
|         |                   |         |
|         |                   |         |
+---------+-------------------+---------+
| S| S|S|S|    commander      |  time   |
+-+--+--+-+-------------------+---------+
```

### mobile differences

- context and avatar menus slide out from left and right edges
- S (sense) and Σ (sigma) on left and right edges, same as desktop
- bottom row is one line: 4 star slots (pinned aips, max 4) + commander + time
- time compressed but present, right side
- graph accessible through context menu
- adviser appears as top bar overlay when triggered

## 8px grid

all positioning snaps to 8px increments

| unit | px | use |
|------|----|-----|
| 1 | 8 | minimum spacing, icon gaps |
| 2 | 16 | mobile content padding, element gaps |
| 3 | 24 | desktop content padding, section gaps |
| 4 | 32 | sidebar collapsed width, side buttons |
| 6 | 48 | commander height, button height, standard row height |

## z-index layers

| layer | z | content |
|-------|---|---------|
| background | 0 | page-level [[prysm/glass]] |
| content | 10 | cards, sections, feeds |
| sidebar | 20 | expanded brain/sense/sigma panels |
| commander | 30 | bottom action bar (always visible) |
| overlay | 40 | [[prysm/tooltip]], [[prysm/adviser]], bottom sheets |
| modal | 50 | confirmations, destructive action dialogs |
