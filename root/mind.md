---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

commander molecule in [[prysm]]

the bottom action bar of [[cyb]]. always at the bottom of the screen, on every device. an input field with buttons inside — search, command, navigate, sign. adapts its content per active [[aip]]

## protocol role

mind is a molecule in the element tree $\mathcal{T}$. membrane = commander zone of [[prysm/grid]] (row 3, col 2). occupies fill × fix($6g$). urgency $\mathcal{U} = 20$ (active)

## sizing

| viewport | sizing |
|----------|--------|
| desktop | fill × fix($6g$) |
| mobile ($\square_w \leq 96g$) | fill × fix($6g$) (same) |

$s_{min} = (20g, 6g)$ — minimum space for input field + one button

## structure

```
glass [fill × fix(6g), depth midground]
  stack horizontal [gap g/2]
    ion [2g, back arrow]
    ion [2g, forward arrow]
    input [fill × fix(4g), with saber underline]
    button [sign action, with saber frame]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): back + forward + input + sign button + context actions
- $l_2$ ($w_{min} = 20g$): input + sign button only
- $l_3$ ($w_{min} = 10g$): sign button only

## contextual adaptation

mind changes its organelles based on the active [[aip]]:

| active aip | input placeholder | extra actions |
|-----------|------------------|---------------|
| [[cyb/oracle]] | "search the cybergraph" | — |
| [[cyb/sense]] | "write a message" | attach, emoji |
| [[cyb/sigma]] | "amount" | token selector |
| [[cyb/brain]] | "search files" | — |
| default | "ask, search, transact..." | — |

this is not fold — it is content replacement within the same conformation. the structure stays the same, the input label and available actions change

## emotion

saber underline of the input field carries [[emotion]]:

| state | glow-color | trigger |
|-------|-----------|---------|
| idle | #ffffff (white) | no activity |
| typing | #00fe00 (green) | neuron is entering text |
| error | #ff0000 (red) | invalid input, failed transaction |
| signing | #00fe00 (green, pulsing) | [[cyberlink]] being signed |
| success | #00fe00 (green, fades) | action completed |

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | input empty, saber white | — |
| focus | input cursor visible, saber glow intensifies | tap on input |
| typing | text appears, saber green | keystrokes |
| submitting | loading state on sign button | action in progress |
| disabled | all dims to #4b4b4d | no connection |

state transitions: $150\text{ms}$ ease

## interaction

- tap input → focus, keyboard appears on mobile
- enter / tap sign → submit action (search, send, sign depending on aip)
- tap back/forward → navigate history
- swipe left on mobile → back

## where in [[prysm/grid]]

grid zone: commander (row 3, col 2). always at the bottom. z: 20 (active — above frame zones, below menus)

## 3D

commander renders at the same $p_z$ as the active layer ($\mathcal{U} = 20$). in 3D, commander is a panel floating at fixed distance from the neuron — it does not recede with gravity. always within reach

## ECS

- Entity: mind organelle
- Components:
  - `Sizing { width: Fill, height: Fix(6) }`
  - `GridArea { name: "commander" }`
  - `FoldSet { conformations }`
  - `ActiveAip { aip_id }` — determines contextual content
  - `InputState { text, focused, emotion }`
  - `SaberGlow { color, spread }` — input underline emotion
- Systems:
  - `MindContextSystem` reads `ActiveAip`, updates input placeholder and available actions
  - `MindInputSystem` handles focus, typing, submission
  - `MindEmotionSystem` reads input state and action result, writes `SaberGlow`
