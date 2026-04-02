---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

continuous value molecule in [[prysm]]

a draggable control for selecting a value within a range. snaps to the 8px grid. used for amounts, thresholds, and progress visualization

## interface

- inputs
	- value: current position (0.0–1.0)
	- min, max: range bounds
	- step: snap increment (optional)
	- [[emotion]]: fill color — green for healthy ranges, red for danger zones, yellow for caution
- outputs
	- value change event: emitted on drag
- states
	- default, hover, active, disabled

## variants

- range selector — interactive, user drags the handle to set a value. used in token amount inputs, delegation splits, and threshold settings
- progress bar — read-only, displays completion or fill level. used in loading states and [[prysm/indicator]] compositions

## composition

- slider inside [[prysm/input]] = amount selector for token operations
- slider inside [[prysm/bar]] = inline range control
- slider as progress bar inside [[prysm/display]] = loading or staking progress
