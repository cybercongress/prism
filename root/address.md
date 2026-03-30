---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

[[neuron]] address display atom in [[prysm]]

renders the cryptographic identity of a [[neuron]]. the address is a bech32 string with a hash-bar visualization — a unique colorful waveform derived from the address bytes. text and bars flow together without gaps: `bostrom1|||||||||vug5`

## hash-bar visualization

each byte of the address maps to a colored bar. bars are 3px wide with 2px gaps, arranged in two mirrored rows growing up and down from a center line. bar height (1-6 units) encodes the byte value. bar color comes from the acid [[emotion]] palette:

- [[green]] #00fe00 — most common, the base tone of identity
- [[blue]] #00acff — exploration, linked addresses
- [[violet]] #d500f9 — rare byte values
- [[yellow]] #fcf000 — attention markers
- [[orange]] #ff5b00 — infrequent, distinctive

the result: every address has a unique visual fingerprint recognizable at a glance without reading the hex. two addresses that look alike in text are instantly distinguishable by their waveform

big variant: 32 bar pairs (prefix text + 32 up bars + 32 down bars + suffix text)
small variant: 12 bar pairs (truncated prefix + 12 up + 12 down + truncated suffix)

## interface

- inputs
	- address: bech32 string (e.g. bostrom1...)
	- [[emotion]]: border accent — green for own address, neutral for others
	- copyable: whether tap copies to clipboard
- outputs
	- copy event: emitted on tap when copyable
	- navigate event: open neuron profile
- states
	- default, hover (copy icon revealed), active

## variants

- big — full address: prefix (e.g. "bostrom1") + 32 hash-bar pairs + suffix (e.g. "vug5"). used in [[prysm/neuron-card]] and profile headers
- big-hover — copy icon appears on hover
- big-play — action indicator for interactive contexts
- small — truncated: short prefix (e.g. "bos1q") + 12 hash-bar pairs + short suffix (e.g. "8kp"). used inline in [[prysm/aip]], [[prysm/table]], and feeds
- small-hover — copy icon on hover

## composition

- address inside [[prysm/neuron-card]] = identity anchor
- address inside [[prysm/avatar]] = compact identity reference
- address inside [[prysm/table]] = row identifier for neuron lists
- the hash-bar pattern is the visual signature of identity across [[cyb]] — when a neuron sees a familiar waveform, recognition is instant
