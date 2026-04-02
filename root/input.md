---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

data entry molecule in [[prysm]]

the way users put data into [[cyb]]. every search query, token amount, neuron selection, and text submission flows through this molecule. the input captures keystrokes, validates format, and emits structured data

## interface

- inputs
	- type: text, neuron, token+amount, select
	- placeholder: hint text
	- icon: optional [[prysm/images]] glyph (left, right, or both)
	- validation: format rules
	- [[emotion]]: border color reflects validation state — green for valid, red for error, neutral for idle
- outputs
	- value change event: emitted on each keystroke
	- submit event: emitted on enter or button press
- states
	- default, focus, filled, error, disabled

## variants

### desktop
- text L — icon on the left, text to the right. standard search and text input
- text R — icon on the right. used for inputs with action trigger
- text LR — icons on both sides. used for complex inputs (search with filter)
- dropdown — select from a list of options
- neuron + dropdown — specialized for entering/selecting a [[neuron]] address with dropdown chooser. validates bech32 format
- token + amount — dual field: token selector + numeric amount. used in [[cyb/sigma]] and [[teleport]]
- sort/default — sort control input with direction toggle
- sort/dropdown — sort control with column chooser

### mobile
- m.-text — mobile text input, full-width
- m.-logScale — logarithmic scale selector with percentage markers (0%, 2%, 5%, 10%, 20%, 50%, max). used for staking and delegation amounts

## composition

- input composed of [[prysm/glass]] + [[prysm/text]] + [[prysm/ion]] + [[prysm/button]] (submit) + [[prysm/saber]] (underline)
- input inside [[prysm/oracle-cell]] = search bar
- input inside [[prysm/bar]] = inline data entry in toolbars
- input + [[prysm/adviser]] = validated entry with guidance
