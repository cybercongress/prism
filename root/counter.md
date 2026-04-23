---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
stake: 16344441177307554
diffusion: 0.00026497884593268834
springs: 0.0005677933308875936
heat: 0.0005027487276286586
focus: 0.00040337716775836575
gravity: 4
density: 6.31
---

numeric display molecule in [[prysm]]

renders a number with [[emotion]] color. text (number) + saber (change indicator line). used for [[karma]], token balance, [[cyberank]], link count

## protocol role

molecule in $\mathcal{T}$. lives inside [[prysm/neuron-card]], [[prysm/aip]], [[prysm/display]], [[prysm/widget]]

## sizing

fix(auto, content) × fix($4g$)

$s_{min} = (4g, 2g)$ — minimum for one digit visible

## structure

```
stack vertical
  text [h3 or body, number, emotion color]
  saber [horizontal, g/8, emotion color, fix(3g)]
```

saber = change indicator. its length shows magnitude of recent change

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 10g$): full number + change indicator
- $l_2$ ($w_{min} = 4g$): abbreviated number (1.2k, 3.4M) + no indicator

## emotion

| change | text color | saber color |
|--------|-----------|------------|
| growth | #00fe00 (green) | #00fe00 |
| decline | #ff0000 (red) | #ff0000 |
| stable | #ffffff (white) | #ffffff |

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | number at current value | — |
| updated | number flashes, saber appears | value changed |
| loading | skeleton placeholder | fetching value |

state transitions: $150\text{ms}$ ease

## 3D

renders at membrane's $p_z$. faces neuron (billboard)

## ECS

- Entity: counter organelle
- Components:
  - `Sizing { width: auto, height: Fix(4) }`
  - `CounterValue { current, previous, format }`
  - `FoldSet { conformations }`
  - `Emotion { color }` — from value change direction
- System: `CounterSystem` reads data source, computes change direction, writes `Emotion`
