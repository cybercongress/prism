---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

result filtering molecule in [[prysm]]

a row of toggleable options that narrow a result set. used after a search, in feeds, and in [[prysm/table]] views to let the user focus on what matters. each filter option is a labeled toggle — tap to activate, tap again to deactivate

## interface

- inputs
	- options: list of (label, count) pairs
	- active: set of currently selected filters
	- [[emotion]]: highlight color for active options
- outputs
	- filter change event: emitted when any option toggles
- states
	- default, active (per option)

## variants

- 3-items — compact row of three filter options. used in tight spaces
- wide — full-width row with scrollable overflow. used when filter options are many

## composition

- filter composed of [[prysm/glass]] strip + [[prysm/toggle]] + [[prysm/ion]] (label + count)
- filter inside [[prysm/oracle-cell]] = search result type filter (text, image, video, neuron)
- filter inside [[prysm/table]] = column-level filtering
- filter above [[prysm/content]] = feed category selector
