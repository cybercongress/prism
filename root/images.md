---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
stake: 17237820130547482
diffusion: 0.00019031384281013565
springs: 0.00038310934143964427
heat: 0.00033715514250890567
focus: 0.0002775207523387504
gravity: 2
density: 8.9
---
icon library atom in [[prysm]]

the complete set of glyphs used across [[cyb]]. every icon has a semantic meaning tied to a protocol concept

## parameters

| parameter | values | default |
|-----------|--------|---------|
| name | icon identifier string | — (required) |
| size | 16, 20, 32, 48, 96 px | 16 |
| color | any hex from palette (applied as fill) | #ffffff |
| [[emotion]] | overrides color | none |

### size scale

| size | px | grid | use |
|------|----|------|-----|
| 16 | 16x16 | 2x2 grid units | inline with text, inside [[prysm/ion]] and [[prysm/button]] labels |
| 20 | 20x20 | 2.5x2.5 | standalone small, inside [[prysm/tabs]] |
| 32 | 32x32 | 4x4 | medium emphasis, [[prysm/neuron-card]] and [[prysm/aip]] cards |
| 48 | 48x48 | 6x6 | large emphasis, [[prysm/hud]] and onboarding |
| 96 | 96x96 | 12x12 | hero display, [[cyb/portal]] welcome screens |

### constraints

- all icons render on transparent background
- color is applied as uniform fill — no multicolor icons (exception: token logos which have fixed brand colors)
- icons snap to pixel grid at their native size — no fractional scaling
- icons are vector (SVG-based) at all sizes except 96px which may include raster detail

## categories

- token logos: [[CYB]], [[HYDROGEN]], [[BOOT]], [[VOLT]], [[AMPERE]], [[BTC]], [[ETH]], [[ATOM]]
- action: search, learn, link, stake, send, receive, delegate
- navigation: home, back, forward, menu, close, expand
- status: success, error, warning, info, loading
- brand: [[cyber]], [[cyb]], [[cyberia]]
- particle type: text, image, video, audio, pdf, 3d

## composition

- [[prysm/ion]] = images + [[prysm/text]] label — the standard icon-text pair
- [[prysm/button]] = images + text + action
- images inside [[prysm/content]] = particle type indicator
