---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

luminous point atom in [[prysm]]

the 0-dimensional substrate primitive. glass is area, saber is line, ion is point. a source of light and charge — the visual manifestation of energy in cyberspace. renders as a glowing dot whose luminosity is driven by [[emotion]]

## protocol role

ion is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: point. it has no sub-organelles. it occupies a square of side $2r$ centered on its position

## geometry

three substrate primitives cover all dimensions:

| atom | dimension | primitive |
|------|-----------|-----------|
| `glass` | 2D | area |
| `saber` | 1D | line |
| `ion` | 0D | point |

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| radius | fix | $g/2$, $g$, $2g$, $3g$ | $g$ |
| color | — | [[emotion]] hex | `joy` #00fe00 |
| spread | fix | $0$, $g$, $2g$, $3g$ | $g$ |
| blur | fix | $0$, $4$, $8$, $12$ | $8$ |

occupied size: $s = (2r, 2r)$

## glow

the glow extends beyond the nominal $2r$ footprint. spread defines how far the light radiates outward. blur controls the softness of the falloff

```
ion [radius g, spread 2g, blur 8]
— point of light at center, corona extending 2g outward
```

color is always [[emotion]]-driven — ion has no fixed color. intensity reflects charge: high [[cyberank]] → full intensity, low → dim

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | full intensity at emotion color | — |
| dim | opacity 30%, spread 0 | inactive / low charge |
| pulse | spread oscillates $g$ → $3g$, period $1.5\text{s}$ | active process |
| off | opacity 0 | no charge |

state transitions: $150\text{ms}$ ease

## use in [[prysm]]

- presence indicator: $r = g/2$ dot marking a neuron's position
- notification: red ion at corner of avatar when unread state
- energy particle: ions orbiting in [[prysm/graph]] 3D representation
- active dot: beneath active tab in [[prysm/tabs]] as alternative to saber
- charge indicator: brightness maps to [[cyberank]] of the particle

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- ion renders as a point light source at its $p_z$
- glow radiates in all directions (sphere, not billboard)
- spread and blur map to light attenuation radius
- ions in the cybergraph cluster around high-rank particles

## ECS

- Entity: ion organelle
- Components:
  - `Sizing { width: Fix(2r), height: Fix(2r) }`
  - `IonRadius { value }` — in $g$
  - `IonSpread { value }` — glow radius beyond $r$
  - `IonBlur { value }` — softness
  - `Emotion { color }` — drives color and intensity
- System: ion participates in `OccupySystem` as a leaf — returns $(2r, 2r)$
