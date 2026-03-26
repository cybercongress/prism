---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

identity strip molecule in [[prysm]]

a compact horizontal display of a [[neuron]] or [[cyb/avatar]] identity. thinner than [[prysm/neuron-card]] — used where space is tight and recognition matters more than detail. shows avatar, name or address, and one key metric

## interface

- inputs
	- identity: neuron address or avatar reference
	- label: name, alias, or truncated address
	- metric: karma, rank, or balance (optional)
	- [[emotion]]: accent color
- outputs
	- navigate event: open full identity view
- states
	- default, hover

## variants

- 2-line — avatar + name on first line, address or metric on second. used in message headers and comment attribution
- chooser — selectable identity strip with radio/check indicator. used when switching between multiple neurons or avatars

## composition

- subject composed of [[prysm/glass]] + [[prysm/ion]] (avatar + label) + [[prysm/address]] (small) + [[prysm/counter]] (optional metric)
- subject inside [[prysm/hud]] = active identity indicator
- subject inside [[prysm/input]] = neuron selector field
- subject inside [[cyb/sense]] = conversation participant
