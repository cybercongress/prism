---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

aip card molecule in [[prysm]]

the universal card for any entity in the [[cybergraph]] — a [[particle]], [[neuron]], [[cyb/avatar]], or [[aip]]. the aip card shows identity, metadata, and available actions in a compact rectangular format

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

- aip card composed of [[prysm/glass]] + [[prysm/ion]] + [[prysm/text]] + [[prysm/toggle]] (star favorite) + [[prysm/button]] (menu)
- aip card inside [[prysm/oracle-cell]] = search result item
- aip card inside [[prysm/table]] = rich row with entity details
- aip card inside feeds = content stream item
