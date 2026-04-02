---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

tag badge molecule in [[prysm]]

a small rounded label that classifies, filters, and marks. pills attach to [[particle]] content, [[neuron]] identities, and [[aip]] categories. each pill carries [[emotion]] through its background color — green for positive, red for negative, blue for neutral, white for informational

## interface

- inputs
	- label: short text (1-2 words)
	- [[emotion]]: background color from the acid palette
	- icon: optional avatar or [[prysm/images]] glyph (left side)
	- toggleable: whether the pill acts as an on/off filter
- outputs
	- tap event: toggle filter or navigate to tag
- states
	- default, hover, on (active filter), off (inactive filter)

## variants

- green — positive signal: verified, staked, confirmed
- red — negative signal: spam, rejected, flagged
- blue — neutral signal: category, topic, protocol tag
- white — informational: metadata label, status
- gray — muted: disabled, archived
- avatar — pill with [[cyb/avatar]] icon on the left + neuron name. used for identity tags
- bulb — larger pill with icon, used for prominent content labels
- on/off — toggleable pair with fill indicator showing active state

## composition

- pill composed of rounded [[prysm/glass]] rectangle + [[prysm/text]] label + optional [[prysm/images]] icon
- pill inside [[prysm/filter]] = selectable filter option
- pill inside [[prysm/aip]] card = entity category tags
- pill inside [[prysm/oracle-cell]] = top particle label, search result tags
- pill inside [[prysm/neuron-card]] = neuron role or status badge
