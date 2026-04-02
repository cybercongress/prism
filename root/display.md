---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

content container molecule in [[prysm]]

a [[prysm/glass]] pane that frames content with optional emphasis. the display gives content a visual home — a bordered, highlighted, or empty region that draws attention or indicates absence

## interface

- inputs
	- content: child components to render inside
	- emphasis: none, highlight, sized
	- [[emotion]]: tint for the glass surface
- outputs
	- display only — interaction comes from child components
- states
	- default, empty, highlighted

## variants

- empty — shows a placeholder message and percentage (e.g. 0.62% filled). signals that content can be added
- highlight — emphasized glass pane with [[emotion]] tint. used for featured content, important numbers, and call-to-action regions
- highlight 2-lines — two-line highlighted block for titles with subtitles
- sized text — content with explicit font size override for emphasis

## composition

- display composed of [[prysm/glass]] + [[prysm/text]] + [[prysm/saber]] border
- display inside [[prysm/oracle-cell]] = featured search result
- display inside [[prysm/portal-cell]] = onboarding highlight
- display wraps [[prysm/content]], [[prysm/counter]], or [[prysm/indicator]] for visual emphasis
