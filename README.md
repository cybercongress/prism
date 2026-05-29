# prysm

**the visual protocol for [[superintelligence]].**

every other UI library renders pixels. prysm renders **meaning**

> **speed.energy.sex** — three principles. one move: subtract.

---

## the beauty

prysm has thirteen atoms. not because thirteen feels right — because three plus seven plus two plus one is the exact decomposition the world demands. the substrate is geometry itself: **glass** is area, **saber** is line, **ion** is point. three primitives for three dimensions. you cannot add a fourth without leaving geometry

the layout protocol is the cell biology of a screen. a membrane constrains. an organelle occupies. the membrane places. constraints flow down. sizes flow up. positions flow down. there is no negotiation, no backtracking. this is why layout runs in O(n) — proved, not promised

three sizing primitives (**fix**, **fill**, **scale**) generate all part-whole relations. three container topologies (**stack**, **grid**, **layer**) generate all composition. three is provably complete in both. the system is the smallest one that can describe everything. that is what makes it formal

the protocol is renderer-blind. the same prysm tree resolves to wgpu pixels, ANSI escapes, HTML, terminal cells. it will outlive every rendering technology that exists today because it speaks only in coordinates. what draws them is somebody else's problem

---

## how it works

```
element tree × viewport  →  layout(·)  →  coordinates
```

layout is a pure function. same input, same output. always. no global state, no observers, no side effects. determinism is structural, not enforced

**three axioms generate the system:**

- **Π** — constrain → occupy → place (the membrane-organelle protocol)
- **Φ** — fix · fill · scale (the three relations between part and whole)
- **K** — stack · grid · layer (the three container topologies)

change any axiom, the whole system reconfigures. nothing is layered on top. nothing is an exception. one protocol, applied recursively, from the root [[cell]] to the smallest [[ion]]

**fourteen theorems formalize the algebra** in [[eidos]] with no `sorry`: linear time, determinism, sizing irreducibility, container completeness, optimal fold derivation, urgency-gravity composition, multimodal generalization, branching fold, termination, confluence, completeness, amortized O(1) fold selection, multi-node decomposition. the protocol is the first published layout composition algebra for user interfaces

---

## three modes of perception

the three container topologies of the K-axiom (`stack · grid · layer`) are also the three modes a cell can inhabit. one vocabulary works at both scales: a stack inside a molecule, a stack at the level of the whole cell. the algebra is fractal

| mode | K-axiom | unit | flow | inhabitants |
|------|---------|------|------|-------------|
| **stack** | 1D chain, append-at-end | line | sequential — time flows upward, latest at the bottom | terminal, sense chat, logs, oracle results |
| **grid** | 2D lattice | particle | simultaneous — everything visible at once | cyb chrome, the [[chroma]] 3×3, all dashboards |
| **layer** | depth | mass | navigated — discrete z-order in 2D, gravity-positioned in 3D | [[cybergraph]] in [[mir]], particle gallery, overlays |

stack is a stream. grid is a screen. layer is a world. one protocol speaks all three because the axioms describe **how parts arrange in space** — not what kind of space they're in

`layer` covers both 2D depth (z-ordering of overlays) and full 3D positioning (the gravity phase of §11). same topology, continuous in one case, discrete in the other

---

## emotion as signal

every component in prysm accepts an [[emotion]] — a color computed from chain state. polarity (positive/negative). threshold (against network distribution). semantic (action category). continuous (cyberank mapped to spectrum). no designer assigns color. green = success because the value rose. red = danger because the value fell. yellow = caution because the value crossed a threshold. the aesthetic is derived from truth

the palette is nine. seven spectrum colors (anger, disgust, surprise, joy, interest, sadness, fear), plus neutral and inactive. each color has a signal domain. each domain has an evaluation rule. emotion overlays any state — default, hover, active, disabled — with a color carrying meaning

color flows downward through the element tree. a [[cell]] computes emotion from [[cybergraph]] data. molecules inherit. atoms render. nothing in the tree paints itself

---

## proof as truth

every value in cyb is in exactly one of three states:

