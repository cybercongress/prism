---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

input primitive atom in [[prysm]]

the bare editable text field — a cursor position and character buffer. a leaf in the element tree (leaf type: text-input). distinguished from the input molecule: field is only the editable area itself. the input molecule composes field with glass, saber underline, icons, and validation

## protocol role

field is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: text-input. it has no sub-organelles. its membrane constrains it, it occupies fill × $2g$ or fill × auto, membrane places it

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| value | — | string | empty |
| placeholder | — | string | empty |
| multiline | — | bool | false |
| max-chars | — | optional integer | — |
| password | — | bool — masks with • | false |

### mode sizing

| mode | width | height |
|------|-------|--------|
| single-line | fill | fix $2g$ |
| multi-line | fill | auto (grows with content) |

$s_{min} = (5g, 2g)$

## occupy

single-line: $s = (c_w, 2g)$ — fills offered width, fixed $2g$ height (one body line)

multi-line: $s_w = c_w$, $s_h = \text{lines} \cdot 2g \cdot 1.4$ — height grows with content. membrane must handle overflow or scroll when $s_h$ exceeds $c_h$

content rendering: if password = true, all characters are replaced with • before measuring width

## cursor

- $1\text{px}$ vertical bar at insertion point
- blinks at $500\text{ms}$ interval (visible $500\text{ms}$, hidden $500\text{ms}$)
- cursor is visible only in focus state
- cursor color: #ffffff

## selection

when the neuron drags across text to select a range:

- background highlight at 15% opacity of [[emotion]] (default: 15% white)
- selected text retains its color
- selection handles appear at range endpoints on touch

## states

| state | visual change | trigger |
|-------|-------------|---------|
| idle | placeholder shown if value empty, color #4b4b4d | no focus |
| focus | cursor visible and blinking, placeholder hidden | tap/click into field |
| typing | content shown at #ffffff, cursor advances | keystrokes |
| disabled | no cursor, no interaction, text at #4b4b4d | membrane disabled |

state transitions: $150\text{ms}$ ease (idle ↔ focus)

## emotion

field itself carries no color — the molecule that contains it (input) expresses emotion through the saber underline. field does inherit selection highlight from emotion when a selection is active (15% opacity)

## adaptation

field width is always fill — it stretches to its membrane's offered width. multi-line height grows unbounded unless the membrane applies overflow scroll. single-line height is fixed at $2g$ on both desktop and mobile

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- field renders on a plane at the same $p_z$ as its membrane
- field always faces the neuron (billboard)
- cursor blink continues in 3D — it is a temporal property, not spatial

## ECS

- Entity: field organelle
- Components:
  - `Sizing { width: Fill, height }` — Fix($2g$) for single-line, Auto for multi-line
  - `FieldValue { String }` — current character buffer
  - `FieldPlaceholder { String }`
  - `FieldMultiline { bool }`
  - `FieldPassword { bool }`
  - `FieldMaxChars { Option<usize> }`
  - `FocusState { idle | focused }`
  - `CursorPosition { usize }` — index into value buffer
  - `SelectionRange { Option<(usize, usize)> }` — start and end indices
- System: field participates in `OccupySystem` as a leaf — returns fill × Fix($2g$) or fill × auto from line count
