---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

magnitude and quantity atom in [[prysm]]

renders a single numeric value as text. a leaf in the element tree (leaf type: text, numeric variant). distinguished from the text atom: number carries semantic magnitude — it knows about units, precision, tabular alignment, and change direction

## protocol role

number is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: text, numeric variant. it has no sub-organelles. its membrane constrains it, it occupies space based on rendered string width, membrane places it

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| value | — | f64 | required |
| precision | — | 0–6 decimal places | 0 |
| unit | — | token symbol string or empty | empty |
| tabular | — | bool — use tabular-nums for column alignment | true |
| size | fix | body($2g$), caption($7g/4$), micro($3g/2$) | body($2g$) |

$s_{min} = (3g, 2g)$ — minimum for a single digit at body size

## occupy

number occupies space computed from the rendered string:

$$s_w = \text{chars}(\text{value at precision}) \cdot \text{char\_width}(size) + \text{unit\_width}(size)$$
$$s_h = size$$

when tabular = true: all digit characters are rendered at uniform width (tabular-nums feature). this keeps numeric columns aligned without variable-width digit advance

when $s_w > c_w$: number does not wrap. it truncates with ellipsis. numbers are always single-line

unit is rendered immediately after the value with no separator if the unit token is a symbol ($, %, G, T), or with a single space if the unit is a word

## size scale

number uses a subset of the text size scale (heading sizes are excluded — headings are not for numbers):

| token | size | where |
|-------|------|-------|
| body | $2g$ | commander: balances, quantities. space: metrics |
| caption | $7g/4$ | stars, time: small counts. S, Σ: secondary values |
| micro | $3g/2$ | graph: annotations, inline labels |

## emotion

value change direction drives color — emotion is computed from the delta, not assigned manually:

| direction | color | emotion |
|-----------|-------|---------|
| positive change | joy green | value increased |
| negative change | anger red | value decreased |
| zero / no change | #ffffff | neutral |

no glow on number itself — glow belongs to the molecule that contains it (e.g. [[prysm/display]], [[prysm/bar]])

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | value rendered at color from emotion rule | — |
| updating | brief flash at full emotion color for $150\text{ms}$, then settles | value changes |
| disabled | color dims to #4b4b4d | membrane disabled |

state transitions: $150\text{ms}$ ease

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- number renders on a plane at the same $p_z$ as its membrane
- number always faces the neuron (billboard)
- size in quanta is constant in world space

## ECS

- Entity: number organelle
- Components:
  - `Sizing { width, height }` — computed from rendered string
  - `NumberValue { f64 }`
  - `NumberPrecision { u8 }` — decimal places
  - `NumberUnit { String }` — token symbol or empty
  - `NumberTabular { bool }` — tabular-nums rendering
  - `TextSize { token }` — body, caption, or micro
  - `Emotion { color }` — derived from value change direction
- System: number participates in `OccupySystem` as a leaf — computes size from rendered string metrics
