---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

[[particle]] renderer molecule in [[prysm]]

the universal content display. any [[particle]] in the [[cybergraph]] — text, image, video, audio, pdf, 3d model — passes through this molecule to become visible. content adapts its rendering to the particle format while keeping a consistent frame

## interface

- inputs
	- particle: the content to render (IPFS hash or inline data)
	- format: heading, text, number, link, picture, video, pdf, audio, avatar
	- [[emotion]]: color accent
- outputs
	- navigate event: tap a link particle
	- expand event: open particle in full view
	- [[cyberlink]] event: when interaction creates a link
- states
	- loading, rendered, error, empty

## variants

- heading — large [[prysm/text]] with optional [[prysm/images]] icon
- text + icon-L — text body with icon on the left
- text + icon-R — text body with icon on the right
- text + icon-LR — text body with icons on both sides
- number + indicator — numeric value with [[prysm/indicator]] fill bar
- picture — image with aspect-ratio container
- video, audio, pdf — embedded players

## composition

- content inside [[prysm/oracle-cell]] = search result feed
- content inside [[prysm/display]] = framed content block
- content is composed of [[prysm/text]] + [[prysm/images]] + [[prysm/ion]] + [[prysm/indicator]]
