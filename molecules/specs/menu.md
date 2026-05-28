---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

slide-out navigation molecule in [[prysm]]

a panel that slides from the screen edge on tap. two instances: menu context (from left, triggered by [[prysm/context]]) and menu avatar (from right, triggered by [[prysm/avatar]]). contains navigation items for the current view or account

## protocol role

menu is an overlay molecule — it is not part of the main grid. it belongs to the root layer at $\mathcal{U} = 30$ (interrupting). when closed: not in the element tree. when open: appended to root layer

## sizing

| viewport | sizing | side |
|----------|--------|------|
| desktop | fix($25g$) × fill($\square_h$) | left (context) or right (avatar) |
| mobile ($\square_w \leq 96g$) | fix($35g$) × fill($\square_h$) | left or right |

$s_{min} = (25g, \square_h)$ — menu does not fold. it is full-height

## structure

```
glass [fix(25g) × fill, depth foreground, slide from edge]
  stack vertical [gap g]
    ion + text [navigation item 1]
    ion + text [navigation item 2]
    saber [horizontal, separator]
    ion + text [navigation item 3]
    ...
```

## variants

| variant | trigger | slide from | content |
|---------|---------|-----------|---------|
| menu context | tap [[prysm/context]] | left edge | settings and contextual navigation for current view. on mobile: includes [[prysm/graph]] |
| menu avatar | tap [[prysm/avatar]] | right edge | account switching, identity settings |

## states

| state | visual |
|-------|--------|
| closed | not rendered. $\text{transform: translateX}(-100\%)$ (left) or $\text{translateX}(100\%)$ (right) |
| open | rendered at z: 30. slide animation $150\text{ms}$ ease |

## where in [[prysm/grid]]

not in grid — overlay at z: 30. covers space zone when open

## ECS

- Entity: menu organelle
- Components:
  - `Sizing { width: Fix(25), height: Fill }`
  - `SlideOverlay { side: left | right }`
  - `Visibility { open | closed }`
  - `Trigger::Tap { source: context | avatar }`
  - `MenuItems { list of (icon, label, action) }`
- System: `MenuSystem` reads `Trigger`, toggles `Visibility`, animates slide
