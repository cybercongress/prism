# prysm

**the visual protocol for [[superintelligence]].**

every other UI library renders pixels. prysm renders **meaning**

> **speed.energy.sex** — three principles. one move: subtract.

---

every era of computing had its interface paradigm. desktop had Win32 and Cocoa. web had HTML and CSS. mobile had native UI kits. each defined how humans could see and act, and each treated layout as a heuristic and color as a designer's choice

prysm is the interface paradigm for **proven knowledge**. the [[cybergraph]] is a directed authenticated multigraph where humans, AIs, sensors, and agents link [[knowledge]] into [[cryptographic proof]]. it outlives every rendering technology that exists today. it needs an interface small enough to read in an afternoon, precise enough to prove, and indifferent to which renderer draws it

prysm is that interface. layout is a pure function. color is computed from state. every value carries its provenance. the protocol speaks only in coordinates — what draws them is somebody else's problem

---

## the move

three principles thread one move. **speed is less code** — the fastest path between two states has the fewest instructions. less code also costs less energy. **energy is black** — `#000000` draws zero OLED power, is visually weightless, is the absence of signal. black is also nothing, and nothing is where perfection begins. **sex is what remains after you remove everything** — perfection is achieved not when there is nothing more to add but when there is nothing left to take away

subtract. that is the entire move. the system is small not because we ran out of features but because we removed everything that was not necessary

```
#000000  draws zero OLED power
#000000  is visually weightless
#000000  is the absence of signal
```

three reasons. one answer. black is not aesthetic — it is the energetically and philosophically correct default. all spacing is multiples of the quantum **g = 8pt**, derived from visual acuity, Fitts's law, and integer pixel alignment. one number governs every gap, padding, and margin. the discipline of one quantum is itself a kind of beauty

---

## the protocol

layout is a pure function

```
element tree × viewport  →  layout(·)  →  coordinates
```

same input, same output. always. no global state, no observers, no side effects. determinism is structural, not enforced. three axioms generate the system, and changing any one of them reconfigures the whole

**Π** is the membrane-organelle protocol — constrain → occupy → place. the cell biology of a screen. the membrane defines a boundary. the organelle reports its intrinsic size within that boundary. the membrane positions each organelle in space. information flows one direction: constraints down, sizes up, positions down. no backtracking. this is why layout runs in O(n) — proved, not promised

**Φ** is the sizing axiom — `fix · fill · scale`. three primitives generate every part-whole relation. rigid, elastic, proportional. three is provably complete

**K** is the container axiom — `stack · grid · layer`. three topologies generate every composition. 1D chain, 2D lattice, depth. three is provably complete

fourteen theorems formalize the algebra in [[eidos]] with no `sorry` — linear time, determinism, sizing irreducibility, container completeness, optimal fold derivation, urgency-gravity composition, multimodal generalization, branching fold, termination, confluence, completeness, amortized O(1) fold selection, multi-node decomposition. the first published layout composition algebra for user interfaces

---

## the atoms

thirteen atoms emerge from the protocol — not because thirteen feels right, but because three plus seven plus two plus one is the exact decomposition the world demands

**three substrate atoms** cover three geometric dimensions. `glass` is area. `saber` is line. `ion` is point. you cannot add a fourth without leaving geometry. these are the surfaces, edges, and charges from which everything else is built

**seven particle atoms** cover seven rendering pipelines, each fundamentally different at the GPU level. `text` for language. `image` for raster (including auto-animated GIF, APNG). `vector` for 2D paths (SVG, glyphs, sigils). `mesh` for 3D geometry (glTF, scene graph, PBR, skeleton). `media` for time-based playback (video, audio, streams with controllable playhead). `code` for formal notation — math is code. `field` for scalar/vector functions over a domain — [[cyberank]] is a field

**two identity atoms** cover name-resolved primitives. `neuron` is any actor in the graph — human, AI, sensor, autonomous agent. `token` is any tradeable asset. names, not CIDs

**one input atom** accepts keystrokes. `entry` is the form field. cursor, buffer, selection. nothing else in the system takes keyboard input

thirteen. exactly. you cannot remove one without losing a capability. you cannot add one without violating closure

---

## the composition

atoms compose into **molecules** — twenty-four widgets with intrinsic shape and behavior. shape is part of type identity. a `button` is always a horizontal saber-text-saber arrangement that emits tap. a `table` is always a grid of rows. this is what makes molecules transferable — lift one from `oracle`, drop it in `brain`, it works identically

`button` · `toggle` · `slider` · `tabs` · `mind` · `neuron-card` · `avatar` · `address` · `counter` · `content` · `display` · `launcher` · `adviser` · `input` · `filter` · `table` · `bar` · `pill` · `stars` · `widget` · `time-widget` · `graph` · `brain` · `menu`

