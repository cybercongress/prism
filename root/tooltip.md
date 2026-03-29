---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

floating contextual popup molecule in [[prysm]]

a small dark pane that appears near a target element to explain what it does. anchored to buttons, icons, counters, and addresses. the tooltip is passive information — it appears on hover (desktop) or long-press (mobile) and disappears when attention moves away

distinct from [[prysm/adviser]]: adviser is a full-width section banner with [[emotion]] color. tooltip is a small floating popup with neutral dark background

## interface

- inputs
	- text: explanation content (1-3 short lines)
	- anchor: the element this tooltip attaches to
	- position: above, below, left, right of anchor
	- icon: optional [[prysm/images]] glyph
- outputs
	- display only — no interaction (tooltip itself is not clickable)
- states
	- hidden, visible

## variants

- default — dark glass pane with white text. standard informational tooltip
- halogram — tooltip with [[prysm/saber]] accent line and glow. used for feature discovery and onboarding hints
- no-glossy-fx — flat dark pane without glass blur. used in performance-sensitive contexts or when layered over complex backgrounds

## composition

- tooltip composed of [[prysm/glass]] (dark, high opacity) + [[prysm/text]] + optional [[prysm/images]] icon
- tooltip attached to [[prysm/button]] = action description
- tooltip attached to [[prysm/counter]] = metric explanation
- tooltip attached to [[prysm/address]] = full address on hover over truncated version
- tooltip attached to [[prysm/ion]] = navigation item description
- on mobile: tooltip becomes a brief bottom toast instead of a floating popup
