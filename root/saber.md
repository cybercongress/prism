---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

accent line and divider atom in [[prysm]]

a thin luminous line that separates, accents, and creates visual rhythm. carries [[emotion]] color — a green saber signals confidence, a red saber signals danger. the visual heartbeat of [[cyb]]

## interface

- inputs
	- [[emotion]]: line color
	- orientation: vertical or horizontal
	- weight: thickness variant
- outputs
	- display only — no interaction

## variants

- 1px — subtle separator, used between list items and inside [[prysm/table]] rows
- 2px — emphasized divider, used between major sections and in [[prysm/hud]] framing
- horizontal — full-width line, used to separate content blocks and inside [[prysm/bar]]

## composition

- saber + [[prysm/ion]] = the [[prysm/bar]] molecule — the primary toolbar pattern
- saber inside [[prysm/table]] = row and column separators
- saber inside [[prysm/hud]] = frame borders between navigation zones
- saber inside [[prysm/display]] = content block separator
- saber carries [[emotion]] independently from its parent, enabling color-coded section boundaries
