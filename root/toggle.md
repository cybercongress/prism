---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

binary state molecule in [[prysm]]

a two-state switch. the user taps, the state flips. used wherever [[cyb]] needs a yes/no, on/off, or favorite/unfavorite choice

## interface

- inputs
	- state: boolean (on or off)
	- [[emotion]]: color signal — green when active, neutral when off
	- disabled: prevents interaction
- outputs
	- state change event: emitted on tap
- states
	- on, off, disabled

## variants

- on — filled, active state
- off — hollow, inactive state
- star — favorite marker, used in [[prysm/aip]] and [[prysm/neuron-card]] for bookmarking

## composition

- toggle inside [[prysm/filter]] = selectable filter option
- toggle inside [[prysm/table]] = row selection
- toggle inside [[prysm/bar]] = toolbar switch
- star toggle inside [[prysm/aip]] = favorite/bookmark action
