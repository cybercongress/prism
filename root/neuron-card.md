---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

[[neuron]] identity card molecule in [[prysm]]

the face of a [[neuron]] in [[cyb]]. shows who someone is: avatar, address, [[karma]], rank, and activity summary. the primary way users see and recognize each other in the [[cybergraph]]

## interface

- inputs
	- neuron: address, avatar, karma, rank, cyberlink count
	- [[emotion]]: border and accent color — green for high karma, neutral for average, red for low
- outputs
	- navigate event: open full neuron profile
	- [[cyberlink]] event: initiate a link to this neuron
- states
	- default, hover (expanded info), clicked (navigation triggered)

## variants

- big — full card with avatar, address (big), karma counter, rank indicator, and action buttons. used in profiles and search results
- small — compact card with avatar, address (small), and karma. used in lists, feeds, and inline mentions

## composition

- neuron-card composed of [[prysm/glass]] + [[prysm/address]] + [[prysm/counter]] (karma) + [[prysm/ion]] (avatar + label) + [[prysm/indicator]] (rank)
- neuron-card inside [[prysm/cyberver-cell]] = mentor or learner identity
- neuron-card inside [[prysm/table]] = row identity anchor
- neuron-card inside feed = author attribution
