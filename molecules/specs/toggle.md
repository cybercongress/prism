---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

binary state molecule in [[prysm]]

a two-state switch. tap to flip. glass track + glass thumb (circle). used for on/off, yes/no, favorite/unfavorite

## protocol role

molecule in $\mathcal{T}$. lives inside [[prysm/filter]], [[prysm/table]], [[prysm/launcher]], and other molecules

## sizing

fix($5g$) × fix($3g$)

$s_{min} = (5g, 3g)$ — toggle does not fold

## structure

```
glass [fix(5g) × fix(3g), corner-radius 3g/2] — track
  glass [fix(2g) × fix(2g), corner-radius g] — thumb (circle)
```

on: thumb at cx=26 (right), track #00fe00 at 25% opacity. off: thumb at cx=14 (left), track #4b4b4d at 25% opacity. thumb is always white (#ffffff)

## variants

| variant | visual | use |
|---------|--------|-----|
| on | thumb cx=26, track #00fe00 25% opacity | active state |
| off | thumb cx=14, track #4b4b4d 25% opacity | inactive state |
| star | ion(star-filled, #fcf000) vs ion(star-hollow, #777777) | bookmark/favorite in [[prysm/launcher]] |

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
| on | thumb cx=26, track #00fe00 25% | — |
| off | thumb cx=14, track #4b4b4d 25% | — |
| hover | track opacity 35%, stroke 1px | pointer over |
| disabled on | track 10% opacity, thumb #4b4b4d | membrane disabled |
| disabled off | track 15% opacity, thumb #333333 | membrane disabled |

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
