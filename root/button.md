---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
stake: 17018136781390120
diffusion: 0.00017850532188362116
springs: 0.0008817646173448352
heat: 0.0006742940525810721
focus: 0.0004886408566614898
gravity: 2
density: 4.81
---

call-to-action molecule in [[prysm]]

the primary interaction primitive. every action a [[neuron]] takes in [[cyb]] flows through a button

## visual design

a button is a transparent region bounded by two vertical [[prysm/saber]] lines. the sabers are white (2px) with a green glow that radiates inward (~24px gradient fading to transparent). the button has no background — the glow and the sabers define its boundaries

### text color rules

- default: #ffffff white — neutral actions (navigate, open, select)
- danger: #ff0000 red — destructive or irreversible actions (delete key, burn tokens, revoke access)
- caution: #fcf000 yellow — actions requiring attention (large transfers, delegation changes)
- confirm: #00fe00 green — positive completion actions (sign, stake, claim)
- disabled: #777777 gray — unavailable actions

the text color carries the [[emotion]] of the action. a white button is safe. a red button demands attention

## interface

- inputs
	- text: label describing the action
	- icon: optional 16px or 20px [[prysm/images]] glyph
	- [[emotion]]: determines saber glow color and text color
	- action: callback triggered on press
	- adviser: tooltip text shown on hover via [[prysm/adviser]]
- outputs
	- action event: propagated to parent component
- states
	- default, hover, active, disabled (sabers dim to gray), loading

## variants

- default — single action bounded by two sabers, most common
- double — two actions side-by-side, three sabers (left | action1 | middle | action2 | right)
- triple — three actions, four sabers (rare, for multi-path decisions)
- side — attached to the edge of a [[prysm/glass]] pane, used in [[prysm/hud]] sidebar widgets

## placement

- primary action buttons live in the [[prysm/mind]] (commander) at the bottom of the screen — sign, send, confirm
- secondary actions live inside content areas — inside [[prysm/bar]], [[prysm/display]], [[prysm/neuron-card]]
- destructive actions (red text) are never the first or leftmost button — always require a deliberate reach
- side buttons attach to the vertical center of the left or right screen edge for persistent widget access ([[cyb/sigma]] right, [[cyb/sense]] right, [[cyb/brain]] left)
- double/triple buttons: the primary action is on the left, secondary/cancel on the right
- on mobile (<=768px): buttons stretch to full width when inside the commander

## composition

- buttons compose into [[prysm/bar]] molecules when paired with [[prysm/saber]] and [[prysm/ion]]
- button + [[prysm/adviser]] = guided action
- button inside [[prysm/input]] = submit trigger
- button inside [[prysm/mind]] = commander action (sign, navigate)