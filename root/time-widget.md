---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

personal history widget molecule in [[prysm]]

a timeline of the [[neuron]]'s activity in the [[cybergraph]]. shows recent [[cyberlink]] creations, delegations, token transfers, and [[karma]] changes. lives in the [[prysm/hud]] sidebar alongside [[cyb/brain]], [[cyb/sense]], and [[cyb/sigma]]

## interface

- inputs
	- neuron: the active neuron's address
	- events: chronological list of (timestamp, type, summary)
	- [[emotion]]: color per event type — green for rewards, red for penalties, neutral for links
- outputs
	- navigate event: tap an event to view details
	- filter event: toggle event type visibility
- states
	- default, loading, empty (new neuron with no history)

## composition

- time-widget composed of [[prysm/glass]] + [[prysm/text]] (timestamps) + [[prysm/ion]] (event icons) + [[prysm/saber]] (timeline line) + [[prysm/counter]] (metrics)
- time-widget inside [[prysm/hud]] = sidebar panel
- time-widget scrolls independently from the main content area
