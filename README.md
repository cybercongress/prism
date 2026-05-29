# prysm

the design system of [[cyb]] — a visual language for interfacing with [[superintelligence]]

every screen in [[cyb]] is a composition of prysm components. the system defines how humans perceive, navigate, and interact with the [[cybergraph]]

## first principles

- the interface is a lens — [[cyb]] refracts the [[cybergraph]] into something a human can perceive and act on
- emotion as signal — components carry [[emotion]], a color-coded signal layer computed from [[cyberank]], [[karma]], and context
- everything is a [[particle]] — text, image, video, audio, pdf, 3d model. the renderer adapts, the interface stays consistent
- the [[neuron]] is the user — every action traces to a neuron, every view is from a neuron's perspective
- glass as medium — translucent panes that layer and compose, defining spatial hierarchy

---

## composition model

three levels, each built from the previous:

```
atoms → molecules → cells
```

---

### atoms

atoms are **modalities** — irreducible capability carriers. an atom has exactly one capability and no domain knowledge. it accepts data and emotion, renders a visual, and emits events.

twelve atoms in four families:

**substrate** — define the visual substrate. three geometric primitives covering all dimensions:

| atom | dimension | capability |
|------|-----------|------------|
| `glass` | 2D area | translucent surface — the membrane of the layout protocol |
| `saber` | 1D line | demarcation, boundary, accent with glow |
| `ion` | 0D point | luminous charge — energy emission, presence indicator |

**particle** — render content from the [[cybergraph]]. each type is a distinct rendering pipeline:

| atom | capability |
|------|------------|
| `text` | language — prose, markdown, inline code |
| `image` | raster visual — PNG, JPG, WebP, GIF (static or auto-animated) |
| `vector` | 2D paths — SVG particles, glyphs (monochrome/emotion-driven), sigils (brand-fixed) |
| `mesh` | 3D geometry — glTF, scene graph, PBR materials, skeleton, animation |
| `media` | temporal — video, audio, streams. has a playhead the neuron controls |
| `code` | formal notation — source code and math (LaTeX). math is code |

**identity** — name-resolved primitives. not CID-addressed content but system-meaningful names:

| atom | capability |
|------|------------|
| `neuron` | actor identity — any agent in the graph (human, AI, sensor). renders as bech32 address |
| `token` | asset identity — any tradeable asset. renders as sigil + symbol |

**interaction** — the input primitive:

| atom | capability |
|------|------------|
| `field` | editable buffer — cursor, selection, keyboard. the only atom that accepts keystrokes |

---

### molecules

a molecule is **a composition of atoms with intrinsic shape and behavior**. the shape is part of the type identity — that is why molecules are transferable. a `button` is always a horizontal saber-text-saber arrangement that emits a tap event. a `table` is always a grid arrangement of rows. the arrangement geometry is not a layout concern applied from outside — it is what makes a button a button and a table a table.

molecules know their domain. they understand what a neuron is, what a particle looks like, what a cyberlink means. they accept typed data, emit typed actions, and carry fold conformations (see [[prysm/responsive]]).

`neuron-card` wraps the `neuron` atom into a molecule with identity display behavior. `avatar` wraps `neuron` with chooser behavior. the atom carries identity; the molecule carries the composed shape and interaction.

molecules by role:

**actions** — how you interact:
`button` · `toggle` · `slider`

**navigation** — how you move:
`tabs` · `mind` (commander)

**identity** — how you read actors:
`neuron-card` · `avatar` · `address` · `counter`

**content display** — how you see data:
`content` · `display` · `launcher` · `adviser`

**input and refinement** — how you enter and filter:
`input` · `filter`

**data** — how you read structured information:
`table` · `bar`

**classification** — how you tag and sort:
`pill`

**ambient** — persistent contextual presence:
`stars` · `widget` · `time-widget` · `graph` · `brain` · `menu`

---

### cells

a cell is a full-screen application — the top-level unit of the ecosystem. it composes molecules into a coherent experience with its own routing, state management, and connection to the [[cybergraph]]. oracle arranges a search input, content feed, and cell launcher into a discovery flow. brain arranges a graph navigator with a particle viewer. each cell is a complete, standalone experience.

cells live in [[aos]].

[[cyb/oracle]] · [[cyb/brain]] · [[cyb/portal]] · [[cyberver]] · [[cyb/sense]] · [[cyb/sigma]] · [[teleport]] · [[sphere]] · [[warp]] · [[aos/hfr]]

---

## system

### layout

the layout protocol is defined in [[prysm/layout]]. three axioms generate the entire system:

- **Π** — constrain → occupy → place (the membrane-organelle protocol)
- **Φ** — `fix | fill | scale` (the only three relations between part and whole)
- **K** — `stack | grid | layer` (1D chain, 2D lattice, depth)

all sizes are multiples of **g = 8px** — the spatial quantum.

`glass` is the membrane. every container is glass. organelles occupy space within glass. the element tree is glass all the way down.

arrangement geometry is inherent to molecule type, not applied from outside. `table` is a grid. `tabs` is a horizontal chain. `mind` is a bottom bar. the layout protocol resolves coordinates; molecule types declare their topology.

### fold

every molecule declares conformations — layouts it can collapse to based on the container's measured width:

```
l₁  w ≥ 40g   full
l₂  w ≥ 20g   compact
l₃  w ≥ 10g   minimal
```

fold conformations are renderer-side decisions — they are not part of molecule type identity. the type says what the molecule is; the active conformation says how it fits the space it has been given.

### emotion

emotion is an ambient computed signal — 9 values: 7 spectrum colors (anger→red, disgust→orange, surprise→yellow, joy→green, interest→blue, sadness→indigo, fear→violet) plus neutral and inactive. flows down the component tree from [[cyberank]], [[karma]], and context state. no component sets emotion manually. it drives glass tint, saber glow, and text color.

see [[prysm/emotion]] and [[prysm/palette]].

---

## interfaces

every component exposes:

- **inputs**: data, emotion, context
- **outputs**: action, state change, [[cyberlink]]
- **states**: default · hover · active · disabled (+ loading · error · empty · expanded for stateful components)

emotion overlays any state with a color signal.

---

## source tree

```
system/
  specs/     layout, grid, palette, emotion, responsive, interaction
  rs/        grid, scrollback, theme, particle
  proofs/    algebra, container, fold, gravity, multimodal, protocol, sizing

atoms/
  specs/     glass, saber, ion, text, image, vector, mesh, media, code, neuron, token, field
  rs/        glass, text

molecules/
  specs/     button, toggle, slider, tabs, mind, neuron-card, avatar, address,
             counter, content, display, launcher, adviser, input, filter, table,
             bar, pill, stars, widget, time-widget, graph, brain, menu
  rs/        button, input, mind, table, neuron, progress, log, action, status

chroma/
  specs/     chroma (3×3 grid), space, ad, ava, sense, sigma, brain, com, time, spacetime

rs/
  lib.rs     crate entry — #[path] references to system/rs, atoms/rs, molecules/rs
```

---

## status

12 atoms (4 families: substrate, particle, identity, interaction). 24 molecules. 10 cells in [[aos]].
system: layout algebra (14 theorems, Lean 4 proofs), emotion palette, fold protocol.

---

*don't trust. don't fear. don't beg.*
