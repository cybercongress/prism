---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

identity molecule in [[prysm]]

the active [[neuron]] identity display. shows who is using [[cyb]] — avatar image (glass circle), name or address, and key metric. occupies the top-right zone of [[prysm/grid]]. tap opens menu avatar

## protocol role

avatar is a molecule in the element tree $\mathcal{T}$. membrane = avatar zone of [[prysm/grid]] (row 1, col 3). fix($25g$) × fix($6g$) on desktop, auto × fix($4g$) on mobile. $\mathcal{U} = 10$ (persistent)

## sizing

| viewport | sizing |
|----------|--------|
| desktop | fix($25g$) × fix($6g$) |
| mobile ($\square_w \leq 96g$) | auto × fix($4g$) |

$s_{min} = (4g, 4g)$ — avatar image only

## structure

desktop:
```
glass [fix(25g) × fix(6g), depth midground]
  stack horizontal [gap g/2]
    glass [fix(4g) × fix(4g), corner-radius 2g] — avatar image (circle)
    stack vertical
      text [caption, name or alias]
      text [micro, truncated address or karma]
```

mobile:
```
glass [fix(4g) × fix(4g), corner-radius 2g] — avatar image only
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): image + name + address/karma
- $l_2$ ($w_{min} = 12g$): image + name
- $l_3$ ($w_{min} = 4g$): image only (mobile)

## emotion

avatar border reflects the neuron's [[karma]] state:

| karma | border color |
|-------|-------------|
| high | #00fe00 (green) |
| medium | #ffffff (white, no border) |
| low | #ff0000 (red) |

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | avatar image + info | — |
| hover | glass opacity +0.1, name underline | pointer over avatar |
| active | scale 0.95× | tap |

state transitions: $150\text{ms}$ ease

## interaction

tap → opens menu avatar (slide-out from right edge, z: 30). menu contains: account switching, identity settings

## variants

| variant | use |
|---------|-----|
| grid zone | top-right of [[prysm/grid]] — the primary identity display |
| 2-line | inside messages, comments — compact attribution |
| chooser | in menu avatar — selectable identity with radio indicator |

## where in [[prysm/grid]]

grid zone: avatar (row 1, col 3)

## 3D

avatar renders at frame $p_z$ ($\mathcal{U} = 10$). avatar image faces the neuron (billboard)

## ECS

- Entity: avatar organelle
- Components:
  - `Sizing { width, height }`
  - `GridArea { name: "avatar" }`
  - `FoldSet { conformations }`
  - `NeuronIdentity { address, name, karma, avatar_cid }`
  - `Trigger::Tap { opens: menu_avatar }`
  - `Emotion { border_color }` — from karma
- System: `AvatarSystem` reads active neuron identity, writes `NeuronIdentity` and `Emotion`
