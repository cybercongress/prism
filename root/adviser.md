---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

contextual hint molecule in [[prysm]]

the guidance system of [[cyb]]. a tooltip that appears near a component to explain, warn, or confirm. carries [[emotion]] color to signal the nature of the message — green for encouragement, red for warning, yellow for caution, neutral for information

## interface

- inputs
	- text: hint message
	- [[emotion]]: signal type (positive, negative, neutral)
	- anchor: the component this adviser is attached to
	- particle: optional attached [[particle]] for rich hints
- outputs
	- dismiss event: user closes the hint
	- action event: optional call-to-action inside the hint
- states
	- closed (hidden), opened-positive, opened-negative, opened-neutral

## variants

- closed — invisible, waiting for trigger (hover, focus, or first-time guidance)
- opened-positive — green-tinted, confirms a good action ("transaction signed")
- opened-negative — red-tinted, warns about risk ("insufficient balance")
- opened-neutral — default tint, provides information ("this is your karma score")
- particle-attached — enriched hint with an embedded [[particle]] preview

## composition

- adviser composed of [[prysm/glass]] (tinted) + [[prysm/text]] + [[prysm/saber]] (accent line) + optional [[prysm/button]] (action)
- adviser attached to [[prysm/button]] = action guidance
- adviser attached to [[prysm/counter]] = metric explanation
- adviser attached to [[prysm/input]] = field-level validation feedback
- adviser inside [[prysm/portal-cell]] = onboarding step hints
