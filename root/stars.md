---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

pinned items molecule in [[prysm]]

a stack of [[prysm/ion]] icons representing [[aip]] applications or other items bookmarked by the [[neuron]]. quick-access favorites. configurable by avatar — the neuron chooses what to pin

## protocol role

stars is a molecule in the element tree $\mathcal{T}$. membrane = bottom-l zone of [[prysm/grid]]. stars occupies fix($25g$) × auto on desktop, auto × fix($6g$) on mobile

## sizing

| viewport | sizing | container | max items |
|----------|--------|-----------|-----------|
| desktop | fix($25g$) × auto | stack vertical, gap $g$ | unlimited |
| mobile ($\square_w \leq 96g$) | auto × fix($6g$) | stack horizontal, gap $g/2$ | 4 |

$s_{min} = (4g, 4g)$ — one icon visible

## structure

desktop:
```
glass [fix(25g) × auto, depth midground]
  stack vertical [gap g]
    ion [4g, pinned aip 1]
    text [caption, aip name 1]
    ion [4g, pinned aip 2]
    text [caption, aip name 2]
    ...
```

mobile:
```
stack horizontal [auto × fix(6g), gap g/2]
  ion [4g, pinned 1]
  ion [4g, pinned 2]
  ion [4g, pinned 3]
  ion [4g, pinned 4]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): vertical stack, icons with labels (text caption)
- $l_2$ ($w_{min} = 4g$): vertical stack, icons only
- $l_3$ ($w_{min} = 0$, mobile): horizontal stack, max 4 icons, no labels

## interaction

tap on a pinned ion → navigates to that [[aip]] page. long-press → unpin (remove from stars). stars are ordered by the avatar — drag to reorder on desktop

## emotion

stars do not carry [[emotion]] by default — they are neutral bookmarks. an individual star icon inherits the [[emotion]] of the [[aip]] it represents if that aip has an active state (e.g. unread messages in sense, balance change in sigma)

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | icon at standard color | — |
| hover | icon scale 1.1×, label appears (if folded to icon-only) | pointer over star |
| active | icon scale 0.95× | tap |
| dragging | icon follows pointer, gap opens at new position | long-press + drag (desktop) |

state transitions: $150\text{ms}$ ease

## where in [[prysm/grid]]

| viewport | grid zone | position |
|----------|-----------|----------|
| desktop | bottom-l (top half) | above [[prysm/graph]] |
| mobile | stars area in bottom row | left of commander |

## 3D

stars render at the same $p_z$ as the grid frame (persistent, $\mathcal{U} = 10$). icons face the neuron (billboard)

## ECS

- Entity: stars organelle
- Components:
  - `Sizing { width, height }`
  - `Stack { direction, gap }`
  - `FoldSet { conformations }`
  - `PinnedItems { list of (aip_id, icon_name, label) }`
- System: `StarsSystem` reads avatar's pinned items, spawns ion + text children. `StarsDragSystem` handles reorder on desktop
