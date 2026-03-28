---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

[[neuron]] address display atom in [[prysm]]

renders the cryptographic identity of a [[neuron]] — the bech32 address that proves who she is. the address is the neuron's visible identity in [[cyb]], displayed wherever authorship or ownership matters

## interface

- inputs
	- address: bech32 string (e.g. bostrom1...)
	- [[emotion]]: color signal — green for own address, neutral for others
	- copyable: whether tap copies to clipboard
- outputs
	- copy event: emitted on tap when copyable
	- navigate event: open neuron profile
- states
	- default, hover, active

## variants

- big — full address with monospace rendering, used in [[prysm/neuron-card]] and profile headers
- small — truncated (first 8 + last 4 characters), used inline in [[prysm/aip]], [[prysm/table]], and feeds

## composition

- address inside [[prysm/neuron-card]] = identity anchor
- address inside [[prysm/avatar]] = compact identity reference
- address inside [[prysm/table]] = row identifier for neuron lists
