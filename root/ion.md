---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

icon-label pair atom in [[prysm]]

the most versatile structural atom. combines a [[prysm/images]] glyph with a [[prysm/text]] label into a single semantic unit. used everywhere a concept needs both visual and textual representation

## parameters

| parameter | values | default |
|-----------|--------|---------|
| icon | [[prysm/images]] glyph name | — (required) |
| icon-size | 16, 20, 32, 48 px | 16 |
| label | text string | — (optional) |
| label-size | body (16px), caption (14px), micro (12px) | caption (14px) |
| layout | centric, horizontal, input, star, trapezoid, vertical | horizontal |
| gap | 4, 8 px | 4 |
| color | any hex from palette | #ffffff |
| [[emotion]] | overrides color for both icon and label | none |

### layouts

| layout | arrangement | icon-label gap | use |
|--------|-------------|---------------|-----|
| centric | icon above, label below, center-aligned | 4px | [[prysm/tabs]], grid navigation |
| horizontal | icon left, label right | 8px | inline items, default layout |
| input | icon inside field, label as placeholder | 4px | [[prysm/input]] fields |
| star | icon centered, label as tooltip on hover | 0 (tooltip offset) | compact actions |
| trapezoid | angled layout, distinctive shape | 4px | [[prysm/hud]] navigation |
| vertical | label above, icon below | 4px | stat displays |

### constraints

- icon and label always share the same [[emotion]] color — they are one unit
- when label is omitted, ion renders as icon-only (icon-size becomes the element size)
- touch target: min 32x32 px regardless of visual size (padding added as needed)

## variants

- centric, horizontal, input, star, trapezoid, vertical (see layouts table)

## composition

- ion is the building block of [[prysm/tabs]] — each tab is an ion in centric layout
- ion inside [[prysm/bar]] = labeled toolbar action
- ion inside [[prysm/button]] = icon-enhanced call-to-action
- ion + [[prysm/saber]] = the [[prysm/bar]] molecule
- ion inside [[prysm/content]] = formatted metadata field
