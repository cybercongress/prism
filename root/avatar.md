---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

avatar molecule in [[prysm]]

a compact horizontal display of a [[neuron]] or [[cyb/avatar]] identity. thinner than [[prysm/neuron-card]] — used where space is tight and recognition matters more than detail. shows avatar image, name or address, and one key metric

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

- avatar composed of [[prysm/glass]] + [[prysm/ion]] (avatar + label) + [[prysm/address]] (small) + [[prysm/counter]] (optional metric)
- avatar inside [[prysm/hud]] = active identity indicator
- avatar inside [[prysm/input]] = neuron selector field
- avatar inside [[cyb/sense]] = conversation participant
