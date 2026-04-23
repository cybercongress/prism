---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

navigation minimap molecule in [[prysm]]

a visual map showing where the [[neuron]] is in the [[cybergraph]]. spatial orientation — the neuron sees its position relative to surrounding [[particles]] and [[cyberlinks]]. like a map in a game

## protocol role

graph is a molecule in the element tree $\mathcal{T}$. membrane = bottom-l zone of [[prysm/grid]] (below stars). on mobile: inside menu context

## sizing

| viewport | sizing |
|----------|--------|
| desktop | fix($25g$) × auto |
| mobile | inside menu context, fill × scale($0.5$) |

$s_{min} = (15g, 15g)$ — below this the map is unreadable

## structure

```
glass [fix(25g) × auto, depth midground]
  raster [graph render — 2D projection of local cybergraph neighborhood]
```

the graph content is a raster leaf — a rendered image of the local graph topology around the neuron's current position. updated by the renderer, not by the layout protocol

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): full minimap
- $l_2$ ($w_{min} = 0$, mobile): moves into menu context

## where in [[prysm/grid]]

| viewport | position |
|----------|----------|
| desktop | bottom-l zone, below stars |
| mobile | inside menu context (not in main grid) |

## ECS

- Entity: graph organelle
- Components:
  - `Sizing { width: Fix(25), height: auto }`
  - `FoldSet { conformations }`
  - `GraphPosition { current_particle_cid }` — neuron's location in cybergraph
- System: `GraphRenderSystem` reads `GraphPosition`, renders local neighborhood as raster
