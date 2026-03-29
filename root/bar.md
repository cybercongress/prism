---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

[[prysm/saber]] + [[prysm/ion]] composite molecule in [[prysm]]

the universal toolbar pattern. a saber line with ions attached — creating labeled action strips, input rows, and display headers. the bar is how [[cyb]] organizes horizontal sequences of actions, values, and controls

## interface

- inputs
	- items: list of [[prysm/ion]] elements
	- mode: button, input, or display
	- [[emotion]]: accent color for the [[prysm/saber]] line
- outputs
	- action event: from button-mode items
	- value change event: from input-mode items
- states
	- default, hover (per item), active (per item)

## variants

- 1-sided — saber on one edge, ions extend from it. used for section headers and single-direction toolbars
- bi-sided — saber on both edges, ions between them. used for centered action groups
- horizontal — saber runs horizontally with ions above or below. used for full-width dividers with labels
- horizontal-1-sided — horizontal saber with ions on one side only
- each variant supports three modes:
	- button — ions act as clickable actions
	- input — ions wrap [[prysm/input]] fields for inline data entry. has focus/passive states
	- display — ions show read-only values

## composition

- bar composed of [[prysm/saber]] + [[prysm/ion]] + optional [[prysm/button]] or [[prysm/input]]
- bar inside [[prysm/hud]] = toolbar for the active [[aip]]
- bar inside [[prysm/table]] = column header row
- bar inside cells = section action strip
