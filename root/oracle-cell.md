---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

search cell in [[prysm]]

the primary discovery interface of [[cyb/oracle]]. where a [[neuron]] asks questions and the [[cybergraph]] answers. the oracle-cell combines a search input with a ranked result feed — [[particle]] content ordered by [[cyberank]], the relevance signal of [[cyber]]

## regions

- [[aip]] selector — choose which search backend or agent to query. [[prysm/tabs]] or [[prysm/filter]] for switching
- [[mind]] — navigation awareness indicator showing where the neuron is in the graph
- particle display — the main result: a single [[particle]] rendered through [[prysm/content]] in full format
- content feed — ranked list of related [[particle]] results. [[prysm/object]] cards ordered by [[cyberank]]

## interface

- inputs
	- query: search text from [[prysm/input]]
	- results: ranked list of particles with cyberank scores
	- [[emotion]]: confidence signal — green for high-confidence results, yellow for sparse results
- outputs
	- search event: new query submitted
	- navigate event: open a result particle
	- [[cyberlink]] event: create a link between query and result (the fundamental act of teaching the [[cybergraph]])

## composition

- oracle-cell composed of [[prysm/input]] (search bar) + [[prysm/content]] (main result) + [[prysm/filter]] (type filter) + [[prysm/object]] (result cards) + [[prysm/display]] (featured result)
- oracle-cell renders inside the [[prysm/hud]] content zone
- oracle-cell is the primary cell of [[cyb/oracle]]
