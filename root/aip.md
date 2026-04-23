---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

entity card molecule in [[prysm]]

the universal card for any entity in the [[cybergraph]] — a [[particle]], [[neuron]], or [[aip]]. shows identity, metadata, and available actions in a compact format

## protocol role

molecule in $\mathcal{T}$. lives inside space zone content, search results, [[prysm/oracle-cell]], feeds

## sizing

fill × auto

$s_{min} = (10g, 4g)$

## structure

2-line:
```
glass [fill × auto, depth midground]
  stack horizontal [gap g]
    ion [4g, entity icon]
    stack vertical
      text [body, title]
      text [caption, subtitle]
```

3-line:
```
glass [fill × auto, depth midground]
  stack horizontal [gap g]
    ion [4g, entity icon]
    stack vertical
      text [body, title]
      text [caption, subtitle]
      text [micro, description]
    toggle [star, favorite]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): 3-line + star + context menu
- $l_2$ ($w_{min} = 15g$): 2-line
- $l_3$ ($w_{min} = 6g$): icon + title only

## emotion

glass accent from entity [[cyberank]]: high-confidence = green, low = neutral

## states

| state | visual | trigger |
|-------|--------|---------|
| default | card visible | — |
| hover | glass opacity +0.1, menu trigger appears | pointer over |
| expanded | context menu (link, stake, share) visible | tap menu trigger |
| active | navigate to entity | tap card |

state transitions: $150\text{ms}$ ease

## 3D

renders at membrane's $p_z$. gravity determines depth — high-focus entities are closer to neuron

## ECS

- Entity: aip card organelle
- Components:
  - `Sizing { width: Fill, height: auto }`
  - `AipEntity { type, cid, title, subtitle, icon }`
  - `FoldSet { conformations }`
  - `Emotion { accent_color }` — from cyberank
  - `ToggleStar { favorited }`
  - `TapAction { navigate_to }`
- System: `AipCardSystem` reads entity data, writes components
