---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

binary state molecule in [[prysm]]

a two-state switch. tap to flip. glass track + glass thumb (circle). used for on/off, yes/no, favorite/unfavorite

## protocol role

molecule in $\mathcal{T}$. lives inside [[prysm/filter]], [[prysm/table]], [[prysm/aip]], and other molecules

## sizing

fix($5g$) × fix($3g$)

$s_{min} = (5g, 3g)$ — toggle does not fold

## structure

```
glass [fix(5g) × fix(3g), corner-radius 3g/2] — track
  glass [fix(2g) × fix(2g), corner-radius g] — thumb (circle)
```

on: thumb moves to right, track tints with [[emotion]] green. off: thumb at left, track gray

## variants

| variant | visual | use |
|---------|--------|-----|
| on | thumb right, track #00fe00 | active state |
| off | thumb left, track #4b4b4d | inactive state |
| star | ion (star glyph) replaces toggle | bookmark/favorite in [[prysm/aip]] |

## emotion

| state | color |
|-------|-------|
| on | #00fe00 (green) |
| off | #4b4b4d (gray) |
| star active | #fcf000 (yellow) |
| star inactive | #777777 (dim) |

## states

| state | visual change | trigger |
|-------|-------------|---------|
| on | thumb right, green track | — |
| off | thumb left, gray track | — |
| hover | track opacity +0.1 | pointer over |
| disabled | all dims, no interaction | membrane disabled |

state transitions: thumb slides $150\text{ms}$ ease

## 3D

renders at membrane's $p_z$. faces neuron (billboard)

## ECS

- Entity: toggle organelle
- Components:
  - `Sizing { width: Fix(5), height: Fix(3) }`
  - `ToggleState { on | off }`
  - `ToggleVariant { switch | star }`
  - `Emotion { color }`
- System: `ToggleSystem` handles tap, flips `ToggleState`, updates `Emotion`
