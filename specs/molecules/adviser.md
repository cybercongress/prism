---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

voice of [[cyb]] molecule in [[prysm]]

the guidance system. adviser highlights dangerous zones, shows errors, gives suggestions, confirms successful actions. appears in two modes: as a grid zone bar (top center) and as a contextual popup near any organelle. carries [[emotion]] color — the adviser speaks in color

## protocol role

adviser is a molecule in the element tree $\mathcal{T}$. two modes:

- **bar mode**: membrane = adviser zone of [[prysm/grid]] (row 1, col 2). fill × fix($6g$). $\mathcal{U} = 40$ (guiding)
- **popup mode**: overlay attached to any organelle. $\mathcal{U} = 40$ (guiding). not in grid — appended to root layer near anchor

## sizing

| mode | sizing |
|------|--------|
| bar (desktop) | fill × fix($6g$) |
| bar (mobile) | fill × fix($4g$) |
| popup | fix(auto, content-width) × fix(auto, content-height), max fill × fix($10g$) |

$s_{min}$: bar = $(10g, 4g)$. popup = $(8g, 4g)$

## structure

bar mode:
```
glass [fill × fix(6g), depth foreground, emotion tint]
  stack horizontal [gap g]
    saber [vertical, g/4, emotion glow]
    text [body, message]
    button [optional action, e.g. "retry", "dismiss"]
```

popup mode:
```
glass [auto × auto, depth foreground, emotion tint, corner-radius g]
  stack vertical [gap g/2]
    text [caption, message]
    button [optional action]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 30g$): saber + full message text + action button
- $l_2$ ($w_{min} = 10g$): message text only, truncated
- $l_3$ ($w_{min} = 4g$): icon only (ion warning/success/info glyph)

## emotion

adviser IS emotion made visible. the entire glass tints with the message's [[emotion]]:

| emotion | tint | glow | when |
|---------|------|------|------|
| green (joy) | #00fe00 at 15% | saber glow green | success: "transaction signed", "cyberlink created" |
| red (anger) | #ff0000 at 15% | saber glow red | error: "insufficient balance", "signature failed" |
| yellow (surprise) | #fcf000 at 15% | saber glow yellow | attention: "large transfer", "new feature" |
| blue (interest) | #00acff at 15% | saber glow blue | information: "this is your karma score" |
| white | none | saber glow white | neutral guidance |

## states

| state | visual | trigger |
|-------|--------|---------|
| hidden | not rendered, $s_h = 0$ in bar mode | no message |
| visible | glass appears with emotion tint | message arrives |
| dismissing | fade out over $150\text{ms}$ | user dismisses or timeout |

bar mode: hidden by default, appears when there is something to say, auto-hides after timeout or user action
popup mode: appears on hover/focus of anchor organelle, hides on leave

state transitions: $150\text{ms}$ ease

## interaction

- tap dismiss button → hide adviser
- tap action button → execute action (retry, navigate, etc.)
- popup: hover on anchor organelle → show, leave → hide

## where in [[prysm/grid]]

| mode | grid zone | $\mathcal{U}$ |
|------|-----------|------|
| bar | adviser (row 1, col 2) | 40 |
| popup | overlay, not in grid | 40 |

## 3D

adviser renders closer to the neuron than frame zones — $\mathcal{U} = 40$ places it at lower $p_z$ (nearer). in 3D, adviser is a floating panel that follows the neuron's gaze. popup mode: attached near the anchor organelle's $p_z$

## ECS

- Entity: adviser organelle
- Components:
  - `Sizing { width, height }` — fill for bar, auto for popup
  - `GridArea { name: "adviser" }` — bar mode only
  - `AdviserMode { bar | popup }`
  - `AdviserMessage { text, emotion, action }` — current message
  - `Visibility { hidden | visible }`
  - `Anchor { target_entity }` — popup mode: which organelle
  - `FoldSet { conformations }`
  - `Tint { emotion_color }` — glass emotion overlay
  - `SaberGlow { color }` — accent line emotion
- Systems:
  - `AdviserMessageSystem` reads system events (errors, successes, guidance), writes `AdviserMessage`
  - `AdviserVisibilitySystem` manages show/hide timing
  - `AdviserEmotionSystem` reads message emotion, writes `Tint` and `SaberGlow`
