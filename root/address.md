---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

[[neuron]] address display atom in [[prysm]]

renders the cryptographic identity of a [[neuron]]. the address is a bech32 string with a hash-bar visualization — a unique colorful waveform derived from the address bytes. text and bars flow together without gaps: `bostrom1|||||||||vug5`

## hash-bar visualization

each character of the address maps to a colored bar and a musical note. the address is both visible and audible — a unique waveform and a unique melody

bars are 3px wide, arranged in two mirrored rows growing up and down from a center line. bar height encodes character frequency (common letters = tall, rare = short). text and bars flow together without gaps

big variant: prefix + all address bars + suffix
small variant: truncated prefix + subset of bars + truncated suffix

## character mapping

each bech32 character belongs to one of 7 color-note groups:

| color | note | characters | gain |
|-------|------|------------|------|
| #00fe00 green | E3 | a, g, l, m, s | 1.0 → 0.4 |
| #00acff blue | G3 | b, h, n, t | 1.0 → 0.4 |
| #304ffe indigo | A3 | c, i, o, u | 1.0 → 0.4 |
| #00acff blue | B3 | d, f, j, p, r, v | 1.0 → 0.5 |
| #d500f9 violet | D3 | e, k, q, w | 1.0 → 0.4 |
| #fcf000 yellow | B2 | x, z | 0.7 → 0.6 |
| #ff5b00 orange | F#3 | y | 0.7 |
| #777777 gray | sustain (pause) | 0-9 | — |

gain decreases with bar height — tall bars are loud, short bars are quiet. digits produce no note (sustain), extending the previous note duration from 16th to quarter note — creating rhythmic pauses in the melody

## sound

click on an address to hear it. each character plays its note sequentially (0.2s per note) over a pad drone (E3). the melody is deterministic — the same address always sounds the same. neurons recognize familiar addresses by ear

the sound is synthesized with Tone.js using sampled lead and pad instruments

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
