---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

navigation awareness cell in [[prysm]]

the commander — the bottom action bar of [[cyb]]. mind shows where the [[neuron]] is in the [[cybergraph]] and what actions are available from here. always at the bottom of the screen, on every device. provides the persistent interaction layer: search, navigation arrows, signing, and context-aware actions

## interface

- inputs
	- location: current position in the [[cybergraph]] (particle, neuron, aip)
	- available actions: what the neuron can do from this location
	- connection state: online, offline, syncing
	- [[emotion]]: reflects protocol health and neuron confidence
- outputs
	- navigate event: back, forward, home
	- search event: query submitted
	- sign event: [[cyberlink]] creation initiated
	- connect event: network state change

## variants

### desktop
- connect — connection status indicator, network selector
- input — search/command input bar with [[prysm/input]] molecule

### mobile
- default-action-bar — minimal bottom bar with back, forward, sign
- action-bar + logo — bottom bar with cyb logo for branding context
- 2-action-bar — expanded bar with two action zones (navigate + sign)

### contextual
- send bar sense — action bar adapted for [[cyb/sense]] messaging (attach, send, emoji)
- sense-chosen-message — action bar when a message is selected (forward, reply, delete)
- socials-hover — social actions overlay on hover
- amount-select-button — token amount selector for [[cyb/sigma]] operations

## composition

- mind composed of [[prysm/glass]] + [[prysm/input]] + [[prysm/button]] + [[prysm/ion]] + [[prysm/saber]]
- mind inside [[prysm/hud]] = persistent navigation layer
- mind adapts per [[aip]]: oracle gets search input, sense gets message input, sigma gets amount input
- always at the bottom — desktop and mobile. layout adapts, position is constant
