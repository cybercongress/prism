---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

toolbar molecule in [[prysm]]

[[prysm/saber]] + [[prysm/ion]] composite. the universal toolbar pattern — a saber line with ions attached, creating labeled action strips, input rows, and display headers

## protocol role

molecule in $\mathcal{T}$. lives inside space zone content, [[prysm/table]] headers, [[prysm/display]]

## sizing

fill × fix($6g$)

$s_{min} = (8g, 4g)$

## structure

```
stack horizontal [gap g/2]
  saber [vertical, g/4]
  ion [2g] + text [caption]
  saber [vertical, g/4]
  ion [2g] + text [caption]
  saber [vertical, g/4]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 20g$): all items with labels
- $l_2$ ($w_{min} = 8g$): icons only

## variants

| variant | layout | use |
|---------|--------|-----|
| 1-sided | saber on one edge, ions extend | section headers |
| bi-sided | saber on both edges | centered action groups |
| horizontal | saber runs horizontally, ions above/below | full-width dividers |

each variant supports modes: button (clickable), input (data entry), display (read-only)

## emotion

saber glow carries [[emotion]] of the context (default #ffffff)

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | sabers white | — |
| hover | hovered item brightens | pointer over item |
| active | item scales 0.95× | tap |

state transitions: $150\text{ms}$ ease

## 3D

renders at membrane's $p_z$

## ECS

- Entity: bar organelle
- Components:
  - `Sizing { width: Fill, height: Fix(6) }`
  - `BarVariant { one_sided | bi_sided | horizontal }`
  - `BarMode { button | input | display }`
  - `BarItems { list of (icon, label, action) }`
  - `FoldSet { conformations }`
- System: `BarSystem` handles item interactions
