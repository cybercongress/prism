---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

audio content atom in [[prysm]]

represents a particle that is audio. does not render pixels — it renders presence as a waveform visualization. a leaf in the element tree (leaf type: waveform)

## protocol role

sound is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: waveform. it has no sub-organelles. its membrane constrains it, it occupies a strip or square, membrane places it

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| src | — | particle CID | required |
| mode | — | waveform, icon | icon when membrane $c_w < 10g$ |
| duration | — | seconds, optional | — |

### mode sizing

| mode | width | height |
|------|-------|--------|
| waveform | fill | fix $4g$ |
| icon | fix $4g$ | fix $4g$ |

$s_{min}$: waveform $(10g, 4g)$, icon $(4g, 4g)$

## occupy

waveform mode: $s = (c_w, 4g)$ — fills offered width, fixed $4g$ height

icon mode: $s = (4g, 4g)$ — fixed square

mode selection: if the membrane offers $c_w < 10g$, sound snaps to icon mode regardless of the mode parameter

## waveform structure

horizontal bar chart of amplitude samples rendered within the occupied size:

- bar width: $g/8$
- gap between bars: $g/8$
- number of bars: $\lfloor c_w / (g/8 + g/8) \rfloor = \lfloor c_w \cdot 4 / g \rfloor$
- bar height: proportional to amplitude sample, maximum $4g$, minimum $g/8$
- bar color: [[emotion]] (default #ffffff)
- bars centered vertically within the $4g$ strip

icon mode renders ion(sound-glyph, $4g$) at the membrane's placed position

## states

| state | visual change | trigger |
|-------|-------------|---------|
| idle | static waveform or icon, color at #ffffff | default |
| playing | bars animate to amplitude in real time, color = [[emotion]] | playback active |
| paused | waveform frozen, ion(pause-glyph, $2g$) overlaid centered | playback paused |
| error | ion(sound-broken, $4g$, emotion anger) replaces waveform | src failed to load |

state transitions: $150\text{ms}$ ease

## emotion

waveform bar color = [[emotion]]. emotion is computed by the [[tri-kernel]], not assigned manually

| emotion source | effect |
|---------------|--------|
| playing, content signal | waveform color shifts to emotion hex |
| idle | default #ffffff |
| error | anger red (icon mode only) |

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- sound renders on a plane at the same $p_z$ as its membrane
- waveform always faces the neuron (billboard)
- waveform bars extend in the y-axis of the billboard plane

## ECS

- Entity: sound organelle
- Components:
  - `Sizing { width, height }` — fill × Fix($4g$) for waveform, Fix($4g$) × Fix($4g$) for icon
  - `SoundSrc { cid }` — particle CID of the audio content
  - `SoundMode { waveform | icon }` — resolved at layout time from $c_w$
  - `PlayState { idle | playing | paused | error }`
  - `SoundDuration { Option<f32> }` — seconds, used for waveform sample scaling
  - `Emotion { color }` — waveform bar color
- System: sound participates in `OccupySystem` as a leaf — returns size from mode
