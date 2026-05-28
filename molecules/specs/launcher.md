---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

cell launcher molecule in [[prysm]]

the [[cell]] icon in the top-left corner of [[prysm/grid]] (inside [[prysm/context]] zone). by default shows the active cell icon. tap opens a dropdown menu listing available cells — each item is an icon + text label. menu extends down from the icon, max length to the middle of the screen

## protocol role

launcher is a molecule in the element tree $\mathcal{T}$. lives inside [[prysm/context]] zone. the icon is always visible. the menu is an overlay at $\mathcal{U} = 30$ (interrupting)

## sizing

| element | sizing |
|---------|--------|
| icon (collapsed) | fix($4g$) × fix($4g$) |
| menu (expanded) | fix($25g$) × auto, max height = $\square_h / 2$ |

$s_{min} = (4g, 4g)$ — icon only

## structure

collapsed (default):
```
ion [4g, active cell icon]
```

expanded (on tap):
```
glass [fix(25g) × auto, depth foreground, max height square_h/2, overflow scroll]
  stack vertical [gap g/2]
    stack horizontal [gap g]
      ion [2g, oracle icon]
      text [body, "Oracle"]
    stack horizontal [gap g]
      ion [2g, brain icon]
      text [body, "Brain"]
    stack horizontal [gap g]
      ion [2g, portal icon]
      text [body, "Portal"]
    stack horizontal [gap g]
      ion [2g, sense icon]
      text [body, "Sense"]
    stack horizontal [gap g]
      ion [2g, sigma icon]
      text [body, "Sigma"]
    ...
```

## fold

launcher does not fold — icon is always $4g$ × $4g$. menu appears/disappears, does not fold

## emotion

active cell icon can carry [[emotion]] reflecting the cell's state (e.g. sense icon glows when unread messages). inactive items in menu are neutral

## states

| state | visual | trigger |
|-------|--------|---------|
| collapsed | icon only | default |
| expanded | menu drops down from icon | tap on icon |
| hover (menu item) | item text brightens | pointer over item |
| active (menu item) | navigate to selected cell | tap on item |

state transitions: menu slide down $150\text{ms}$ ease

## interaction

- tap icon → toggle menu (expand/collapse)
- tap menu item → navigate to that [[cell]], menu closes
- tap outside menu → close menu
- active cell is highlighted in menu list

## where in [[prysm/grid]]

inside [[prysm/context]] zone (row 1, col 1). icon is part of context. menu is overlay at z: 30, drops down from context zone

## 3D

icon renders at frame $p_z$ ($\mathcal{U} = 10$). menu renders at interrupting $p_z$ ($\mathcal{U} = 30$) — closer to neuron than frame

## ECS

- Entity: launcher organelle
- Components:
  - `Sizing { width: Fix(4), height: Fix(4) }` — icon
  - `CellList { list of (cell_id, icon, label) }` — available cells
  - `ActiveCell { cell_id }` — currently active
  - `Visibility { collapsed | expanded }` — menu state
  - `Emotion { color }` — from active cell state
- Systems:
  - `LauncherSystem` handles tap to toggle, tap on item to navigate
  - `LauncherEmotionSystem` reads cell states, writes icon emotion
