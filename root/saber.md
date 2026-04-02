---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

accent line and divider atom in [[prysm]]

a thin luminous line. separates, accents, and frames. carries [[emotion]] color through glow

## parameters

| parameter | type | values | default |
|-----------|------|--------|---------|
| orientation | enum | vertical, horizontal | vertical |
| weight | px | 1, 2 | 1 |
| length | px | any (snaps to 8px grid) | fills parent |
| color | hex | #ffffff | #ffffff |
| glow-color | hex | any [[emotion]] hex, none | none |
| glow-spread | px | 0, 12, 24 | 0 |
| glow-direction | enum | inward, outward, both | inward |

## where it appears

### as button frame

- orientation: vertical
- weight: 2px
- glow-color: #00fe00 (green) or [[emotion]] of the action
- glow-spread: 24px
- glow-direction: inward (toward button center)
- position: left and right edges of [[prysm/button]]

### as table row separator

- orientation: horizontal
- weight: 1px
- glow: none
- position: between rows in [[prysm/table]], full width of the table

### as hud frame

- orientation: vertical and horizontal
- weight: 2px
- glow-color: #00fe00
- glow-spread: 12px
- glow-direction: outward (away from content)
- position: borders between [[prysm/hud]] zones (sidebar edges, top bar bottom edge)

### as bar accent

- orientation: vertical
- weight: 2px
- glow: none
- position: left or right edge of [[prysm/bar]], paired with [[prysm/ion]]

### as content divider

- orientation: horizontal
- weight: 1px
- glow: none
- position: between content sections inside [[prysm/display]], full width minus padding

### as timeline spine

- orientation: vertical
- weight: 1px
- glow: none
- position: center of [[prysm/time-widget]], events attach to left and right

## mobile

same parameters. no changes — saber is identical on desktop and mobile
