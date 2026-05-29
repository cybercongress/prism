---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

edge widget molecule in [[prysm]]

a compact indicator attached to the screen edge. glass (rounded) + saber (vertical, with glow) + ion (symbol) + text (value). two instances in [[prysm/grid]]: S ([[cyb/sense]], left edge) and Σ ([[cyb/sigma]], right edge)

## protocol role

widget is a molecule in the element tree $\mathcal{T}$. membrane = the grid edge. widget occupies fix($4g$) × fix($6g$). positioned by membrane at vertical center of space zone via `FixedEdge`

## sizing

| parameter | sizing | value |
|-----------|--------|-------|
| width | fix | $4g$ |
| height | fix | $6g$ |
| corner-radius | fix | $g$ |
| saber weight | fix | $g/4$ |
| saber orientation | — | vertical |

$s_{min} = (4g, 6g)$ — widget does not fold. at minimum viewport it remains the same size

## structure

```
glass [fix(4g) × fix(6g), corner-radius g, depth midground]
  saber [vertical, g/4 weight, fill height, glow]
  vector [symbol, 2g]
  text [value, micro(3g/2)]
```

saber position: on the inner edge (right edge for S, left edge for Σ — facing toward space)

## parameters

| parameter | S (sense) | Σ (sigma) |
|-----------|-----------|-----------|
| side | left | right |
| icon | sense glyph | sigma glyph |
| value | unread message count | current balance |
| tap action | navigate to [[cyb/sense]] page | navigate to [[cyb/sigma]] page |

## emotion

saber glow-color reflects the state of incoming data:

### S (sense)

| state | glow-color | trigger |
|-------|-----------|---------|
| idle | #ffffff (white) | no new messages |
| new message | [[emotion]] of the message content | incoming message carries emotion from sender/content |

the message's emotional tone determines the widget's glow: green for positive, red for urgent, yellow for attention, blue for informational. the widget becomes a signal lamp for what is arriving

### Σ (sigma)

| state | glow-color | trigger |
|-------|-----------|---------|
| neutral | #ffffff (white) | balance unchanged |
| increase | #00fe00 (green) | balance grew |
| decrease | #ff0000 (red) | balance dropped |

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | saber glow at emotion color | — |
| hover | glow-spread increases by $g/2$ | pointer over widget |
| active | glow pulses once | tap |
| disabled | color dims to #4b4b4d, no glow | no connection |

state transitions: $150\text{ms}$ ease

## where in [[prysm/grid]]

| instance | grid position | side |
|----------|--------------|------|
| S (sense) | left edge of space, vertical center | `FixedEdge::Left` |
| Σ (sigma) | right edge of space, vertical center | `FixedEdge::Right` |

on mobile ($\square_w \leq 96g$): same position, same size

## 3D

widget renders at the same $p_z$ as the grid frame (persistent, $\mathcal{U} = 10$). always faces the neuron (billboard)

## ECS

- Entity: widget organelle
- Components:
  - `Sizing { width: Fix(4), height: Fix(6) }`
  - `FixedEdge { left | right }`
  - `WidgetIcon { glyph }`
  - `WidgetValue { display_string }`
  - `SaberGlow { color, spread, direction: inward }`
  - `Emotion { color }` — computed from incoming data
  - `TapAction { navigate_to }` — target page
- System: `WidgetEmotionSystem` reads incoming data (messages for S, balance for Σ), writes `Emotion` and `SaberGlow`