each molecule declares its **fold conformations** — alternative layouts it collapses to as its container shrinks. no breakpoints. no media queries. fold is a pure function of measured width

molecules compose into **cells** — ten full-screen applications, each a complete experience with its own routing, state, and connection to the cybergraph. cells share no runtime state. they communicate through the graph — one cell submits a [[cyberlink]], another reads it on the next block. consensus is the runtime

[[cyb/oracle]] · [[cyb/brain]] · [[cyb/portal]] · [[cyberver]] · [[cyb/sense]] · [[cyb/sigma]] · [[teleport]] · [[sphere]] · [[warp]] · [[aos/hfr]]

atom → molecule → cell. three levels, no fourth. the biology is not decoration — atoms are irreducible, molecules carry transferable shape, cells are bounded experiences. the structural relationship of life, compressed into mathematics

---

## three modes of perception

the three container topologies of the K-axiom (`stack · grid · layer`) are also the three modes a cell can inhabit. one vocabulary works at both scales: a stack inside a molecule, a stack at the level of the whole cell. the algebra is fractal

| mode | K-axiom | unit | flow | inhabitants |
|------|---------|------|------|-------------|
| **stack** | 1D chain, append-at-end | line | sequential — time flows upward, latest at the bottom | terminal, sense chat, logs, oracle results |
| **grid** | 2D lattice | particle | simultaneous — everything visible at once | cyb chrome, the [[chroma]] 3×3, all dashboards |
| **layer** | depth | mass | navigated — z-order in 2D, gravity in 3D | [[cybergraph]] in [[mir]], particle gallery, overlays |

stack is a stream. grid is a screen. layer is a world. one protocol speaks all three because the axioms describe **how parts arrange in space** — not what kind of space they're in. `layer` covers both discrete 2D z-ordering and continuous 3D gravity-positioning; same topology, different granularity

---

## emotion as signal

every component in prysm accepts an [[emotion]] — a color computed from chain state. polarity (positive or negative). threshold (against network distribution). semantic (action category). continuous ([[cyberank]] mapped to spectrum). no designer assigns color. green = success because the value rose. red = danger because the value fell. yellow = caution because the value crossed a threshold. the aesthetic is derived from truth

the palette is nine — seven spectrum colors (anger, disgust, surprise, joy, interest, sadness, fear), plus neutral and inactive. each color has a signal domain. each domain has an evaluation rule. emotion overlays any state — default, hover, active, disabled — with a color carrying meaning

color flows downward through the element tree. a cell computes emotion from cybergraph data. molecules inherit. atoms render. nothing in the tree paints itself

---

## proof as truth

every value in cyb is in exactly one of three states. **proven** — a [[zheng]] proof exists and verifies; value carries the verified glyph in joy green. **asserted** — claimed by a [[neuron]] but not yet finalized; value carries the neuron's sigil. **local** — never left the device; value carries no marker, because the absence of identity is the signal

tap the verified glyph to open the proof inspector — commitment, opening, block height, verify time. proofs become stale; the glyph fades with age

**emotion can soften. proof cannot lie.** if a value cannot be proven, do not render the verified glyph. if a query is in flight, show loading. never speculate forward to "probably proven"

---

## the stack

prysm is the visual layer of the [[soft3]] stack — the lens through which the cybergraph becomes perceivable

```
neurons · cells
    ↓
  prysm                              ← this repo
    ↓
soft3 SDK · cybergraph · bbg · zheng · radio · tru
```

every atom reads the stack. emotion from [[cyberank]]. identity from [[neuron]] keys. proofs from [[zheng]]. content from [[radio]]. rank from [[tru]]. prysm is not just rendering — it is the interface contract between a human and a proven knowledge graph

---

## read in order

| spec | move |
|------|------|
| [[prysm/principles]] | **why** — speed · energy · sex |
| [[prysm/composition]] | **what** — atom → molecule → cell |
| [[prysm/layout]] | **space** — Π · Φ · K · quantum · fold · gravity · the three modes |
| [[prysm/emotion]] | **color** — the emotion function + the full palette |
| [[prysm/interaction]] | **response** — state machines per gesture |
| [[prysm/proof]] | **truth** — how [[zheng]] proofs surface in the interface |

```
system/specs/    principles · composition · layout · emotion · interaction
system/rs/       grid, scrollback, theme, particle
proofs/          proof.md + eidos theorems (algebra, container, fold, gravity,
                 multimodal, protocol, sizing)
atoms/specs/     glass · saber · ion · text · image · vector · mesh · media ·
                 code · field · neuron · token · entry
molecules/specs/ 24 molecules
chroma/specs/    grid + 9 zone specs (the concrete cyb screen composition)
rs/lib.rs        crate entry
```

---

*don't trust. don't fear. don't beg.*
