---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

mathematical field atom in [[prysm]]

renders a particle that is a field — a function assigning values to every point in a domain. a leaf in the element tree (leaf type: field). distinct from all other particle atoms: field content is not stored pixel data but a continuous mathematical object evaluated at render time

scalar field: one value per point (temperature, density, rank). vector field: one vector per point (flow, force, gradient). the domain may be 2D, 3D, or the [[cybergraph]] itself

## protocol role

field is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: field. it has no sub-organelles. its membrane constrains the viewport into which the field is projected. the field itself is defined over an unbounded domain; the viewport clips it

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| src | — | particle CID or inline definition | required |
| width | fix or fill | any $k \cdot g$ or fill | fill |
| height | fix or fill | any $k \cdot g$ or fill | fill |
| domain | — | 2d, 3d, graph | 2d |
| resolution | — | low (g), medium (g/2), high (g/4) | medium |

$s_{min} = (8g, 8g)$

## field types

| type | values per point | examples |
|------|-----------------|---------|
| scalar | single float | [[cyberank]] density, token price gradient, network activity |
| vector | direction + magnitude | link flow, force field, gradient descent |
| complex | magnitude + phase | probability amplitude, wave interference |
| tensor | matrix per point | stress field, curvature field |

## render modes

| mode | field type | rendering |
|------|-----------|-----------|
| heatmap | scalar | continuous color gradient — min→max maps to emotion palette |
| contour | scalar | isoline bands at equal value intervals |
| flow | vector | streamlines following field direction |
| arrows | vector | arrow glyphs sampled at grid points, length = magnitude |
| magnitude | vector/complex | scalar heatmap of the magnitude only |
| phase | complex | hue encodes phase angle, brightness encodes magnitude |

default mode: heatmap for scalar, flow for vector

## emotion and color

field color IS [[emotion]] applied to the value range. the field's minimum value maps to the low end of the active emotion color, maximum to full saturation. the [[tri-kernel]] drives the emotion signal; the field maps that signal continuously across its domain

a [[cyberank]] field: high-rank regions glow with joy green (#00fe00), low-rank regions dim to near-black

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | rendered at current resolution | src loaded |
| loading | glass placeholder, pulse $1\text{s}$ | src resolving |
| computing | overlay shimmer | field evaluation in progress |
| error | vector [broken-field, $4g$, anger] | src failed |

state transitions: $150\text{ms}$ ease

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- 2D field renders as a plane at the membrane's $p_z$
- 3D field renders as a volumetric region; the neuron can enter and look around
- vector fields in 3D render as particle streams (flow lines as animated ion trails)

## ECS

- Entity: field organelle
- Components:
  - `Sizing { width, height }`
  - `FieldSrc { Particle(cid) | Inline(FieldDef) }`
  - `FieldDomain { D2 | D3 | Graph }`
  - `FieldType { Scalar | Vector | Complex | Tensor }`
  - `FieldRenderMode { heatmap | contour | flow | arrows | magnitude | phase }`
  - `FieldResolution { low | medium | high }`
  - `LoadState { loading | computing | loaded | error }`
  - `Emotion { color }` — drives value-to-color mapping
- System: `FieldSystem` evaluates field at render resolution, writes framebuffer region
