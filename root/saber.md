---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

line atom in [[prysm]]

a thin luminous line. separates, accents, and frames. carries [[emotion]] color through glow

## protocol role

saber is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: vector. it has no sub-organelles. its membrane constrains it, it occupies space, membrane places it

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| orientation | — | vertical, horizontal | vertical |
| weight | fix | $g/8$, $g/4$ | $g/8$ (thinnest line) |
| length | fix or fill | any $k \cdot g$, or fill (membrane's offered dimension) | fill |
| glow-spread | fix | $0$, $3g/2$, $3g$ | $0$ |
| glow-direction | — | inward, outward | inward |
| color | — | #ffffff | #ffffff |
| glow-color | — | any [[emotion]] hex, none | #ffffff |

$s_{min}$: vertical saber $(g/8,\; g)$, horizontal saber $(g,\; g/8)$. weight is always fix (a line does not scale its thickness). length cannot be less than $g$ — below that the line is indistinguishable from noise

## occupy

for a vertical saber: $s = (\text{weight}, \text{length})$
for a horizontal saber: $s = (\text{length}, \text{weight})$

when length = fill: saber occupies the full offered dimension of its membrane

## where in [[prysm/grid]]

saber appears both as grid zone boundary and inside molecules:

### grid zones

| zone | orientation | weight | glow | glow-spread | glow-direction | role |
|------|------------|--------|------|-------------|---------------|------|
| commander | horizontal | $g/4$ | #ffffff | $3g/2$ | outward | input field underline |
| context / avatar header | horizontal | $g/4$ | #ffffff | $3g/2$ | outward | zone boundary bottom edge |
| S (sense) | vertical | $g/4$ | #ffffff | $3g/2$ | inward | widget edge accent |
| Σ (sigma) | vertical | $g/4$ | #ffffff | $3g/2$ | inward | widget edge accent |

### inside molecules

| context | orientation | weight | glow | glow-spread | glow-direction |
|---------|------------|--------|------|-------------|---------------|
| [[prysm/button]] frame | vertical | $g/4$ | [[emotion]] of action | $3g$ | inward |
| [[prysm/table]] row separator | horizontal | $g/8$ | none | $0$ | — |
| [[prysm/bar]] accent | vertical | $g/4$ | none | $0$ | — |
| [[prysm/display]] section divider | horizontal | $g/8$ | none | $0$ | — |
| [[prysm/time-widget]] timeline spine | vertical | $g/8$ | none | $0$ | — |
| [[prysm/input]] field underline | horizontal | $g/8$ | [[emotion]] | $3g/2$ | outward |

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | line at color, glow at glow-color | — |
| hover | glow-spread increases by $g/2$ | pointer near saber (inherited from membrane) |
| active | glow pulses once | tap/click on membrane containing saber |
| disabled | color dims to #4b4b4d, no glow | membrane disabled |

state transitions: $150\text{ms}$ ease

## emotion

saber carries [[emotion]] through glow-color. emotion is computed, not assigned

| context | emotion source | effect |
|---------|---------------|--------|
| [[prysm/button]] frame | action type | green confirm, red danger, yellow caution, white neutral |
| commander input underline | input state | green valid, red error, white idle |
| S, Σ widget edge | widget state | green active, white idle |
| grid zone border | zone state | reflects zone emotion |
| [[prysm/table]] separator | — | no emotion (white, no glow) |

## adaptation

saber is identical on desktop and mobile. weight and glow do not change with $\square$. length adapts through fill — it stretches or shrinks with its membrane

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- saber renders as a line in world space at the same $p_z$ as its membrane
- glow extends in the xy-plane, not along z
- saber weight and length unchanged — spatial quantum $g$ is constant in world coordinates

## ECS

- Entity: saber organelle
- Components:
  - `Sizing { width, height }` — one dimension fix (weight), other fix or fill (length)
  - `SaberOrientation { vertical | horizontal }`
  - `SaberGlow { color: Option<Color>, spread, direction }`
- System: saber participates in `OccupySystem` as a leaf — returns its size directly from `Sizing`