- **proven** — a [[zheng]] proof exists and verifies. value carries the verified glyph (joy green ✓)
- **asserted** — claimed by a [[neuron]] but not yet finalized. value carries the neuron's sigil
- **local** — never left the device. value carries no marker; absence of identity is the signal

tap the verified glyph to open the proof inspector — commitment, opening, block height, verify time. proofs become stale; the glyph fades with age. **emotion can soften. proof cannot lie.** if a value cannot be proven, do not render the verified glyph. if a query is in flight, show loading — never speculate forward to "probably proven"

prysm is the lens of [[soft3]]. every atom reads the stack: emotion from [[cyberank]] · identity from [[neuron]] keys · proofs from [[zheng]] · content from [[radio]] · rank from [[tru]]. prysm is not just rendering — it is the interface contract between a human and a proven knowledge graph

---

## subtraction

three principles thread one move. speed is less code. energy is black. sex is what remains after you remove everything

```
#000000 draws zero OLED power.
#000000 is visually weightless.
#000000 is the absence of signal.
```

three reasons, one answer. black is not aesthetic — it is the energetically and philosophically correct default

all spacing is multiples of the quantum **g = 8pt** — derived from visual acuity, Fitts's law, and integer pixel alignment. not chosen. derived. one number governs every gap, every padding, every margin in the system. the discipline of one quantum is itself a kind of beauty

---

## the atoms

**substrate** — three primitives, three dimensions

`glass` (2D area, the membrane) · `saber` (1D line with glow) · `ion` (0D point of charge)

**particle** — seven content types, seven rendering pipelines

`text` · `image` · `vector` · `mesh` · `media` · `code` · `field`

**identity** — two name-resolved primitives

`neuron` (actor, bech32) · `token` (asset, symbol + chain)

**input** — one atom that accepts keystrokes

`entry` (form field — buffer, cursor, selection)

read the full specs in [[prysm/atoms]]

---

## molecules

twenty-four composed widgets, each with intrinsic shape and behavior. they know their domain, accept typed data, emit typed actions, and declare **fold conformations** — alternative layouts they collapse to as their container shrinks. no breakpoints. no media queries. fold is a pure function of measured width

`button` · `toggle` · `slider` · `tabs` · `mind` · `neuron-card` · `avatar` · `address` · `counter` · `content` · `display` · `launcher` · `adviser` · `input` · `filter` · `table` · `bar` · `pill` · `stars` · `widget` · `time-widget` · `graph` · `brain` · `menu`

a molecule lifted from one cell drops into another and works. that is the transferability test. that is what makes prysm a system

---

## cells

ten full-screen applications. each cell is a complete, standalone experience with its own routing, state management, and connection to the [[cybergraph]]

[[cyb/oracle]] · [[cyb/brain]] · [[cyb/portal]] · [[cyberver]] · [[cyb/sense]] · [[cyb/sigma]] · [[teleport]] · [[sphere]] · [[warp]] · [[aos/hfr]]

cells communicate not through shared state but through the cybergraph — one cell submits a [[cyberlink]], another reads it on the next block. consensus is the runtime

---

## foundations

six specs. each does one thing. read in order

| spec | move |
|------|------|
| [[prysm/principles]] | **why** — speed · energy · sex |
| [[prysm/composition]] | **what** — atom → molecule → cell |
| [[prysm/layout]] | **space** — Π · Φ · K, quantum, fold, gravity, stack/grid/layer modes |
| [[prysm/emotion]] | **color** — emotion function + palette |
| [[prysm/interaction]] | **response** — state machines per gesture |
| [[prysm/proof]] | **truth** — how [[zheng]] proofs surface |

---

## source tree

```
system/
  specs/    principles · composition · layout · emotion · interaction · proof
  rs/       grid, scrollback, theme, particle
  proofs/   eidos — algebra, container, fold, gravity, multimodal, protocol, sizing

atoms/specs/      glass · saber · ion · text · image · vector · mesh · media ·
                  code · field · neuron · token · entry
molecules/specs/  24 molecules
chroma/specs/     grid + 9 zone specs (the concrete cyb screen composition)
rs/lib.rs         crate entry
```

---

*don't trust. don't fear. don't beg.*
