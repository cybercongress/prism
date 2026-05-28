---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

[[neuron]] identity display molecule in [[prysm]]

renders the cryptographic identity of a [[neuron]]. bech32 address with hash-bar visualization — a unique colorful waveform derived from the address bytes. text and bars flow together: `bostrom1|||||||||vug5`. click to hear the address melody

## protocol role

molecule in $\mathcal{T}$. lives inside [[prysm/neuron-card]], [[prysm/avatar]], [[prysm/table]], space zone content

## sizing

| variant | sizing |
|---------|--------|
| big | fill × fix($2g$) |
| small | auto × fix($2g$) |

$s_{min}$: big = $(15g, 2g)$. small = $(8g, 2g)$

## structure

```
stack horizontal [gap 0]
  text [caption, prefix "bostrom1"]
  --- hash bars (32 for big, 12 for small) ---
  glass [fix(3) × fix(bar_height), emotion color] × n_bars — upper row
  glass [fix(3) × fix(bar_height), emotion color] × n_bars — lower row (mirrored)
  text [caption, suffix "vug5"]
```

bars: 3 units wide, 1 unit gap. height 1-6 units per bar (encodes byte value). mirrored up/down from center line

## character-color-note mapping

each bech32 character maps to a color and a musical note:

| color | note | characters |
|-------|------|-----------|
| #00fe00 green | E3 | a, g, l, m, s |
| #00acff blue | G3 | b, d, f, h, j, n, p, r, t, v |
| #304ffe indigo | A3 | c, i, o, u |
| #d500f9 violet | D3 | e, k, q, w |
| #fcf000 yellow | B2 | x, z |
| #ff5b00 orange | F#3 | y |
| #777777 gray | sustain | 0-9 |

## sound

click address → each character plays its note sequentially ($0.2\text{s}$ per note) over a pad drone (E3). the melody is deterministic — same address always sounds the same

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 25g$): big — full address + 32 bar pairs
- $l_2$ ($w_{min} = 8g$): small — truncated prefix + 12 bar pairs + truncated suffix

## emotion

address border: green for own address, white for others

## states

| state | visual | trigger |
|-------|--------|---------|
| default | bars + text visible | — |
| hover | copy icon appears, bars blink sequentially | pointer over |
| playing | bars animate with notes | click |

state transitions: $150\text{ms}$ ease. sound: $0.2\text{s}$ per note

## 3D

renders at membrane's $p_z$. faces neuron (billboard)

## ECS

- Entity: address organelle
- Components:
  - `Sizing { width, height: Fix(2) }`
  - `AddressVariant { big | small }`
  - `AddressValue { bech32_string }`
  - `AddressBars { list of (color, height) }` — computed from characters
  - `FoldSet { conformations }`
- Systems:
  - `AddressBarSystem` computes bar colors and heights from address string
  - `AddressSoundSystem` plays melody on click
