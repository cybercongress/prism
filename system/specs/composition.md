---
tags: prysm, cyb, core
crystal-type: pattern
crystal-domain: cyber
---

the composition model of [[prysm]]

prysm is built from three levels, each constructed from the previous. this page defines what each level is, what it knows, what it must expose, and the rules that govern composition between levels

```
atom  →  molecule  →  cell
```

three levels. no more. no intermediate "section" or "panel" or "view." every visual artifact in [[cyb]] decomposes into exactly these three. the system is closed

---

## atom

an atom is an **irreducible capability carrier**. one capability. no domain knowledge. it accepts data and [[emotion]], renders a visual, and emits events

an atom does not know:
- what a [[neuron]] is (the `neuron` atom knows only bech32 formatting)
- what a [[particle]] represents (the `image` atom knows only how to render raster pixels)
- what a [[cyberlink]] means (no atom knows this)
- what cell it lives in

an atom does know:
- its size in quanta $g$
- its [[emotion]] color
- its rendering pipeline
- its leaf type in the element tree $\mathcal{T}$

atoms are organized in four families. see [[prysm/atoms]] for the full list

### atom contract

| input | output |
|-------|--------|
| `data` — typed payload (string, CID, value) | rendered surface |
| `emotion` — color from the [[emotion]] system | events (tap, drag, focus, blur) |
| `constraint c` — from membrane (§4.1 of [[prysm/layout]]) | `size s` — to membrane (§4.2 of [[prysm/layout]]) |

every atom is a leaf in $\mathcal{T}$. atoms have no sub-organelles

---

## molecule

a molecule is **a composition of atoms with intrinsic shape and behavior**

the shape is part of the type identity. a `button` is always a horizontal saber-text-saber arrangement that emits tap. a `table` is always a grid of rows. a `toggle` is always a glass track with a glass thumb. the arrangement geometry is not a layout decision applied from outside — it is what makes a button a button

molecules know their domain. they understand:
- what a [[neuron]] address is, how to truncate it, when to show the verified glyph
- what a [[particle]] is, how to dispatch to the right atom by content type
- what a [[cyberlink]] looks like (the `graph` molecule renders directed edges with weight)
- what their input contract is and how to validate it

molecules accept typed data, emit typed actions, and declare **fold conformations** — alternative layouts they collapse to as their container shrinks. see §4.3 of [[prysm/layout]]

### molecule contract

| input | output |
|-------|--------|
| `data` — typed structure for the molecule's domain | rendered tree of atoms |
| `emotion` — inherited from cell, may be recomputed | typed actions (submit, navigate, select) |
| `constraint c` from cell | `size s` (chosen conformation) to cell |
| `fold set` $\mathcal{F}$ | active conformation $l_k \in \mathcal{F}$ |

molecules are **transferable**. the `neuron-card` in oracle is the same molecule as the `neuron-card` in brain. molecules carry no cell-specific code

see [[prysm/molecules]] for the full catalog

---

## cell

a cell is **a full-screen application** — the top-level unit of the cyb ecosystem

a cell knows:
- its [[cybergraph]] domain (oracle queries the rank field, sigma queries token balances, brain queries the graph topology)
- its data sources (which RPCs, which subscriptions)
- its routing (which sub-paths it owns under `cyb://app/<cell>/`)
- its state management (how it caches, when it invalidates)
- how to compute [[emotion]] from chain state and pass it down to molecules

a cell composes molecules. it does not compose atoms directly — that is the molecule's job. if a cell needs a new atom arrangement, that arrangement IS a molecule, and graduates to [[prysm/molecules]]

each cell is a complete, standalone experience. cells share no runtime state. communication between cells happens through the cybergraph: one cell submits a [[cyberlink]], another reads it on the next block

### cell contract

| input | output |
|-------|--------|
| viewport $\square$ | rendered molecule tree |
| chain state (via [[soft3]]) | [[cyberlink]] submissions |
| neuron identity (keys) | navigation events (back/forward, deep links) |
| route path | [[emotion]] computed and propagated down |

see [[aos]] for the cell catalog

---

## the composition tree

every cyb screen is a single element tree $\mathcal{T}$:

```
cell                              ← root
├── molecule (mind/commander)     ← always present
├── molecule (tabs)
│   ├── atom (text)
│   ├── atom (vector)
│   └── atom (saber)
├── molecule (table)
│   ├── molecule (neuron-card)
│   │   ├── atom (neuron)
│   │   ├── atom (vector)
│   │   └── atom (text)
│   └── molecule (pill) × n
└── molecule (graph)
    └── atom (saber) × m            ← cyberlinks
```

the tree has exactly three layer types: cell at the root, molecules in the interior, atoms at the leaves. no other depth. no atoms-inside-cells (must go through molecules). no molecules-inside-atoms

---

## interfaces

every component at every level exposes the same shape:

| facet | content |
|-------|---------|
| inputs | data, emotion, context (constraint, route, neuron) |
| outputs | action, state change, [[cyberlink]] |
| states | default · hover · active · disabled (+ loading · error · empty · expanded where stateful) |

[[emotion]] overlays any state with a color signal computed by the [[emotion]] function

---

## transferability

molecules are pure functions of their props. lift a molecule from oracle, drop it in brain — it works identically, because:

- molecules know no cell-specific data
- molecules carry no cell-specific styling (style flows from [[emotion]] + [[palette]])
- molecules accept all data through props, never reach into a global store

this is what makes prysm a **system**, not a collection of widgets

---

## what does not exist

these are not levels in the prysm composition model:

- **section** — a section is just a stack-container molecule
- **panel** — a panel is just a glass-wrapped molecule
- **page** — a page is just a cell at a route
- **screen** — a screen is just the viewport projection of a cell
- **layout** — layout is the protocol, not a level (see [[prysm/layout]])
- **template** — every cell IS the template; composition handles variation

three levels generate everything. adding a fourth multiplies complexity without adding capability. the discipline of three is itself a design decision

---

*the closure of the system is the proof of its completeness*
