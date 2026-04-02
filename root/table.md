---
tags: prysm, cyb
crystal-type: pattern
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

### row molecules
- line — minimal, single-line rows separated by [[prysm/saber]]. used for simple lists
- row-L — icon/label on the left, value on the right. used for key-value displays
- row-R — value on the left, action on the right. used for transaction lists
- list-row-16gutter — list row with 16px gutter spacing
- list-row-8gutter — compact list row with 8px gutter
- list-row-8gutter-R — compact row, right-aligned values

### cell-level table components (2-cells/tables)
- table-header — column header row with sort controls
- table-legend — column count variants: 2-col, 3-col, 4-col, 5-col
- table-scroll — scrollable table body with fixed header
- table-sub-group — grouped rows with avatar: 2-col through 5-col, token variant
- table-sub-sub-group — nested row grouping
- receipt-closed — collapsed transaction receipt row
- receipt-open — expanded transaction receipt with full details

### sort
- sort — column headers with sort indicators
- sort/dropdown — sortable headers with dropdown for additional options

## alignment rules

- numeric columns: right-aligned. digits stack by place value so thousands, millions, decimals read as a visual column
- text columns: left-aligned
- icon/avatar columns: center-aligned
- column headers inherit alignment from their data column
- mixed columns (text + number): left-align, but monospace ensures digits still read consistently

## composition

- table composed of [[prysm/text]] + [[prysm/saber]] (row dividers) + [[prysm/ion]] (cell content) + [[prysm/counter]] (numeric cells)
- table inside [[prysm/cyberver-cell]] = learner rankings and faculty stats
- table inside [[cyb/sigma]] = token balances and transaction history
- table inside [[prysm/oracle-cell]] = structured search results
