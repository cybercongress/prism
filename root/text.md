---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

typography atom in [[prysm]]

the only way text appears in [[cyb]]. every word, label, heading, and paragraph renders through this atom. monospace foundation — a single font family across the entire interface. hierarchy comes from size and weight, never from decoration

## interface

- inputs
	- content: string to render
	- size: h1 (32), h2 (24), h3 (20), body (16), caption (14), micro (12)
	- weight: regular, medium
	- [[emotion]]: color signal override
- outputs
	- display only — no interaction

## variants

- left — default alignment, used in body content and lists
- center — used in headings, empty states, and onboarding
- right — used in numeric columns and counters
- paragraph — multi-line block with line height and spacing

## composition

- text inside [[prysm/button]] = action label
- text inside [[prysm/ion]] = icon caption
- text inside [[prysm/counter]] = formatted number
- text inside [[prysm/display]] = emphasized content
- text is the most composed atom — every molecule contains at least one
