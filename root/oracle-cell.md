---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

search cell in [[prysm]]

the primary discovery interface of [[cyb/oracle]]. where a [[neuron]] asks questions and the [[cybergraph]] answers. the search query goes through [[prysm/mind]] (commander), results render in space zone as ranked [[prysm/aip]] cards and [[prysm/content]] particles ordered by [[cyberank]]

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. a cell is a membrane that composes molecules into a full [[aip]] experience

## sizing

fill × fill (occupies entire space zone)

## structure

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    filter [pill row: text, image, video, neuron]
    --- results ---
    aip [3-line, result 1, cyberank highest]
    aip [3-line, result 2]
    content [particle preview]
    aip [2-line, result n]
    ...
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): filter bar + 3-line result cards + content previews
- $l_2$ ($w_{min} = 20g$): filter bar + 2-line result cards
- $l_3$ ($w_{min} = 10g$, mobile): no filter bar, 2-line cards, compact padding $g$

## emotion

result cards carry [[emotion]] from [[cyberank]]: green accent for high-confidence results. the space zone itself tints based on result quality — green when results are strong, neutral when sparse

## states

| state | visual | trigger |
|-------|--------|---------|
| idle | last results visible or seed CID | no active search |
| searching | skeleton cards loading | query submitted |
| results | ranked cards appear | results arrived |
| seed | seed CID hash bars of the query | no cyberlinks for this query yet |

## interaction

- query entered in commander → search results populate space
- tap result card → navigate to particle
- tap filter pill → narrow results by type
- scroll → load more results

## 3D

oracle-cell renders at ambient $p_z$ ($\mathcal{U} = 0$). in 3D, result particles position by gravity — high-focus results closer to neuron

## ECS

- Entity: oracle-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `SearchQuery { cid }` — current query particle
  - `SearchResults { list of (particle_cid, cyberank, format) }`
- Systems:
  - `OracleSearchSystem` reads query from commander, fetches results from [[cybergraph]]
  - `OracleRenderSystem` spawns aip cards and content organelles from results
