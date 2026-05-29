# prysm

the design system of [[cyb]] — the visual protocol for [[superintelligence]]

a small, formal, complete system. 13 atoms. 24 molecules. 6 foundation specs. every layout provably linear. every color encodes meaning. every value carries its proof

---

## foundations

read in order:

| spec | defines |
|------|---------|
| [[prysm/principles]] | **why** — speed, energy, perfection, gravity |
| [[prysm/composition]] | **what** — the atom → molecule → cell model |
| [[prysm/layout]] | **space** — Π/Φ/K algebra, quantum, fold, gravity (14 theorems, Lean 4 proofs) |
| [[prysm/emotion]] | **color** — the emotion function and the full palette |
| [[prysm/interaction]] | **response** — state machines for every gesture |
| [[prysm/proof]] | **truth** — how [[zheng]] proofs surface in the interface |

six specs. each does one thing. together they generate every pixel in cyb

---

## atoms

13 irreducible primitives across 4 families

**substrate** — geometric presence by dimension

| atom | dim | role |
|------|-----|------|
| `glass` | 2D | translucent membrane — the surface every container is made of |
| `saber` | 1D | line with glow — demarcation, accent, [[cyberlink]] edge |
| `ion` | 0D | luminous point — charge emission, presence, energy |

**particle** — content from the [[cybergraph]], each a distinct rendering pipeline

| atom | content |
|------|---------|
| `text` | language — prose, markdown, inline |
| `image` | raster — PNG, JPG, WebP, GIF (static or auto-animated) |
| `vector` | 2D paths — SVG particles, glyphs (emotion-driven), sigils (brand-fixed) |
| `mesh` | 3D geometry — glTF, scene graph, PBR, skeleton, animation |
| `media` | temporal — video, audio, streams with controllable playhead |
| `code` | formal notation — source code and math. math is code |
| `field` | mathematical field — scalar/vector function over a domain |

**identity** — name-resolved primitives (not CID content)

| atom | identifies |
|------|------------|
| `neuron` | actor — any agent in the graph (bech32) |
| `token` | asset — any tradeable value (symbol + chain) |

**input** — the only atom that accepts keystrokes

| atom | role |
|------|------|
| `entry` | form field — buffer, insertion point, selection |

see [[prysm/atoms]] for every spec

---

## molecules

24 composed widgets with intrinsic shape and behavior. transferable between cells. each declares its fold conformations and emotion bindings. see [[prysm/molecules]]

---

## cells

10 full-screen applications composing molecules for a domain. cells live in [[aos]]

[[cyb/oracle]] · [[cyb/brain]] · [[cyb/portal]] · [[cyberver]] · [[cyb/sense]] · [[cyb/sigma]] · [[teleport]] · [[sphere]] · [[warp]] · [[aos/hfr]]

---

## source tree

```
system/
  specs/     principles, composition, layout, emotion, interaction, proof
  rs/        grid, scrollback, theme, particle
  proofs/    Lean 4 proofs — algebra, container, fold, gravity, multimodal, protocol, sizing

atoms/
  specs/     glass · saber · ion              (substrate, 3)
             text · image · vector · mesh · media · code · field   (particle, 7)
             neuron · token                   (identity, 2)
             entry                            (input, 1)
  rs/        glass, text

molecules/
  specs/     button, toggle, slider, tabs, mind, neuron-card, avatar, address,
             counter, content, display, launcher, adviser, input, filter, table,
             bar, pill, stars, widget, time-widget, graph, brain, menu
  rs/        partial

chroma/
  specs/     grid, ad, ava, sense, sigma, brain, com, time, spacetime, space
             (the concrete top-level cyb screen composition)

rs/
  lib.rs     crate entry — #[path] references to system/rs, atoms/rs, molecules/rs
```

---

## status

13 atoms · 24 molecules · 10 cells · 6 system specs
layout algebra: 14 theorems, Lean 4 proofs, no `sorry`
emotion palette: 9 values, all sources defined
proof layer: surfaced through the verified glyph and inspector

---

*don't trust. don't fear. don't beg.*
