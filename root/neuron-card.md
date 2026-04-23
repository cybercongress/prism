---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

[[neuron]] identity card molecule in [[prysm]]

the face of a [[neuron]]. shows who someone is: avatar image, address (with hash bars), [[karma]], rank. the primary way neurons recognize each other

## protocol role

molecule in $\mathcal{T}$. lives inside space zone content, search results, feeds, [[prysm/cyberver-cell]]

## sizing

fill × auto

$s_{min} = (10g, 6g)$

## structure

big:
```
glass [fill × auto, depth midground]
  stack horizontal [gap g]
    glass [fix(6g) × fix(6g), corner-radius 3g] — avatar image (circle)
    stack vertical [gap g/2]
      text [h3, name or alias]
      address [small]
      stack horizontal [gap g]
        counter [karma]
        counter [rank]
```

small:
```
glass [fill × fix(6g), depth midground]
  stack horizontal [gap g/2]
    glass [fix(4g) × fix(4g), corner-radius 2g] — avatar (circle)
    text [caption, name]
    counter [karma, micro]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): big — avatar + name + address + karma + rank
- $l_2$ ($w_{min} = 15g$): small — avatar + name + rank
- $l_3$ ($w_{min} = 6g$): avatar image only

## emotion

avatar border reflects [[karma]]: green (high), white (medium), red (low). same as [[prysm/avatar]]

## states

| state | visual | trigger |
|-------|--------|---------|
| default | card visible | — |
| hover | glass opacity +0.1, name underline | pointer over |
| active | navigate to neuron profile | tap |

state transitions: $150\text{ms}$ ease

## 3D

renders at membrane's $p_z$. avatar image faces neuron (billboard)

## ECS

- Entity: neuron-card organelle
- Components:
  - `Sizing { width: Fill, height: auto }`
  - `NeuronIdentity { address, name, karma, rank, avatar_cid }`
  - `FoldSet { conformations }`
  - `Emotion { border_color }` — from karma
  - `TapAction { navigate_to: neuron_profile }`
- System: `NeuronCardSystem` reads neuron data, writes identity components
