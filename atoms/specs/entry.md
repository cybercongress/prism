---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

form field atom in [[prysm]]

the bare editable text buffer — a cursor position and character sequence. a leaf in the element tree (leaf type: entry). the only atom that accepts keystrokes. distinguished from the input molecule: entry is only the editable area itself. the input molecule composes entry with glass, saber underline, icons, and validation

## protocol role

cursor is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: entry. it has no sub-organelles. its membrane constrains it, it occupies fill × $2g$ (single-line) or fill × auto (multi-line), membrane places it

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

single-line: $s = (c_w, 2g)$ — fills offered width, fixed $2g$ height

multi-line: $s_w = c_w$, $s_h = \text{lines} \cdot 2g \cdot 1.4$ — height grows with content. membrane handles overflow scroll when $s_h$ exceeds $c_h$

password mode: all characters replaced with • before measuring width

## cursor

- $1\text{px}$ vertical bar at insertion point
- blinks at $500\text{ms}$ interval (visible $500\text{ms}$, hidden $500\text{ms}$)
- visible only in focus state
- color: #ffffff

## selection

when the neuron drags across text to select a range:

- background highlight at 15% opacity of [[emotion]] (default: 15% white)
- selected text retains its color
- selection handles appear at range endpoints on touch

## states

| state | visual change | trigger |
|-------|-------------|---------|
| idle | placeholder shown if value empty, color #4b4b4d | no focus |
| focus | cursor visible and blinking, placeholder hidden | tap/click into entry |
| typing | content shown at #ffffff, cursor advances | keystrokes |
| disabled | no cursor, no interaction, text at #4b4b4d | membrane disabled |

state transitions: $150\text{ms}$ ease (idle ↔ focus)

## emotion

cursor carries no color of its own — the molecule that contains it (input) expresses emotion through the saber underline. cursor inherits selection highlight from emotion when a selection is active (15% opacity)

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- cursor renders on a plane at the same $p_z$ as its membrane
- cursor always faces the neuron (billboard)
- cursor blink continues in 3D — it is a temporal property, not spatial

## ECS

- Entity: entry organelle
- Components:
  - `Sizing { width: Fill, height }` — Fix($2g$) single-line, Auto multi-line
  - `EntryValue { String }`
  - `EntryPlaceholder { String }`
  - `EntryMultiline { bool }`
  - `EntryPassword { bool }`
  - `EntryMaxChars { Option<usize> }`
  - `FocusState { idle | focused }`
  - `EntryInsertionPoint { usize }` — index into value buffer
  - `EntrySelectionRange { Option<(usize, usize)> }`
- System: cursor participates in `OccupySystem` as a leaf — returns fill × Fix($2g$) or fill × auto
