---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

content frame molecule in [[prysm]]

a [[prysm/glass]] pane that frames content with optional emphasis. gives content a visual home — a bordered, highlighted, or empty region

## protocol role

molecule in $\mathcal{T}$. lives inside space zone. display = glass membrane for content organelles

## sizing

fill × auto (content-determined)

$s_{min} = (10g, 4g)$

## structure

```
glass [fill × auto, depth midground, optional emotion tint]
  saber [vertical, g/4, left edge] — accent
  stack vertical [gap g, padding 2g]
    content organelles
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 30g$): saber accent + full content + padding
- $l_2$ ($w_{min} = 10g$): content only, reduced padding $g$

## variants

| variant | visual | use |
|---------|--------|-----|
| empty | dim text "0.62%" or placeholder | content can be added |
| highlight | emotion tint on glass | featured content |
| highlight 2-line | emotion tint + title + subtitle | headers with emphasis |

## emotion

glass tint = [[emotion]] of the content inside. default: no tint (neutral)

## states

| state | visual | trigger |
|-------|--------|---------|
| default | neutral glass | — |
| highlighted | emotion tint | content is featured |
| empty | dim placeholder | no content |

## 3D

renders at membrane's $p_z$

## ECS

- Entity: display organelle
- Components:
  - `Sizing { width: Fill, height: auto }`
  - `DisplayVariant { empty | highlight | highlight_2line }`
  - `Tint { emotion: Option<Color> }`
  - `FoldSet { conformations }`
- System: `DisplaySystem` manages variant and tint based on content state
