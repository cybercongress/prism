---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

progress display atom in [[prysm]]

a visual fill level — shows how much of something is complete, consumed, or remaining. simpler than [[prysm/slider]]: read-only, no interaction

## interface

- inputs
	- level: fill ratio (0.0–1.0)
	- [[emotion]]: fill color — green for growth, red for depletion, yellow for approaching threshold
- outputs
	- display only — no interaction

## variants

- partial — partially filled, shows progress toward a goal
- full — completely filled, signals completion or maximum

## composition

- indicator inside [[prysm/counter]] = number with visual context (e.g. 847 [[karma]] with a fill bar showing rank percentile)
- indicator inside [[prysm/object]] = entity progress (staking completion, learning milestone)
- indicator inside [[prysm/display]] = section-level progress
