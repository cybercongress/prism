---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
stake: 17032782338000614
diffusion: 0.00019031384281013565
springs: 0.00029604029867803816
heat: 0.0002799153101315369
focus: 0.00023995207303479366
gravity: 2
density: 3.32
---
the foundational surface atom in [[prysm]]

translucent pane that contains other components. all composition in [[cyb]] happens on glass

## parameters

| parameter | values | default |
|-----------|--------|---------|
| width | any, snaps to 8px grid | parent width |
| height | any, snaps to 8px grid | content height |
| depth | foreground, midground, background | midground |
| tint | any [[emotion]] color or none | none |
| edge | visible, hidden | hidden |
| corner-radius | 0, 4, 8, 16 px | 0 |

### depth levels

| depth | opacity | blur | z-index | use |
|-------|---------|------|---------|-----|
| foreground | 0.70 | 0px | top | modals, dropdowns, tooltips |
| midground | 0.38 | 4px | middle | cards, sections, panels |
| background | 0.15 | 8px | bottom | page-level containers |
| subtle | 0.07 | 12px | lowest | ambient regions |

### constraints

- max nesting depth: 3 (glass inside glass inside glass). deeper nesting loses visual clarity
- min size: 24x24 px
- padding: 8, 16, or 24 px (inner content offset from edge)
- tint color applied as overlay at 15% opacity on the glass surface
- on mobile: max nesting depth 2

## variants

- plane — flat surface, standard container
- side-button — surface with an attached action trigger on the edge, 32px wide

## composition

- glass is the only surface atom. every [[prysm/hud]], [[prysm/display]], and [[prysm/aip]] sits on glass
- glass panes nest: a card (glass) inside a section (glass) inside a screen (glass)
