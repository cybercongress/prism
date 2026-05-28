---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

tag badge molecule in [[prysm]]

a small rounded label. classifies, filters, marks. glass (rounded) + text (label) + optional ion (icon). carries [[emotion]] through background color. also serves as progress bar when used with fill level

## protocol role

molecule in $\mathcal{T}$. lives inside [[prysm/filter]], [[prysm/launcher]], [[prysm/neuron-card]], [[prysm/content]], space zone content

## sizing

fix(auto, content) × fix($3g$)

$s_{min} = (4g, 3g)$ — minimum for short label

## structure

tag mode:
```
glass [auto × fix(3g), corner-radius 3g/2, emotion tint]
  stack horizontal [gap g/2]
    ion [2g, optional icon]
    text [micro, label]
```

progress mode (replaces [[indicator]]):
```
glass [fix(width) × fix(g), corner-radius g/2] — track
  glass [fix(width × level) × fix(g), corner-radius g/2, emotion tint] — fill
```

## variants

| variant | visual | use |
|---------|--------|-----|
| green | tint #00fe00 at 20% | positive: verified, staked |
| red | tint #ff0000 at 20% | negative: spam, flagged |
| blue | tint #00acff at 20% | neutral: category, topic |
| white | tint #ffffff at 20% | informational: metadata |
| gray | tint #4b4b4d at 15% | muted: archived, disabled |
| avatar | ion (avatar image, 2g) + neuron name text | identity tag |
| bulb | ion (bulb glyph, 2g) + text | feature highlight |
| on/off | toggleable, fill shows active state | filter option |
| progress | fill level + emotion threshold color | replaces indicator |
| linked | ion (link glyph, 2g) + text, tint #00acff | linked content |

progress emotion thresholds: ≥70% green · ≥30% yellow · <30% red

loading skeleton: opacity 0.3, widths cycle through 80px / 120px / 160px, animated pulse 1s

## emotion

pill background IS [[emotion]]. the pill color = the signal

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | background at emotion color | — |
| hover | opacity +0.05 (to 0.25), 1px stroke appears | pointer over |
| active | scale 0.95× | tap |
| toggled on | full color | filter active |
| toggled off | dim to #4b4b4d | filter inactive |

state transitions: $150\text{ms}$ ease

## 3D

renders at membrane's $p_z$

## ECS

- Entity: pill organelle
- Components:
  - `Sizing { width: auto, height: Fix(3) }`
  - `PillLabel { text }`
  - `PillIcon { glyph: Option }`
  - `PillVariant { tag | toggle | progress }`
  - `Emotion { color }` — background tint
  - `PillLevel { value: Option<f64> }` — for progress variant
- System: `PillSystem` handles tap for toggle variant
