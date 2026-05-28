---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

action timeline molecule in [[prysm]]

a column of the [[neuron]]'s actions in the [[cybergraph]]: transitions between [[cell]] applications, conversations, transactions, [[cyberlink]] creations. newest at bottom, oldest at top. machine time counter at the very bottom

## protocol role

time-widget is a molecule in the element tree $\mathcal{T}$. membrane = bottom-r zone of [[prysm/grid]] (row 3, col 3). fix($25g$) × auto on desktop, auto × fix($6g$) on mobile. $\mathcal{U} = 10$ (persistent)

## sizing

| viewport | sizing |
|----------|--------|
| desktop | fix($25g$) × auto |
| mobile ($\square_w \leq 96g$) | auto × fix($6g$) |

$s_{min} = (10g, 6g)$ — machine time counter + one event visible

## structure

desktop:
```
glass [fix(25g) × auto, depth midground, overflow scroll]
  stack vertical [gap g/2]
    --- events (oldest first) ---
    stack horizontal [gap g/2]
      text [micro, "Oracle"]
      ion [2g, oracle icon]
      text [micro, "now"]
    stack horizontal
      text [micro, "Teleport"]
      ion [2g, teleport icon]
      text [micro, "37 sec ago"]
    ...
    --- machine time (bottom) ---
    saber [horizontal, g/8]
    text [caption, "20 543 days 07:51"]
```

mobile: compressed — last event + machine time only

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): full event list + machine time
- $l_2$ ($w_{min} = 10g$): last 3 events + machine time
- $l_3$ ($w_{min} = 6g$, mobile): machine time only

## emotion

each event carries [[emotion]] from its action type:

| event type | emotion | color |
|-----------|---------|-------|
| navigation (cell switch) | neutral | #ffffff |
| message received | [[emotion]] of message | varies |
| transaction sent | green | #00fe00 |
| transaction received | green | #00fe00 |
| balance decrease | red | #ff0000 |
| [[cyberlink]] created | green | #00fe00 |
| error | red | #ff0000 |

## states

| state | visual | trigger |
|-------|--------|---------|
| default | event list visible | — |
| loading | skeleton placeholder | fetching history |
| empty | text "no history" | new neuron |
| scrolling | older events revealed | scroll up in timeline |

state transitions: $150\text{ms}$ ease. new events appear at bottom with slide-in animation

## interaction

- tap event → navigate to detail view of that action
- scroll up → older events
- machine time counter: display only, no interaction

## time format

machine time: UTC 0, Unix epoch (1970) = year 0. displayed as days + time: "20 543 days 07:51"

event timestamps: relative ("now", "37 sec ago", "2h ago"). older than 24h: absolute in machine time

## where in [[prysm/grid]]

| viewport | grid zone | position |
|----------|-----------|----------|
| desktop | bottom-r (row 3, col 3) | right of commander |
| mobile | time area in bottom row | right of commander |

## 3D

time-widget renders at frame $p_z$ ($\mathcal{U} = 10$). in 3D, time is a vertical column floating alongside the neuron — history trailing behind like a wake

## ECS

- Entity: time-widget organelle
- Components:
  - `Sizing { width, height }`
  - `GridArea { name: "bottom-r" }`
  - `FoldSet { conformations }`
  - `TimelineEvents { list of (timestamp, type, summary, emotion) }`
  - `MachineTime { days, time }`
  - `Overflow { scroll }`
- Systems:
  - `TimelineSystem` reads neuron action log, writes `TimelineEvents`
  - `MachineTimeSystem` updates `MachineTime` continuously
