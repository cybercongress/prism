---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

icon library in [[prysm]]

the complete set of glyphs available to [[prysm/ion]]. every glyph has a semantic meaning tied to a [[cybergraph]] concept. images is not an organelle — it is a catalog. [[prysm/ion]] references glyphs from this catalog by name

## glyph sizes

all values in spatial quanta $g$. glyphs are square vectors rendered at fixed sizes

| size | use |
|------|-----|
| $2g$ | inline with body text. default for [[prysm/ion]] |
| $5g/2$ | standalone small |
| $4g$ | medium emphasis |
| $6g$ | large emphasis |
| $12g$ | hero display |

## rendering

- all glyphs render on transparent background
- color applied as uniform fill — no multicolor (exception: token logos with fixed brand colors)
- glyphs snap to $g$ grid — no fractional scaling
- glyphs are vector (SVG-based paths) at all sizes

## categories

| category | glyphs | use |
|----------|--------|-----|
| token logos | [[CYB]], [[HYDROGEN]], [[BOOT]], [[VOLT]], [[AMPERE]], [[BTC]], [[ETH]], [[ATOM]] | [[cyb/sigma]], token displays |
| action | search, learn, link, stake, send, receive, delegate | commander, buttons |
| navigation | home, back, forward, menu, close, expand | context menu, avatar menu |
| status | success, error, warning, info, loading | adviser, space |
| brand | [[cyber]], [[cyb]], [[cyberia]] | context zone |
| particle type | text, image, video, audio, pdf, 3d | space: content type indicator |

## relation to other atoms

images is the catalog. [[prysm/ion]] is the organelle that renders a glyph from this catalog at a specific size. ion references images by name. images does not participate in the layout protocol — ion does
