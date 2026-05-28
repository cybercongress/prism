---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

pinned items molecule in [[prysm]]

a circular ring of [[prysm/ion]] icons arranged around the [[prysm/graph]] minimap. each icon = a pinned [[aip]] application or other item bookmarked by the [[neuron]]. quick-access favorites. configurable by avatar

## protocol role

molecule in the element tree $\mathcal{T}$. membrane = bottom-l zone of [[prysm/grid]]. stars + graph form a combined unit: graph in the center, star icons orbiting around it

## sizing

| viewport | sizing |
|----------|--------|
| desktop | fix($25g$) × auto — circular layout around graph |
| mobile ($\square_w \leq 96g$) | auto × fix($6g$) — linear horizontal row, max 4 |

$s_{min} = (4g, 4g)$ — one icon visible

## structure

desktop — circular ring around graph:
```
layer [fix(25g) × fix(25g)]
  --- graph minimap at center ---
  graph [fix(12g) × fix(12g), center]
  --- star icons arranged in circle around graph ---
  ion [4g, aip 1, position: angle 0°, radius 10g from center]
  ion [4g, aip 2, position: angle 30°, radius 10g]
  ion [4g, aip 3, position: angle 60°, radius 10g]
  ion [4g, aip 4, position: angle 90°, radius 10g]
  ...
```

icons are distributed evenly around the circle. radius = distance from graph center to icon center. as more icons are pinned, they spread around the full 360°

mobile — horizontal row:
```
stack horizontal [auto × fix(6g), gap g/2]
  ion [4g, pinned 1]
  ion [4g, pinned 2]
  ion [4g, pinned 3]
  ion [4g, pinned 4]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): circular ring around graph, all icons visible
- $l_2$ ($w_{min} = 10g$): smaller circle, icons overlap at high count
- $l_3$ ($w_{min} = 0$, mobile): horizontal stack, max 4 icons, no graph

## interaction

- tap star icon → navigates to that [[aip]] page
- long-press → unpin (remove from stars)
- drag to reorder on desktop (changes angle position in circle)
- graph minimap in center is independently interactive (tap to navigate)

## emotion

star icons inherit [[emotion]] from their [[aip]]: sense icon glows when unread messages, sigma when balance change. idle icons are neutral

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | icons at standard color in circle | — |
| hover | hovered icon scale 1.1×, label appears | pointer over star |
| active | icon scale 0.95× | tap |
| dragging | icon follows pointer along circular track | long-press + drag (desktop) |

state transitions: $150\text{ms}$ ease

## where in [[prysm/grid]]

| viewport | grid zone | position |
|----------|-----------|----------|
| desktop | bottom-l | circular layout combining stars + graph |
| mobile | stars area in bottom row | left of commander (linear) |

## 3D

stars render at frame $p_z$ ($\mathcal{U} = 10$). in 3D, star icons orbit the graph minimap as a ring in the xz-plane. icons face the neuron (billboard)

## ECS

- Entity: stars organelle
- Components:
  - `Sizing { width, height }`
  - `CircularLayout { radius, center }` — desktop: positions icons in circle
  - `Stack { direction, gap }` — mobile: linear fallback
  - `FoldSet { conformations }`
  - `PinnedItems { list of (aip_id, icon_name, label, angle) }`
- Systems:
  - `StarsSystem` reads avatar's pinned items, computes angle positions
  - `StarsDragSystem` handles reorder on desktop (updates angle)
