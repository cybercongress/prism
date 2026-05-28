---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

the membrane atom in [[prysm]]

translucent pane that defines spatial boundaries. glass IS the membrane — every container in [[cyb]] is a glass surface. organelles occupy space within glass. glass within glass forms the element tree $\mathcal{T}$

## protocol role

glass is the membrane in the constrain → occupy → place protocol (§4 of [[prysm/layout]]):
- as membrane: glass computes constraint $c = (c_w, c_h)$ for each organelle inside it, from its own size minus padding
- glass is never a leaf — it always contains organelles
- glass nests: glass inside glass inside glass = tree depth

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| width | fix, fill, or scale | any $k \cdot g$ | fill (occupies membrane's offered width) |
| height | fix, fill, or scale | any $k \cdot g$ | fill (occupies membrane's offered height) |
| padding | fix | $g$, $2g$, $3g$ | $g$ |
| corner-radius | fix | $0$, $g/2$, $g$, $2g$ | $0$ |

$s_{min} = (3g, 3g)$ — minimum viable glass. below this, the membrane cannot contain any legible organelle

## constraint computation

when glass acts as membrane for its organelles:

$$c_{organelle} = (s_w - 2 \cdot padding,\;\; s_h - 2 \cdot padding)$$

$s_w$, $s_h$ — glass's own occupied size. $padding$ — inner offset from edge

## depth

glass carries a depth level that determines its visual properties:

| depth | opacity | blur | $\mathcal{U}$ mapping | use |
|-------|---------|------|-----------------------|-----|
| foreground | 0.70 | $0$ | blocking, guiding (z 40-50) | modals, tooltips |
| midground | 0.38 | $g/2$ | persistent, active (z 10-20) | cards, sections, panels |
| background | 0.15 | $g$ | ambient (z 0) | space-level containers |
| subtle | 0.07 | $3g/2$ | ambient (z 0) | ambient regions |

depth maps to urgency $\mathcal{U}$ from [[prysm/layout]] §6.3: foreground glass holds blocking/guiding organelles, background glass holds ambient organelles

## overflow

when organelles inside glass exceed the constraint $c$, glass handles overflow:

| overflow | behavior | when |
|----------|----------|------|
| fit | organelles shrink proportionally to fit within $c$. triggers fold at $s_{min}$ — see [[prysm/layout]] §4.2 | all zones by default |
| scroll | glass becomes a scrollable viewport. $s_{visible} = c$, organelles extend beyond | space zone, data lists, time widget |

scroll is a property of glass as membrane, not of the organelles inside. ECS: `Overflow { none | scroll }`

## nesting

- max depth: 3 (glass → glass → glass). deeper nesting loses visual clarity through accumulated opacity
- on mobile ($\square_w \leq 96g$): max depth 2
- each nesting level reduces available constraint by $2 \cdot padding$ per dimension

## emotion

glass carries [[emotion]] as tint — color overlay at 15% opacity on the surface. emotion is computed by the [[tri-kernel]], not assigned manually

| grid zone | emotion source | example |
|-----------|---------------|---------|
| space | [[cyberank]] of visible particles | green when high-confidence results, red when low |
| commander | state of current action | green during signing, red on error |
| adviser | message type | green guidance, red warning, yellow caution |
| context | state of viewed subject | reflects subject's karma/rank |
| S (sense) | unread status | green when new messages |
| Σ (sigma) | balance change | green on increase, red on decrease |

no tint (default): neutral dark surface. tint is independent of depth — any depth can carry any emotion

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | neutral surface at depth opacity | — |
| hover | opacity +0.1 | pointer over glass |
| active | opacity +0.15, emotion tint intensifies | tap/click on glass |
| disabled | opacity ×0.5, no interaction | organelle disabled |

state transitions: $150\text{ms}$ ease (same as fold animation)

## variants

| variant | sizing | use |
|---------|--------|-----|
| plane | fill × fill | standard container. cards, sections, panels |
| side-button | fix($4g$) × auto | surface with action trigger on screen edge. [[cyb/sigma]], [[cyb/sense]] buttons |

## where in [[prysm/grid]]

| grid zone | glass depth | glass variant |
|-----------|-------------|---------------|
| space | background | plane, fill × fill |
| context, avatar | midground | plane, fix($25g$) × fix($6g$) |
| commander | midground | plane, fill × fix($6g$) |
| stars, graph, time | midground | plane, fix($25g$) × auto |
| menu context, menu avatar | foreground | plane, fix($25g$) × fill($\square_h$) |
| S, Σ | midground | side-button, fix($4g$) × fix($6g$) |
| modal | foreground | plane, scale or fix |
| adviser | foreground | plane, fill × fix($4g$) |

## spacing between organelles

gap values when glass acts as membrane for its organelles:

| organelle pair | gap | rationale |
|---------------|-----|-----------|
| text — text | $g$ | minimum readable separation |
| text — ion | $g/2$ | icon sits close to its label |
| ion — ion | $g$ | distinct icons need clear separation |
| saber — any | $0$ | saber IS the separator, no additional gap |
| glass — glass (nested) | $padding$ | padding of outer glass defines gap to inner |

these are defaults. the membrane (stack or grid) overrides gap via its gap parameter

## 3D

in the 3D extension (§11 of [[prysm/layout]]), glass gains depth as a spatial dimension:

- $s_d$: determined by nesting level. root glass: $s_d = d_{max}$. nested glass: $s_d$ = fraction of membrane's $s_d$
- $p_z$: determined by gravity phase — glass surfaces closer to the neuron have higher focus
- glass depth levels (foreground/midground/background) map to $p_z$ ranges within the gravity-assigned band
- glass opacity decreases with distance from neuron — far glass is more transparent

## ECS

- Entity: glass organelle
- Components:
  - `Sizing { width, height }` — fix, fill, or scale per dimension
  - `Padding { value }` — inner offset in $g$
  - `GlassDepth { level }` — foreground, midground, background, subtle
  - `Tint { emotion: Option<Color> }` — emotion overlay
  - `CornerRadius { value }` — in $g$
- System: `ConstrainSystem` — glass reads own `OccupiedSize`, subtracts padding, writes `Constraint` to each child organelle
