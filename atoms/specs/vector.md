---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

2D path atom in [[prysm]]

renders scalable vector content. a leaf in the element tree (leaf type: vector). covers user SVG particles from the [[cybergraph]] and system symbols from the prysm catalog. always resolution-independent — renders sharp at any size

for raster images (PNG, JPG, GIF) see [[prysm/image]]. for 3D geometry see [[prysm/mesh]]

## protocol role

vector is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: vector. it has no sub-organelles. its membrane constrains it, it occupies a fixed square, membrane places it

## source modes

| mode | src | color | use |
|------|-----|-------|-----|
| particle | CID — SVG content from cybergraph | emotion-driven or intrinsic | user illustrations, diagrams, art |
| glyph | catalog name — functional UI symbol | monochrome, emotion-driven | action icons, navigation icons, status icons |
| sigil | catalog name — identity mark | brand-fixed, immutable | token logos, brand marks, entity seals |

**glyph**: color is always driven by [[emotion]] or state. the same search glyph renders white, green, red depending on context. monochrome only (exception: inherited fill color from parent)

**sigil**: color is brand-fixed and cannot be overridden by the emotion system. the CYB sigil is always its brand color. the ETH sigil is always its brand color. identity is immutable

## sizing

all values in spatial quanta $g$. vector always occupies a fixed square

| size | px at $g=8$ | corner-radius | where |
|------|-------------|---------------|-------|
| $2g$ | 16px | rx=2 | inline with body text — commander actions, inline symbols |
| $5g/2$ | 20px | rx=3 | standalone small — tabs, stars |
| $4g$ | 32px | rx=3 | medium — context zone, avatar icons |
| $6g$ | 48px | rx=4 | large — onboarding, featured content |
| $12g$ | 96px | rx=6 | hero — welcome screens |

$s_{min} = (2g, 2g)$ — smallest legible symbol

occupied size: $s = (size, size)$

touch target: if $size < 4g$, the membrane adds padding to ensure the interactive area is at least $4g \times 4g$. the vector's occupied size does not change

## catalog

| category | entries | mode |
|----------|---------|------|
| action | search, learn, link, stake, send, receive, delegate | glyph |
| navigation | home, back, forward, menu, close, expand | glyph |
| status | success, error, warning, info, loading | glyph |
| particle type | text, image, video, audio, pdf, 3d, code | glyph |
| verified | verified | glyph |
| brand | cyber, cyb, cyberia | sigil |
| token logos | CYB, HYDROGEN, BOOT, VOLT, AMPERE, BTC, ETH, ATOM | sigil |

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | color from palette or brand | — |
| hover | glyph: color shifts to [[emotion]], scale 1.1× | pointer over |
| active | glyph: color = [[emotion]], scale 0.95× | tap/click |
| disabled | opacity dims to 30% | membrane disabled |

state transitions: $150\text{ms}$ ease. sigils do not change color on hover — only scale

## adaptation

vector size does not scale continuously — it snaps to the fixed size scale. when a molecule folds, it may switch conformations that use a different size token, but the vector itself does not scale between tokens

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- vector renders on a plane at the same $p_z$ as its membrane
- vector always faces the neuron (billboard)
- size in quanta is constant in world space

## ECS

- Entity: vector organelle
- Components:
  - `Sizing { width: Fix(size), height: Fix(size) }`
  - `VectorSrc { Particle(cid) | Glyph(name) | Sigil(name) }`
  - `VectorSize { token }` — size from scale
  - `VectorColor { Emotion | Brand(Color) }` — glyph = emotion-driven, sigil = brand-fixed
- System: vector participates in `OccupySystem` as a leaf — returns $(size, size)$
