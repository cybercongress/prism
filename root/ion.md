---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

icon-label pair atom in [[prysm]]

the most versatile structural atom. combines a [[prysm/images]] glyph with a [[prysm/text]] label into a single semantic unit. used everywhere a concept needs both visual and textual representation — navigation items, token displays, action labels, metadata fields

## interface

- inputs
	- icon: [[prysm/images]] glyph name and size
	- label: text string
	- [[emotion]]: color signal applied to both icon and label
- outputs
	- display only — interaction comes from the parent component
- states
	- default, hover (inherited from parent), active (inherited from parent)

## variants

- centric — icon above, label below. used in [[prysm/tabs]] and grid navigation
- horizontal — icon left, label right. the default layout for inline items
- input — icon inside an [[prysm/input]] field, label as placeholder
- star — icon centered with label as tooltip. used for compact actions
- trapezoid — angled layout for distinctive navigation elements in [[prysm/hud]]
- vertical — label above, icon below. used in stat displays

## composition

- ion is the building block of [[prysm/tabs]] — each tab is an ion in centric layout
- ion inside [[prysm/bar]] = labeled toolbar action
- ion inside [[prysm/button]] = icon-enhanced call-to-action
- ion + [[prysm/saber]] = the [[prysm/bar]] molecule
- ion inside [[prysm/content]] = formatted metadata field
