---
tags: prysm, cyb, chroma
alias: where, context
crystal-type: pattern
crystal-domain: cyber
---

location chrome — top-left

**where**: shows the neuron's current position in the [[cyb]] world tree. breadcrumb trail of the active world and context. tells every other chroma what is active in [[spacetime]]

## protocol role

context is a molecule in the element tree $\mathcal{T}$. membrane = context zone of [[prysm/grid]], top-left. fix($25g$) × fix($6g$) on desktop, auto × fix($4g$) on mobile

## core function

orientation — the neuron always knows where they are. space renders the active world name, the current path inside it, and a breadcrumb trail back to root.

receives: `(spacetime, space, locate, …)` cyberlinks whenever the active renderer changes. updates immediately — no polling.

## cyberlinks

| receives from | token | meaning |
|---------------|-------|---------|
| spacetime | locate | renderer switched — update breadcrumb |
| brain | navigate | file path changed inside brain |

| sends to | token | meaning |
|----------|-------|---------|
| com | context | current world context for command palette |

## sizing

| viewport | sizing |
|----------|--------|
| desktop | fix($25g$) × fix($6g$) |
| mobile ($\square_w \leq 96g$) | auto × fix($4g$) |

$s_{min} = (4g, 4g)$ — icon only

## structure

```
glass [fix(25g) × fix(6g), depth midground]
  ion [4g, cell icon]
  text [caption, cell name / particle title / world name]
```

breadcrumb trail shows: world → section → particle (if deep)

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): icon + full breadcrumb
- $l_2$ ($w_{min} = 10g$): icon + world name only
- $l_3$ ($w_{min} = 4g$): icon only (mobile)

## states

| state | visual |
|-------|--------|
| world active | world icon + name |
| deep path | icon + name + breadcrumb trail |
| root | icon + "cyb" only |

## interaction

tap → opens menu context (slide-out from left edge, z: 30)

## ECS

- Entity: context organelle
- Components:
  - `Sizing { width, height }`
  - `GridArea { name: "context" }`
  - `FoldSet { conformations }`
  - `ContextSubject { cell_id, particle_cid, label }`
  - `Trigger::Tap { opens: menu_context }`
- System: `ContextSystem` reads current navigation state, writes `ContextSubject`
