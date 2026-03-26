---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

data grid molecule in [[prysm]]

structured rows and columns for displaying lists, rankings, transactions, and delegation data. the table renders the [[cybergraph]] as ordered information — neurons sorted by [[karma]], particles sorted by [[cyberank]], tokens sorted by balance

## interface

- inputs
	- columns: list of (label, width, alignment, sortable)
	- rows: list of cell values
	- sort: active column and direction
	- [[emotion]]: row-level accent (e.g. green for positive balance changes)
- outputs
	- sort event: emitted when user taps a sortable column header
	- row select event: emitted on row tap
	- navigate event: emitted when a linked cell is tapped
- states
	- default, sorted (ascending/descending), loading, empty

## variants

- line — minimal, single-line rows separated by [[prysm/saber]]. used for simple lists
- row-L — icon/label on the left, value on the right. used for key-value displays
- row-R — value on the left, action on the right. used for transaction lists
- sort — column headers with sort indicators
- sort/dropdown — sortable headers with dropdown for additional options

## composition

- table composed of [[prysm/text]] + [[prysm/saber]] (row dividers) + [[prysm/ion]] (cell content) + [[prysm/counter]] (numeric cells)
- table inside [[prysm/cyberver-cell]] = learner rankings and faculty stats
- table inside [[cyb/sigma]] = token balances and transaction history
- table inside [[prysm/oracle-cell]] = structured search results
