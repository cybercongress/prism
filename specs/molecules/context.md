---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

subject indicator molecule in [[prysm]]

shows what the [[neuron]] is looking at — which [[aip]], which [[particle]], which [[neuron]] profile. the subject of the current view. tap opens menu context (slide-out navigation)

## protocol role

context is a molecule in the element tree $\mathcal{T}$. membrane = context zone of [[prysm/grid]], top-left. fix($25g$) × fix($6g$) on desktop, auto × fix($4g$) on mobile

## sizing

| viewport | sizing |
|----------|--------|
| desktop | fix($25g$) × fix($6g$) |
| mobile ($\square_w \leq 96g$) | auto × fix($4g$) |

$s_{min} = (4g, 4g)$ — icon only

## structure

```
glass [fix(25g) × fix(6g), depth midground]
  ion [4g, aip icon]
  text [caption, aip name / particle title]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): icon + name
- $l_2$ ($w_{min} = 4g$): icon only (mobile)

## interaction

tap → opens menu context (slide-out from left edge, z: 30)

## where in [[prysm/grid]]

grid zone: context (row 1, col 1)

## ECS

- Entity: context organelle
- Components:
  - `Sizing { width, height }`
  - `FoldSet { conformations }`
  - `ContextSubject { aip_id, particle_cid, label }`
  - `Trigger::Tap { opens: menu_context }`
- System: `ContextSystem` reads current navigation state, writes `ContextSubject`
