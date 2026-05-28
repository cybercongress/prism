---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

continuous value molecule in [[prysm]]

a draggable control for selecting a value within a range. glass track + glass fill + glass handle (circle). snaps to $g$ grid

## protocol role

molecule in $\mathcal{T}$. lives inside [[prysm/input]], [[prysm/bar]], [[prysm/display]]

## sizing

fill × fix($3g$)

$s_{min} = (10g, 3g)$

## structure

```
glass [fill × fix(g/4), corner-radius g/8] — track background
glass [fix(level × track_w) × fix(g/4), corner-radius g/8, emotion tint] — fill
glass [fix(2g) × fix(2g), corner-radius g] — handle (circle)
```

## variants

| variant | interaction | use |
|---------|------------|-----|
| range | drag handle to set value | token amounts, delegation splits |
| progress | read-only, no handle | loading, staking progress (pill can also serve this) |

## emotion

fill color carries [[emotion]]:

| range | color |
|-------|-------|
| healthy | #00fe00 (green) |
| caution | #fcf000 (yellow) |
| danger | #ff0000 (red) |

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | handle at current position | — |
| hover | handle scale 1.2× | pointer over handle |
| dragging | handle follows pointer, fill updates | drag |
| disabled | gray, no interaction | membrane disabled |

state transitions: $150\text{ms}$ ease

## 3D

renders at membrane's $p_z$

## ECS

- Entity: slider organelle
- Components:
  - `Sizing { width: Fill, height: Fix(3) }`
  - `SliderValue { current, min, max, step }`
  - `SliderVariant { range | progress }`
  - `Emotion { color }`
- System: `SliderDragSystem` reads drag events, updates `SliderValue`, writes fill width
