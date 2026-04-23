---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

data entry molecule in [[prysm]]

the way data enters [[cyb]]. every search query, token amount, neuron selection, and text submission flows through input. glass + text + saber (underline) + ion (icons)

## protocol role

input is a molecule in the element tree $\mathcal{T}$. lives inside [[prysm/mind]] (commander), [[prysm/bar]], and other molecules. not a grid zone

## sizing

| variant | sizing |
|---------|--------|
| standard | fill × fix($6g$) |
| compact | fill × fix($4g$) |

$s_{min} = (10g, 4g)$ — minimum for placeholder text visible

## structure

```
glass [fill × fix(6g), depth midground]
  stack horizontal [gap g/2]
    ion [2g, left icon (optional)]
    text [body, input text / placeholder]
    ion [2g, right icon (optional)]
  saber [horizontal, g/8, underline, emotion glow]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 20g$): left icon + text + right icon + underline
- $l_2$ ($w_{min} = 10g$): text + underline only

## variants

| variant | content | use |
|---------|---------|-----|
| text L | icon left, text right | search, general input |
| text R | text left, icon right | input with action trigger |
| text LR | icons both sides | search with filter |
| dropdown | text + chevron icon | select from list |
| neuron | [[prysm/address]] format, bech32 validation | neuron selector |
| token + amount | token icon + number | [[cyb/sigma]], [[teleport]] |

### mobile variants

- m.-text: full width, $4g$ height
- m.-logScale: logarithmic scale selector (0%, 2%, 5%, 10%, 20%, 50%, max) for staking

## emotion

saber underline carries input state [[emotion]]:

| state | glow-color |
|-------|-----------|
| idle | #ffffff |
| focus | #00acff (blue) |
| valid | #00fe00 (green) |
| error | #ff0000 (red) |

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | placeholder text, saber white | — |
| focus | cursor visible, saber blue glow | tap on input |
| typing | text replaces placeholder, saber blue | keystrokes |
| valid | saber green | validation passed |
| error | saber red, adviser appears with error message | validation failed |
| disabled | text gray, no interaction | membrane disabled |

state transitions: $150\text{ms}$ ease

## 3D

input renders at the same $p_z$ as its membrane. faces neuron (billboard)

## ECS

- Entity: input organelle
- Components:
  - `Sizing { width: Fill, height: Fix(6) }`
  - `InputVariant { text_l | text_r | text_lr | dropdown | neuron | token_amount }`
  - `InputValue { text }`
  - `InputPlaceholder { text }`
  - `InputValidation { predicate }`
  - `SaberGlow { color }` — underline emotion
  - `FoldSet { conformations }`
- Systems:
  - `InputFocusSystem` manages focus, cursor, keyboard
  - `InputValidationSystem` reads value, runs predicate, writes emotion
