---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

onboarding cell in [[prysm]]

the first screen a new user encounters in [[cyb]]. the portal-cell guides a human from stranger to [[neuron]] — creating an identity, claiming a gift, learning the [[prysm/hud]], and orienting in the [[cybergraph]]. every step is a guided transition from the physical world into the cyber world

## regions

- citizenship — identity creation form. [[prysm/input]] for name/avatar + [[prysm/button]] to generate a [[neuron]] address. [[prysm/adviser]] guides each step
- gift claim — display of welcome tokens. [[prysm/counter]] shows the gift amount + [[prysm/button]] to claim
- hud introduction — interactive tour of the [[prysm/hud]] zones. [[prysm/adviser]] tooltips highlight each widget
- cyb-map — overview of available [[aip]] applications. [[prysm/aip]] cards for each app the neuron can explore

## interface

- inputs
	- onboarding state: which step the user is on
	- [[emotion]]: encouraging green throughout — welcoming the new neuron
- outputs
	- citizenship event: neuron created
	- gift claim event: tokens received
	- navigate event: proceed to chosen [[aip]]

## composition

- portal-cell composed of [[prysm/display]] + [[prysm/input]] + [[prysm/button]] + [[prysm/adviser]] + [[prysm/aip]] + [[prysm/counter]]
- portal-cell renders inside the [[prysm/hud]] content zone
- portal-cell is the entry point to [[cyb/portal]]
