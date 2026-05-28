---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

visual content atom in [[prysm]]

renders a particle that is an image. a leaf in the element tree (leaf type: raster/vector). images are always fixed size in quanta — they do not stretch to fill a membrane

## protocol role

image is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: raster/vector. it has no sub-organelles. its membrane constrains it, it occupies a fixed rectangle, membrane places it

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| src | — | particle CID | required |
| width | fix | any $k \cdot g$ | required |
| height | fix | any $k \cdot g$ | required |
| fit | — | contain, cover, fill | contain |
| corner-radius | fix | $0$, $g/2$, $g$, $2g$ | $0$ |

$s_{min} = (4g, 4g)$ — smallest legible image. below this, raster content loses recognizability

## occupy

image occupies its declared fixed size directly:

$$s = (\text{width}, \text{height})$$

no wrapping, no fill, no scale. if the declared size exceeds the membrane constraint $c$, the membrane clips the image. the image does not shrink — it is fixed

## fit modes

| fit | behavior |
|-----|----------|
| contain | image scaled to fit entirely within $(width, height)$, letterboxed |
| cover | image scaled to fill $(width, height)$, cropped to edges |
| fill | image stretched to exactly $(width, height)$, may distort |

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | rendered image at full opacity | src loaded |
| loading | glass placeholder at depth subtle, animated opacity pulse $1\text{s}$ cycle | src not yet resolved |
| error | ion(image-broken, $4g$, emotion anger) centered in $(width, height)$ | src failed to load |

state transitions: $150\text{ms}$ ease (loading → default cross-fade when src resolves)

## emotion

image carries [[emotion]] as a glass tint overlay at 12% opacity, same as the glass atom. the tint is a color layer rendered on top of the image surface. emotion is computed by the [[tri-kernel]], not assigned manually — images signal state through their container overlay

| emotion source | effect |
|---------------|--------|
| loading state | no tint (glass placeholder handles depth) |
| error state | anger red at 12% tint |
| tri-kernel signal | any emotion color at 12% tint |

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- image renders on a plane at the same $p_z$ as its membrane
- image always faces the neuron (billboard) — raster content must be frontal to be legible
- size in quanta is constant in world space

## ECS

- Entity: image organelle
- Components:
  - `Sizing { width: Fix(width), height: Fix(height) }`
  - `ImageSrc { cid }` — particle CID of the image content
  - `ImageFit { contain | cover | fill }`
  - `CornerRadius { value }` — in $g$
  - `LoadState { loading | loaded | error }`
  - `Tint { emotion: Option<Color> }` — 12% opacity overlay
- System: image participates in `OccupySystem` as a leaf — returns $(width, height)$ directly
