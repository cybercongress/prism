---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

temporal content atom in [[prysm]]

renders a particle with a controllable timeline. a leaf in the element tree (leaf type: media). the defining property of media is the **playhead** — a current position between 0 and duration that the neuron can control. covers video, audio, and livestreams

for static or auto-animated visuals see [[prysm/image]]. for waveform-only audio display without controls, compose media in audio-only mode inside a molecule

## protocol role

media is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: media. it has no sub-organelles. its membrane constrains it. the rendering surface size depends on track presence

## tracks

a media particle carries one or more tracks:

| track | present | rendering |
|-------|---------|-----------|
| video | yes | frame at current playhead position |
| audio | yes | waveform visualization (amplitude bars) when no video track |
| subtitles | optional | text overlay at bottom of video surface |
| video + audio | both | video surface with audio; no separate waveform |

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| src | — | particle CID | required |
| width | fix or fill | any $k \cdot g$ or fill | fill |
| aspect | — | ratio or free | 16:9 |
| corner-radius | fix | $0$, $g/2$, $g$ | $0$ |

height is derived from width × aspect ratio when a video track is present. audio-only: fix $4g$ height (waveform bar)

$s_{min} = (8g, 4g)$

## play states

| state | description |
|-------|-------------|
| loading | src resolving or buffering |
| playing | advancing playhead, rendering frames / audio |
| paused | playhead stopped, frame held |
| buffering | playhead stalled waiting for data |
| ended | playhead reached duration |
| error | src failed to resolve or decode |
| live | no known duration — stream is ongoing |

## waveform (audio-only)

when no video track is present, media renders its audio as an amplitude waveform:

```
stack horizontal [fill × fix(4g), gap g/8]
  glass [fix(g/8) × fix(bar_height), emotion color] × n_bars
```

bars are $g/8$ wide, gap $g/8$, height proportional to amplitude at that position. color = [[emotion]]. current playhead position is marked by a brighter bar

## emotion

media carries [[emotion]] as:
- glass tint overlay at 12% opacity on the video surface
- waveform bar color in audio-only mode

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | paused, first frame or waveform | src loaded |
| playing | advancing, controls hidden after $2\text{s}$ | play |
| hover | controls fade in | pointer over |
| loading | pulse overlay | src loading |
| error | vector [broken-media, $4g$, anger] | src failed |
| live | "live" indicator, no scrub | stream |

state transitions: $150\text{ms}$ ease

## controls

media exposes playback controls to the molecule layer — the media atom itself renders the content. the molecule composes media with control molecules (play/pause button, scrub slider, time display). media does not render its own controls

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- media renders on a plane at the same $p_z$ as its membrane
- video frames render as billboard texture
- playback continues in 3D — temporal property, not spatial

## ECS

- Entity: media organelle
- Components:
  - `Sizing { width, height }` — derived from aspect
  - `MediaSrc { cid }`
  - `MediaTracks { video: bool, audio: bool, subtitles: bool }`
  - `PlayState { loading | playing | paused | buffering | ended | error | live }`
  - `Playhead { position: f32, duration: Option<f32> }` — seconds; None = live
  - `MediaAspect { ratio }` — for video surface sizing
  - `Tint { emotion: Option<Color> }`
- System: `MediaSystem` advances playhead, decodes frames, computes waveform amplitude
