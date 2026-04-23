---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

result filtering molecule in [[prysm]]

a row of toggleable options that narrow a result set. each option is a [[prysm/pill]] or [[prysm/toggle]]. tap to activate, tap again to deactivate

## protocol role

molecule in $\mathcal{T}$. lives inside space zone content, above [[prysm/table]] or result lists

## sizing

fill × fix($6g$)

$s_{min} = (12g, 4g)$ — minimum 2 options visible

## structure

```
glass [fill × fix(6g), depth midground]
  stack horizontal [gap g/2]
    pill [option 1, toggleable]
    pill [option 2, toggleable]
    pill [option 3, toggleable]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): all options visible
- $l_2$ ($w_{min} = 12g$): horizontal scroll, fade edges

## emotion

active filter pill tints with [[emotion]] (default #00fe00 green). inactive: neutral (#4b4b4d)

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | pills at neutral | — |
| active (per pill) | pill tints with emotion | tap |

state transitions: $150\text{ms}$ ease

## 3D

renders at membrane's $p_z$

## ECS

- Entity: filter organelle
- Components:
  - `Sizing { width: Fill, height: Fix(6) }`
  - `FilterOptions { list of (label, count, active) }`
  - `FoldSet { conformations }`
- System: `FilterSystem` handles toggle, updates `FilterOptions`, emits filter predicate for [[prysm/table]]
