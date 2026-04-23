---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

pinned items molecule in [[prysm]]

a stack of ion'ов representing [[aip]] applications or other items bookmarked by the [[neuron]]. quick-access favorites. configurable by avatar

## protocol role

stars is a molecule in the element tree $\mathcal{T}$. membrane = bottom-l zone of [[prysm/grid]]. stars occupies fix($25g$) × auto on desktop, auto × fix($6g$) on mobile

## sizing

| viewport | sizing | container | max items |
|----------|--------|-----------|-----------|
| desktop | fix($25g$) × auto | stack vertical | unlimited |
| mobile ($\square_w \leq 96g$) | auto × fix($6g$) | stack horizontal | 4 |

$s_{min}$: one ion at $4g$ × $4g$ — minimum one pinned item visible

## structure

```
glass [fix(25g) × auto, depth midground] (desktop)
  ion [4g, pinned aip 1]
  ion [4g, pinned aip 2]
  ion [4g, pinned aip 3]
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
- $l_1$ ($w_{min} = 25g$): vertical stack, all pinned items with labels
- $l_2$ ($w_{min} = 4g$): vertical stack, icons only
- $l_3$ ($w_{min} = 0$, mobile): horizontal stack, max 4 icons

## where in [[prysm/grid]]

| viewport | grid zone | position |
|----------|-----------|----------|
| desktop | bottom-l (top half) | above graph |
| mobile | stars area in bottom row | left of commander |

## ECS

- Entity: stars organelle
- Components:
  - `Sizing { width, height }`
  - `Stack { direction, gap }`
  - `FoldSet { conformations }`
  - `PinnedItems { list of aip references }`
- System: `StarsSystem` reads avatar's pinned items, spawns ion children
