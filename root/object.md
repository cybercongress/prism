---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

entity card molecule in [[prysm]]

the universal card for any entity in the [[cybergraph]] — a [[particle]], [[neuron]], [[cyb/avatar]], or [[aip]]. the object card shows identity, metadata, and available actions in a compact rectangular format

## interface

- inputs
	- entity: the item to display (type, name, description, icon, metrics)
	- [[emotion]]: accent color based on entity state or relevance
	- menu: list of available actions (optional)
- outputs
	- navigate event: open entity detail view
	- action event: from menu items
	- [[cyberlink]] event: link to this entity
- states
	- default, hover (show menu trigger), expanded (menu open)

## variants

- 2-line — icon + title + subtitle. compact, used in lists and feeds
- 3-line — icon + title + subtitle + description. richer, used in search results
- 3-line + menu — adds a context menu with actions (link, stake, share, report)

## composition

- object composed of [[prysm/glass]] + [[prysm/ion]] + [[prysm/text]] + [[prysm/toggle]] (star favorite) + [[prysm/button]] (menu)
- object inside [[prysm/oracle-cell]] = search result item
- object inside [[prysm/table]] = rich row with entity details
- object inside feeds = content stream item
