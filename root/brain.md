---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

graph visualization molecule in [[prysm]]

renders the [[cybergraph]] as visual space — [[particles]] as circles, [[cyberlinks]] as lines. shared between [[cyb/oracle]] (global graph) and robot (neuron's personal graph). the primary way to SEE knowledge structure

## protocol role

molecule in the element tree $\mathcal{T}$. lives inside oracle-cell (brain sub-page) and robot-cell (brain sub-page). fills the space zone

## sizing

fill × fill

$s_{min} = (20g, 20g)$

## structure

```
glass [fill × fill, depth background]
  tabs [3d graph | 2d graph | last cyberlinks]
  text [caption, "Limit is: 500"]
  --- render area ---
  (depends on active tab)
```

## tabs

### 3d graph

interactive 3D visualization. particles = blue spheres. cyberlinks = green lines. camera orbits around the graph. starfield background

```
glass [fill × fill, depth background, black]
  3d render [particles as spheres, cyberlinks as lines]
```

commander shows "Change limit" + fullscreen toggle

### 2d graph

force-directed 2D layout. particles = blue circles (size = focus). cyberlinks = green lines. draggable, zoomable

```
glass [fill × fill, depth background, black]
  2d render [particles as circles, cyberlinks as lines]
```

commander shows "select 2 particles" + "Change limit" + fullscreen toggle

### last cyberlinks

most recent cyberlinks as particle pairs — source and target side by side

```
glass [fill × fill, depth background, overflow scroll]
  stack horizontal [gap 2g, wrap]
    glass [fix(20g) × auto, depth midground] — per cyberlink
      content [source particle preview]
    glass [fix(20g) × auto, depth midground]
      content [target particle preview]
```

## fullscreen

tap fullscreen icon → brain expands to cover entire viewport. all grid zones (context, avatar, stars, graph, time, commander) hidden. only brain render + minimal commander (Change limit, exit fullscreen) visible. starfield background fills screen

## context

| context | what renders | adviser message |
|---------|-------------|-----------------|
| oracle brain | global cybergraph — all neurons' links | "neuron public knowledge cybergraph" |
| robot brain | personal graph — this neuron's links only | "neuron public knowledge cybergraph" |

limit parameter controls how many particles render (default 500, adjustable via commander "Change limit" → input field with "10 000" + "Confirm")

## fold

brain does not fold — it always fills available space. on mobile: 2d graph as default (3d less usable on small screens)

## emotion

- particles: blue (default)
- cyberlinks: green (#00fe00)
- selected particle: highlighted, connected links brighten
- starfield: ambient white dots

## states

| state | visual | trigger |
|-------|--------|---------|
| loading | "loading..." or skeleton | fetching graph data |
| rendered | particles + links visible | data loaded |
| selecting | "select 2 particles" — highlight mode | commander prompt |
| fullscreen | all chrome hidden, graph fills viewport | fullscreen toggle |
| limit change | commander shows input + Confirm | "Change limit" tap |

## interaction

- 3d: orbit camera (drag), zoom (scroll)
- 2d: pan (drag), zoom (scroll), tap particle → navigate to particle
- select 2 particles → create cyberlink between them
- Change limit → adjust render count
- fullscreen → immersive view

## 3D

brain IS the 3D view. in 3d graph tab, particles render in actual 3D space with camera controls. gravity from [[tri-kernel]] determines particle positions — high-focus particles near center

## ECS

- Entity: brain organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `BrainTab { graph_3d | graph_2d | last_cyberlinks }`
  - `BrainContext { oracle | robot }` — determines which graph to render
  - `RenderLimit { count }` — how many particles
  - `Fullscreen { bool }`
  - `SelectedParticles { list of particle, max 2 }` — for cyberlink creation
- Systems:
  - `BrainFetchSystem` fetches graph data within limit
  - `BrainRender3dSystem` renders 3D scene (Bevy 3D)
  - `BrainRender2dSystem` renders 2D force-directed layout
  - `BrainCyberlinkSystem` handles particle selection + cyberlink creation
