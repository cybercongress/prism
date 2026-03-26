---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

section navigation molecule in [[prysm]]

a horizontal row of selectable items. one is active, the rest wait. tabs switch between sections within an [[aip]] or between [[aip]] applications in the [[prysm/hud]]. the primary way users move laterally through [[cyb]]

## interface

- inputs
	- items: list of (icon, label) pairs — each item is a [[prysm/ion]] in centric layout
	- active index: which tab is selected
	- [[emotion]]: highlight color for the active tab
- outputs
	- selection event: emitted when user taps an inactive tab
- states
	- default, hover (per tab), active (selected tab)

## variants

- 3-items — compact, used in sub-section navigation
- 4-items — standard [[aip]] navigation
- 5-items — extended, used for [[aip]] applications with many sections
- mobile variants: 3-items stacks to bottom bar

## composition

- tabs composed of [[prysm/ion]] atoms (centric layout) on a [[prysm/glass]] strip with [[prysm/saber]] underline on the active item
- tabs inside [[prysm/hud]] = global [[aip]] switcher
- tabs inside cells = section-level navigation
