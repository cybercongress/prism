---
tags: prysm, cyb, chroma
alias: map
crystal-type: pattern
crystal-domain: cyber
---

map chrome — bottom-left

**map**: graph file manager. knowledge navigation — browse [[particles]], traverse [[cyberlinks]], explore the [[cybergraph]] neighborhood. the spatial memory of the [[neuron]]

also the graph visualization molecule: renders [[particles]] as circles, [[cyberlinks]] as lines. shared between [[cyb/oracle]] (global graph) and [[robot]] (neuron's personal graph)

## protocol role

molecule in the element tree $\mathcal{T}$. in chrome: bottom-left grid zone. as spacetime cell: lives inside oracle-cell and robot-cell brain sub-pages, fills the space zone

## core function

brain is the graph file manager. offline-first. core [[cell]] of [[cyb]].

## cyberlinks

| receives from | token | meaning |
|---------------|-------|---------|
| com | navigate | open path or CID in brain |
| spacetime | locate | sync navigation to active world |

| sends to | token | meaning |
|----------|-------|---------|
| brain | map | graph navigation self-feed |
| spacetime | switch-renderer | open brain in space zone |
| com | context | current path for command palette |

## features (file manager)

- [[cyb/offline]] first
- localhost interface
- renders: [[space]] (3D), [[shadow]] (depth), [[heap]] (2D map), [[list]] (table)
- graph query language: [[datalog]] / full [[cozodb]] api
- scripting: [[rune]]
- static and dynamic [[linking]], private and public [[linking]]
- publishing to [[ipfs]] and [[cybergraph]]
- particle formats: text, video, audio, image, pdf, epub, web2

## paths

- `#` [[cyb/brain/particle]]
- `!` [[cyb/brain/neuron]]
- `@` [[cyb/brain/avatar]]
- `~` [[cyb/brain/learn]]
- `/` [[cyb/brain/root]]

## graph visualization (molecule)

renders the [[cybergraph]] as visual space — particles as circles, cyberlinks as lines

### sizing

fill × fill. $s_{min} = (20g, 20g)$

### structure

```
glass [fill × fill, depth background]
  tabs [3d graph | 2d graph | last cyberlinks]
  text [caption, "Limit is: 500"]
  --- render area ---
```

### tabs

**3d graph** — interactive 3D. particles = blue spheres. cyberlinks = green lines. camera orbits. starfield background. commander: "Change limit" + fullscreen toggle

**2d graph** — force-directed 2D. particles = blue circles (size = focus). cyberlinks = green lines. draggable, zoomable. commander: "select 2 particles" + "Change limit" + fullscreen toggle

**last cyberlinks** — most recent cyberlinks as particle pairs side by side

```
glass [fill × fill, depth background, overflow scroll]
  stack horizontal [gap 2g, wrap]
    glass [fix(20g) × auto, depth midground] — source particle
    glass [fix(20g) × auto, depth midground] — target particle
```

### fullscreen

tap fullscreen → brain covers entire viewport, all grid zones hidden. only render + minimal commander visible

### context

| context | what renders |
|---------|-------------|
| oracle brain | global cybergraph — all neurons' links |
| robot brain | personal graph — this neuron's links only |

### emotion

- particles: blue
- cyberlinks: green (#00fe00)
- selected particle: highlighted, connected links brighten
- starfield: ambient white dots

### states

| state | visual | trigger |
|-------|--------|---------|
| loading | "loading..." | fetching graph data |
| rendered | particles + links visible | data loaded |
| selecting | highlight mode — "select 2 particles" | commander prompt |
| fullscreen | chrome hidden, graph fills viewport | fullscreen toggle |

### interaction

- 3d: orbit (drag), zoom (scroll)
- 2d: pan (drag), zoom (scroll), tap particle → navigate
- select 2 particles → create cyberlink
- Change limit → input + Confirm in commander

## 3D

brain IS the 3D view. gravity from [[tri-kernel]] determines particle positions — high-focus particles near center

## ECS

- Entity: brain organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `BrainTab { graph_3d | graph_2d | last_cyberlinks }`
  - `BrainContext { oracle | robot }`
  - `RenderLimit { count }`
  - `Fullscreen { bool }`
  - `SelectedParticles { list of particle, max 2 }`
- Systems:
  - `BrainFetchSystem` fetches graph data within limit
  - `BrainRender3dSystem` renders 3D scene
  - `BrainRender2dSystem` renders 2D force-directed layout
  - `BrainCyberlinkSystem` handles particle selection + cyberlink creation
