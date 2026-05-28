---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

icon atom in [[prysm]]

a single glyph rendered at a fixed size. ion is the visual symbol — an icon that represents a concept, action, or state. when paired with [[prysm/text]] inside a molecule, they form an icon-label unit. but ion itself is only the icon

## protocol role

ion is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: vector. it has no sub-organelles. its membrane constrains it, it occupies a fixed square, membrane places it

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| icon | — | [[prysm/images]] glyph name | required |
| size | fix | $2g$, $5g/2$, $4g$, $6g$, $12g$ | $2g$ |
| color | — | #ffffff or [[emotion]] hex | #ffffff |

### size scale

| size | px at $g=8$ | corner-radius | where in [[prysm/grid]] |
|------|-------------|---------------|------------------------|
| $2g$ | 16px | rx=2 | inline with body text — commander: action icons, space: inline icons |
| $5g/2$ | 20px | rx=3 | standalone small — tabs in bottom row (stars) |
| $4g$ | 32px | rx=3 | medium — context, avatar: zone icons. S, Σ: widget icons |
| $6g$ | 48px | rx=4 | large — space: onboarding, featured content |
| $12g$ | 96px | rx=6 | hero — space: welcome screens |

## occupy

ion occupies a fixed square:

$$s = (size, size)$$

$s_{min} = (2g, 2g)$ — smallest legible icon

touch target: if $size < 4g$, the membrane adds padding to ensure the interactive area is at least $4g \times 4g$. the ion's occupied size does not change — the membrane's placement accounts for touch padding

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | color from palette | — |
| hover | color shifts to [[emotion]], scale 1.1× for $150\text{ms}$ | pointer over ion |
| active | color = [[emotion]], scale 0.95× | tap/click |
| disabled | color dims to #4b4b4d | membrane disabled |

state transitions: $150\text{ms}$ ease

## adaptation

ion size does not change between desktop and mobile. the same $2g$ icon renders on both. when a molecule folds, it may switch to a conformation that uses a smaller or larger ion, but the ion itself does not scale — it snaps to a fixed size from the scale

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- ion renders at the same $p_z$ as its membrane
- ion always faces the neuron (billboard) — icons must be recognizable from any angle
- size in quanta is constant in world space

## ECS

- Entity: ion organelle
- Components:
  - `Sizing { width: Fix(size), height: Fix(size) }`
  - `IonGlyph { name }` — which icon from [[prysm/images]]
  - `IonSize { token }` — size from scale
  - `IonColor { color }` — from palette or [[emotion]]
- System: ion participates in `OccupySystem` as a leaf — returns $(size, size)$
