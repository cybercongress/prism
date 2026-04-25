---
tags: prysm, cyb, article, core
crystal-type: pattern
crystal-domain: cyber
crystal-size: deep
---

# prysm layout protocol

a formal spatial composition system for the interface of [[superintelligence]]

---

## 0. abstract

this paper defines a universal layout protocol for spatial composition of knowledge graphs. the protocol is a pure function that takes an element tree and a viewport size and produces exact coordinates for every element. it is built from three axioms: a membrane-organelle protocol ($\Pi$: constrain → occupy → place), three sizing primitives ($\Phi$: fix, fill, scale corresponding to three relations between part and whole — independence, complement, similarity), and three container topologies ($\mathcal{K}$: stack, grid, layer corresponding to 1D chain, 2D lattice, and depth). all sizes are expressed in quanta of a spatial quantum $g$, making the protocol renderer-independent. Theorem 1 proves $\mathcal{O}(n)$ time complexity. Theorem 2 proves determinism by structural induction. Theorem 3 proves each sizing primitive is irreducible. the protocol is validated by [[cyb]] at cyb.ai. no published layout composition algebra for UI exists — this paper is a first attempt

---

## 1. the problem

the [[cybergraph]] is a directed authenticated multigraph where [[neurons]] — humans, AIs, sensors, agents, autonomous systems — link [[particles]] into [[knowledge]]. the structural record is append-only. the active computation evolves through the [[tri-kernel]]. this graph will outlive every rendering technology that exists today

this graph needs a spatial protocol with four properties:

- **renderer-independent** — outputs coordinates, not instructions for a specific engine. the same protocol feeds any renderer that can draw rectangles
- **deterministic** — same tree + same viewport → same coordinates. provably, not by convention
- **linear time** — layout completes in $\mathcal{O}(n)$ where $n$ is the organelle count. provably, not by claim
- **formally specified** — every rule has a formula. every property has a proof or is honestly marked as conjecture

no published layout composition algebra exists for UI. this paper defines one from three axioms

---

## 2. notation

| symbol | meaning |
|--------|---------|
| $\Pi$ | the membrane-organelle protocol (constrain → occupy → place) |
| $\Phi$ | the set of sizing primitives: {fix, fill, scale} |
| $\mathcal{K}$ | the set of container types: {stack, grid, layer} |
| $g$ | the spatial quantum |
| $\mathcal{T}$ | element tree — hierarchy of membranes (containers), organelles (elements), and leaves (terminal organelles with no sub-organelles). input to layout function |
| $\square = (\square_w, \square_h)$ | viewport size |
| $c = (c_w, c_h)$ | constraint imposed by membrane on organelle |
| $s = (s_w, s_h)$ | occupied size returned by organelle to membrane |
| $p = (p_x, p_y)$ | position assigned by membrane to organelle |
| $z$ | depth index (layer ordering) |
| $r$ | scale coefficient, $r \in (0, 1]$ |
| $s_{min}$ | minimum viable size of an organelle |
| $n_f$ | count of fill-type sibling organelles in a membrane |
| $\mathcal{F}$ | ordered set of fold layouts for a molecule |
| $\mathcal{U}$ | urgency function mapping organelles to z-levels |
| $e$ | organelle (entity in ECS) |
| $n$ | count of organelles in a membrane |

---

## 3. three-layer specification

following the [[crystal]] framework: axioms generate, conventions configure, invariants constrain

### 3.1 axioms

change any axiom and the entire system reconfigures

| axiom | symbol | value |
|-------|--------|-------|
| protocol | $\Pi$ | constrain → occupy → place (§4) |
| sizing | $\Phi$ | {fix, fill, scale} (§5) |
| containers | $\mathcal{K}$ | {stack, grid, layer} (§6) |

derived — the layout function:

$$\text{layout}(\mathcal{T},\; \square) \;\to\; \{(e_i,\; p_{x_i},\; p_{y_i},\; s_{w_i},\; s_{h_i},\; z_i)\}$$

$\mathcal{T}$ — the element tree: a hierarchy of membranes and organelles. $\square = (\square_w, \square_h)$ — viewport size. output: for each organelle $e_i$, its position $p$, size $s$, depth $z$

### 3.2 conventions

practical choices independent of axioms. should eventually be derived from optimization

| convention | current value | optimization target |
|------------|--------------|-------------------|
| spatial quantum | $g = 8$ | derive from font metrics + device density |
| desktop viewport | $\square = (240g, 135g)$ | neuron device distribution |
| mobile viewport | $\square = (49g, 106g)$ | neuron device distribution |
| structural breakpoint | $\square_w = 96g$ | fold threshold analysis across molecules |
| side column | fix($25g$) | min width fitting context/avatar menu content |
| commander height | fix($6g$) | min touch target rounded to $g$ |
| top bar | fix($6g$) desktop, fix($4g$) mobile | content requirement per fold |
| menu overlay | fix($25g$) desktop, fix($35g$) mobile | content-driven |

note: $g$ is convention, not axiom. the protocol works for any $g > 0$. the renderer interprets $g$ in its native units. current convention: $g = 8$

| $k$ | $k \cdot g$ | use |
|-----|-----------|-----|
| 1 | $g$ | minimum gap |
| 2 | $2g$ | mobile padding |
| 3 | $3g$ | desktop padding |
| 4 | $4g$ | side buttons (S, Σ) |
| 6 | $6g$ | commander, button, top bar |
| 25 | $25g$ | side columns |

### 3.3 invariants

testable constraints. the layout is not ready until all pass

| # | invariant | formal statement |
|---|-----------|-----------------|
| I1 | determinism | $\forall \mathcal{T}, \square: \text{layout}(\mathcal{T}, \square)_1 = \text{layout}(\mathcal{T}, \square)_2$ |
| I2 | single-pass | each organelle measured exactly once per layout computation |
| I3 | linear time | $\exists\, k:\; t(\text{layout}) \leq k \cdot |\mathcal{T}| \cdot f_{max}$ where $f_{max}$ = max fold set size |
| I4 | constraint respect | $\forall e_i:\; s_{w_i} \leq c_{w_i} \;\wedge\; s_{h_i} \leq c_{h_i}$ |
| I5 | quantum alignment | $\forall e_i:\; g \mid p_{x_i} \;\wedge\; g \mid p_{y_i} \;\wedge\; g \mid s_{w_i} \;\wedge\; g \mid s_{h_i}$ (except text glyph metrics) |
| I6 | z monotonicity | $\mathcal{U}(a) > \mathcal{U}(b) \;\Rightarrow\; z(a) > z(b)$ |
| I7 | fold legibility | $\forall$ molecule $m$ with fold set $\mathcal{F}_m$: $l_k$ renders legibly at $w_{min}(l_k)$ |
| I8 | renderer independence | output identical across all target renderers |
| I9 | semantic completeness | $\forall e_i:\; \text{role}(e_i) \in \{\text{interactive}\} \;\Rightarrow\; \text{label}(e_i) \neq \emptyset$ |

---

## 4. the protocol (axiom $\Pi$)

### 4.0 why this protocol

the fundamental question of spatial layout: who decides how much space an organelle gets?

three approaches:

**membrane dictates.** the membrane assigns exact size and position. the organelle has no input. fast ($\mathcal{O}(1)$ per decision), but the membrane lacks information about the organelle's intrinsic needs — a text block cannot communicate how tall it needs to be

**organelle dictates.** each organelle declares its size, the membrane must accommodate. flexible, but organelles can overflow, conflict, or demand contradictory space. no coordination guarantee

**negotiation.** membrane and organelle exchange information iteratively until agreement. maximally expressive. but requires multiple passes. convergence not guaranteed

this is not a strategic interaction. there is no conflict of interest. membrane and organelle are parts of the same tree — like a cell wall and a mitochondrion. the membrane does not compete with the organelle. it defines the physical boundary within which the organelle exists. the organelle does not negotiate — it truthfully reports its intrinsic size because there is no advantage to misreporting (exceeding the constraint is physically impossible, underreporting makes it illegible)

prysm chooses: **membrane constrains, organelle occupies, membrane places**

the membrane constrains — imposing a boundary. the organelle occupies — growing to fill what it needs within that boundary. the membrane places — positioning each organelle in space

information flows one direction: constraints down, sizes up, positions down. no upward influence from organelle to membrane constraint. this eliminates backtracking and guarantees single-pass $\mathcal{O}(n)$

**the tradeoff.** prysm cannot express content-dependent membrane sizing — a membrane cannot ask "how tall is my tallest organelle?" and resize itself before constraining others, because that requires measuring organelles before deciding membrane size (two passes). this is accepted. organelles that need unbounded space use scroll. the guarantee of linear time and determinism is worth more than multi-pass expressiveness

### 4.1 constrain

membrane computes a constraint for the organelle:

$$c = (c_w,\; c_h)$$

$c_w$ — maximum width the organelle may occupy (in quanta $g$). $c_h$ — maximum height. the organelle sees only $c$. it has no access to $\square$, siblings, or state outside its subtree. the root membrane receives $c_{root} = \square$

ECS: Entity = organelle. Component = `Constraint { c_w, c_h }`. System = `ConstrainSystem` — membrane reads own size + container params, writes `Constraint` to each organelle

### 4.2 occupy

organelle computes occupied size:

$$s = (s_w,\; s_h) \quad \text{subject to} \quad s_w \leq c_w \;\wedge\; s_h \leq c_h$$

$s_w$ — width actually occupied. $s_h$ — height occupied. invariant I4 enforced

when intrinsic content exceeds $c$, two adaptation rules:

**shrink** — organelle compresses proportionally to minimum viable size:

$$s_w = \max(s_{min},\;\; r \cdot c_w)$$

$s_{min}$ — smallest size at which this organelle functions legibly (defined per organelle). when $s_w = s_{min}$ and content still exceeds, fold threshold reached (§4.3)

**scroll** — organelle's layout size equals constraint, internal content extends beyond:

$$s_{visible} = (c_w, c_h) \quad;\quad s_{content} = (s'_w, s'_h) \quad \text{where} \quad s'_w > c_w \;\vee\; s'_h > c_h$$

scroll creates a viewport within an organelle. used for the space zone and data lists

ECS: Component = `Sizing { width: SizeType, height: SizeType, min_w, min_h }`. System = `OccupySystem` — reads `Sizing` + `Constraint`, writes `OccupiedSize { s_w, s_h }`

### 4.3 fold

when $r \cdot c_w < s_{min}$, the organelle hits its fold threshold and must reorganize — like a protein changing conformation to fit available space

each molecule defines $\mathcal{F}$ — an ordered set of conformations — as a required parameter:

$$\mathcal{F} = \{l_1, l_2, \ldots, l_k\} \quad \text{where} \quad w_{min}(l_1) > w_{min}(l_2) > \cdots > w_{min}(l_k)$$

$l_1$ — widest conformation (all sub-organelles visible). $l_k$ — narrowest (icon only). $w_{min}(l_j)$ — minimum width at which conformation $l_j$ is legible

selection:

$$l^* = l_i \quad \text{where} \quad i = \min\{j : w_{min}(l_j) \leq c_w\}$$

fold is a discrete transition between conformations. the layout computation is instantaneous (step function), but the renderer animates the visual transition over $150\text{ms}$ ease — motion serves state communication, not decoration. $\mathcal{F}$ is mandatory: a molecule without a fold set violates I7

ECS: Component = `FoldSet { conformations: Vec<(min_width, SubTree)> }`. System = `FoldSystem` — reads `FoldSet` + `Constraint`, writes `ActiveFold { index }`

### 4.4 place

membrane assigns position to the organelle:

$$p = (p_x,\; p_y)$$

$p_x$ — horizontal offset from membrane's origin. $p_y$ — vertical offset. the organelle does not choose its position

ECS: Component = `Position { x, y, z }`. System = `PlaceSystem` — reads `OccupiedSize` of all organelles + container params, writes `Position`

### 4.5 proofs

**Theorem 1 (linear time).** for a tree $\mathcal{T}$ with $n$ organelles where each molecule has a fold set of at most $f_{max}$ conformations, the protocol completes in $\mathcal{O}(n \cdot f_{max})$

**Proof.** the protocol performs a single depth-first traversal of $\mathcal{T}$. at each node $e_i$:
- constrain: membrane reads its own `OccupiedSize` and container parameters. both already computed (membrane visited before organelle in DFS). cost: $\mathcal{O}(1)$
- occupy: for a leaf, size computed from `Sizing` type and $c$. cost: $\mathcal{O}(1)$. for a molecule with fold, scan $\mathcal{F}$ — at most $f_{max}$ comparisons. cost: $\mathcal{O}(f_{max})$
- place: membrane reads occupied sizes of all organelles. for a stack with $m$ organelles, summing widths costs $\mathcal{O}(m)$. each organelle contributes to exactly one membrane's sum, so total placement across all nodes: $\mathcal{O}(n)$

total: $\sum_{i=1}^{n} \mathcal{O}(f_{max}) = \mathcal{O}(n \cdot f_{max})$

no backtracking: organelle cannot access membrane state (§4.1). ∎

**Theorem 2 (determinism).** for any tree $\mathcal{T}$ and viewport $\square$, $\text{layout}(\mathcal{T}, \square)$ produces a unique output

**Proof.** by structural induction on $\mathcal{T}$

*base case.* a leaf $e$ with sizing type $\phi$ and constraint $c$. the sizing function (§5.1-5.3) is a pure function of $(\phi, c)$ — no randomness, no external state. occupied size $s$ is unique. position $p$ assigned by membrane. output for $e$ is unique

*inductive step.* a membrane $e$ with organelles $e_1, \ldots, e_m$. assume each organelle produces unique output given its constraint. the membrane computes constraints from its own size and container parameters — both determined (by inductive hypothesis on $e$'s own membrane). organelles are ordered (tree structure is fixed). each constraint is unique. by hypothesis, each organelle's output is unique. placement is a function of occupied sizes and container parameters — all determined. output for $e$ and all organelles is unique

*root.* the root membrane receives $c_{root} = \square$, which is given. by induction, all organelles produce unique output. ∎

---

## 5. sizing (axiom $\Phi$)

### 5.1 the three primitives

**fix** — intrinsic size. no dependency on membrane:

$$\text{size}(\text{fix},\; k) = k \cdot g \quad \text{where} \quad k \in \mathbb{N}^+$$

$k$ — size in quanta. $g$ — the spatial quantum. the renderer translates $k \cdot g$ into its native units. ECS: `Sizing { width: Fix(6) }` → $6g$

**fill** — extrinsic size. absorbs remaining space after fix and scale siblings:

$$\text{size}(\text{fill},\; s_r,\; n_f) = \frac{s_r}{n_f}$$

$s_r$ — remaining space in quanta: $s_r = c_{membrane} - \sum s_{fix} - \sum (r_j \cdot c_{membrane}) - (n - 1) \cdot gap$. $n_f$ — count of fill sibling organelles. $gap$ — spacing between organelles (in quanta)

weighted: $\text{size}(\text{fill}_w,\; s_r,\; w_i,\; W) = s_r \cdot w_i / W$ where $W = \sum w_j$

ECS: `Sizing { width: Fill { weight: 1.0 } }`

**scale** — proportional size. fraction of membrane:

$$\text{size}(\text{scale},\; r,\; c_{membrane}) = \max(s_{min},\;\; r \cdot c_{membrane}) \quad \text{where} \quad r \in (0, 1]$$

$r$ — fraction. $c_{membrane}$ — membrane's constraint in quanta. $s_{min}$ — minimum in quanta (triggers fold when hit)

ECS: `Sizing { width: Scale { r: 0.33, min: 15 } }` → min $15g$

### 5.2 irreducibility

**Theorem 3.** no proper subset of $\Phi$ can express all sizing behaviors that $\Phi$ expresses

**Proof.** by exhibiting a layout requiring the removed primitive

*remove fix.* an organelle must be exactly $6g$ regardless of membrane size. scale($r$, $c_{membrane}$) = $r \cdot c_{membrane}$ varies with membrane — no constant $r$ produces $6g$ for all $c_{membrane}$. fill depends on siblings and membrane. neither produces a constant. fix is necessary

*remove fill.* a stack with two organelles: one is fix($25g$), the other must absorb whatever remains. scale($r$) requires knowing $r$ in advance, but the remainder $c_{membrane} - 25g$ as a fraction of $c_{membrane}$ is $1 - 25g/c_{membrane}$, different for every $c_{membrane}$. no fixed $r$ works across viewports. fill is necessary

*remove scale.* an organelle must always be $\frac{1}{3}$ of its membrane, regardless of siblings. fix is constant — cannot track membrane. fill depends on siblings — adding a fix($12g$) sibling changes the fill result. scale is necessary. ∎

the three primitives correspond to three fundamental relations between part and whole:

| primitive | relation | meaning | formal class |
|-----------|----------|---------|-------------|
| fix | independence | part does not depend on whole | $s = k \cdot g$ (constant) |
| fill | complement | part fills what remains after other parts | $s = f(c_{membrane}, \text{siblings})$ |
| scale | similarity | part is proportional to whole | $s = r \cdot c_{membrane}$ (linear through origin) |

**Theorem 4 (completeness of $\Phi$).** any monotone non-negative sizing function $s: \mathbb{R}^+ \to \mathbb{R}^+$ bounded by $c_{membrane}$ can be expressed as a composition of fix, fill, and scale

**Proof.** decompose $s(c_{membrane})$ into three components:

$$s(c_{membrane}) = \underbrace{a}_{\text{fix}} + \underbrace{r \cdot c_{membrane}}_{\text{scale}} + \underbrace{\epsilon(c_{membrane})}_{\text{fill}}$$

where $a = \lim_{c \to \infty} (s(c) - r \cdot c)$ is the constant offset (fix), $r = \lim_{c \to \infty} s(c)/c$ is the asymptotic scale factor (scale), and $\epsilon = s - a - r \cdot c_{membrane}$ is the remainder (fill — dependent on siblings and membrane, absorbed after fix and scale are resolved)

for any practical sizing function: if $s$ is constant → pure fix. if $s$ is linear through origin → pure scale. if $s$ depends on what other organelles leave → pure fill. any combination decomposes into these three. ∎

note: this proof assumes piecewise-linear sizing. nonlinear sizing (e.g. logarithmic) is outside the protocol's scope — the fold mechanism (§4.3) handles discrete transitions between linear regions

### 5.3 resolution order

within any membrane: fix → scale → fill. fill absorbs the remainder. this order is invariant — changing it would break fill's definition

---

## 6. containers (axiom $\mathcal{K}$)

three container types define three spatial topologies. in [[cellular automata]] terms: stack is the 1D chain (elementary automaton), grid is the 2D lattice (Game of Life), layer is the multi-plane stack (coupled maps). together they span all rectangular composition — and the tree of nested containers forms a tree cellular automaton, which is computationally complete

### 6.1 stack (1D chain)

organelles along a single axis. ECS: `Stack { direction, gap, align }`

| parameter | domain | default |
|-----------|--------|---------|
| direction | {horizontal, vertical} | vertical |
| gap | $\{g \cdot k : k \in \mathbb{N}\}$ | $g$ |
| align | {start, center, end, stretch} | start |

placement for horizontal stack with organelles $e_1, \ldots, e_n$:

$$p_{x_i} = \sum_{j=1}^{i-1} (s_{w_j} + gap) \qquad p_{y_i} = \text{align}(s_{h_i},\; c_h)$$

### 6.2 grid (2D lattice)

organelles in rows and columns. ECS: `Grid { cols, rows, areas, col_gap, row_gap }`

| parameter | domain |
|-----------|--------|
| columns | list of track sizes (fix, fill, scale) |
| rows | list of track sizes (fix, fill, scale) |
| areas | named regions spanning cells |
| col-gap, row-gap | $\{g \cdot k\}$ |

track resolution: fix → scale → fill (same order as sizing)

a grid is a table. grid operations include:

**filter**: predicate $f: e \to \{\text{true}, \text{false}\}$ selecting visible rows. $\text{rows}_{vis} = \{e_i : f(e_i)\}$. filtered rows get $s_h = 0$, excluded from placement. applied before layout pass

**sort**: ordering $\sigma$ on rows. changes placement sequence, not sizing. applied before layout pass

ECS: `GridFilter { predicate }`, `GridSort { ordering }` — `FilterSortSystem` runs before layout

### 6.3 layer (depth)

organelles share the same spatial region, ordered by depth. ECS: `Layer`, `Position { z }`

$z$ is assigned by the membrane via the urgency function $\mathcal{U}$:

$$z(e) = \mathcal{U}(e)$$

| urgency | $z$ | elements | rationale |
|---------|-----|----------|-----------|
| ambient | 0 | space | background, scrollable |
| persistent | 10 | context, avatar, stars, graph, time, S, Σ | frame, always visible |
| active | 20 | commander | primary interaction |
| interrupting | 30 | menus | temporarily demands focus |
| guiding | 40 | adviser, tooltip | system guidance |
| blocking | 50 | modal | demands resolution |

on renderers without native z-axis (terminal character grid): z maps to draw order — higher z overwrites lower z at the same position

### 6.4 completeness argument

**Claim.** {stack, grid, layer} can express any rectangular partition of a rectangle, plus overlapping arrangements

**Argument by construction.** any rectangular partition is either:
1. a sequence of horizontal or vertical slices → stack
2. a grid of rows and columns (with spans for non-uniform cells) → grid
3. overlapping regions → layer

Kozminski & Kinnen (1988) showed that not all rectangular layouts are sliceable (producible by recursive horizontal/vertical cuts). grid with column/row spanning handles the non-sliceable cases that pure stacking cannot. layer handles the overlapping cases that neither stack nor grid address (overlays, floating elements, z-ordered compositing)

**Open question.** a formal proof that grid-with-spans is complete for all non-overlapping rectangular partitions does not exist in the literature. the Felsner & Nathenson (2022) result on area-universal rectangular layouts provides a partial foundation, but the full connection to layout container expressiveness remains unproven. this is a genuine open problem

---

## 7. the leaf

terminal organelle. no sub-organelles. contains rendered data

| type | data | prysm pattern | ECS |
|------|------|---------------|-----|
| text | string at font size | [[prysm/text]] | `TextLeaf { content, size }` |
| vector | path, shape, line | [[prysm/saber]], [[prysm/ion]], [[prysm/images]] | `VectorLeaf { path }` |
| raster | bitmap, photo, video | image/video [[particle]] | `RasterLeaf { cid }` |

### coverage

every [[particle]] that occupies space renders through one of these three types. text covers markdown, code, addresses, numbers, labels, timestamps. vector covers icons, shapes, graphs, diagrams, SVG paths, lines, dividers. raster covers images, video frames, camera feeds, 2D projections of 3D models

compound particles (a page with text + images) are not leaves — they are membranes with leaf organelles

particles without spatial dimension: audio does not occupy layout coordinates. the protocol places a visual control (play button, waveform) which is a vector or raster leaf. audio playback is outside layout scope. 3D models in 2D mode render as raster (projected frame). in 3D mode (§11) they extend to 3D constraints

three types are sufficient because every visual output is either characters (text), paths (vector), or samples (raster). there is no fourth category of visual data

a leaf is a [[particle]] made spatial. storage ([[cybergraph]]) → placement (layout protocol) → rendering (target renderer). three independent systems

---

## 8. the [[cyb]] layout

root tree $\mathcal{T}$ for [[cyb]], demonstrating the protocol on a concrete interface

### 8.1 desktop ($\square = (240g, 135g)$)

grid: columns fix($25g$) fill fix($25g$), rows fix($6g$) fill auto. named areas: context adviser avatar / space space space / bottom-l commander bottom-r

| organelle | type | sizing | $z$ | $\mathcal{U}$ | ECS | role |
|-----------|------|--------|-----|------|-----|------|
| context | frame | fix($25g$) × fix($6g$) | 10 | persistent | `GridArea, Sizing, FoldSet, Trigger::Tap` | subject being viewed |
| adviser | guidance | fill × fix($6g$) | 40 | guiding | `GridArea, Sizing, Visibility` | voice of [[cyb]] |
| avatar | frame | fix($25g$) × fix($6g$) | 10 | persistent | `GridArea, Sizing, FoldSet, Trigger::Tap` | active [[neuron]] identity |
| space | ambient | fill × fill, scroll | 0 | ambient | `GridArea, Overflow::Scroll` | where [[particles]] render |
| S (sense) | frame | fix($4g$) × fix($6g$), left center | 10 | persistent | `FixedEdge::Left, Sizing` | [[cyb/sense]]: unread count |
| Σ (sigma) | frame | fix($4g$) × fix($6g$), right center | 10 | persistent | `FixedEdge::Right, Sizing` | [[cyb/sigma]]: balance |
| stars | frame | fix($25g$) × auto | 10 | persistent | `Stack::Vertical, Sizing` | pinned items |
| graph | frame | fix($25g$) × auto | 10 | persistent | `Sizing` | navigation minimap |
| commander | active | fill × fix($6g$) | 20 | active | `GridArea, Sizing` | input + buttons |
| time | frame | fix($25g$) × auto | 10 | persistent | `GridArea, Sizing` | action timeline |
| menu context | overlay | fix($25g$) × fill($\square_h$) | 30 | interrupting | `SlideOverlay::Left, Trigger::Tap` | settings |
| menu avatar | overlay | fix($25g$) × fill($\square_h$) | 30 | interrupting | `SlideOverlay::Right, Trigger::Tap` | accounts |

### 8.2 mobile ($\square = (49g, 106g)$, $\square_w \leq 96g$)

tree $\mathcal{T}$ restructures. grid: columns auto fill auto, rows fix($4g$) fill fix($6g$). areas: context adviser avatar / space space space / stars commander time

| change | desktop → mobile |
|--------|-----------------|
| top bar | fix($6g$) → fix($4g$). context, avatar fold to $l_k$ (icon only) |
| stars | vertical stack → horizontal, max 4 icons |
| graph | bottom-l → inside menu context |
| menus | fix($25g$) → fix($35g$) |
| space padding | $3g$ → $2g$ |

---

## 9. worked example

concrete computation for [[cyb]] desktop, demonstrating every protocol phase

### 9.1 input

$\square = (240g, 135g)$

element tree $\mathcal{T}$:

```
grid (root membrane)
  context     [fix(25g) × fix(6g)]
  adviser     [fill × fix(6g)]
  avatar      [fix(25g) × fix(6g)]
  space       [fill × fill, scroll]
  bottom-l    [fix(25g) × fix(19g)]
    stars     [fix(25g) × fix(10g)]
    graph     [fix(25g) × fix(9g)]
  commander   [fill × fix(6g)]
  time        [fix(25g) × fix(19g)]
```

grid tracks: columns = [fix(25g), fill, fix(25g)]. rows = [fix(6g), fill, auto]

### 9.2 step 1: resolve column tracks

fix columns: $25g + 25g = 50g$. fill column: $240g - 50g = 190g$

column widths: [25g, 190g, 25g]

### 9.3 step 2: resolve row tracks

fix row 1: $6g$. auto row 3: $\max(19g, 6g, 19g) = 19g$. fill row 2: $135g - 6g - 19g = 110g$

row heights: [6g, 110g, 19g]

### 9.4 step 3: constrain

| organelle | grid area | $c = (c_w, c_h)$ |
|-----------|-----------|-------------------|
| context | row 1, col 1 | $(25g, 6g)$ |
| adviser | row 1, col 2 | $(190g, 6g)$ |
| avatar | row 1, col 3 | $(25g, 6g)$ |
| space | row 2, col 1-3 | $(240g, 110g)$ |
| bottom-l | row 3, col 1 | $(25g, 19g)$ |
| commander | row 3, col 2 | $(190g, 6g)$ |
| time | row 3, col 3 | $(25g, 19g)$ |

### 9.5 step 4: occupy

- context: fix(25g) × fix(6g) → $s = (25g, 6g)$
- adviser: fill = 190g, fix(6g) → $s = (190g, 6g)$
- space: fill × fill → $s = (240g, 110g)$, overflow: scroll
- bottom-l: fix(25g) × fix(19g), organelles: stars $(25g, 10g)$, graph $(25g, 9g)$
- commander: fill = 190g, fix(6g) → $s = (190g, 6g)$
- time: fix(25g) × fix(19g) → $s = (25g, 19g)$

no fold triggered — all organelles fit within constraints

### 9.6 step 5: place

| organelle | $p_x$ | $p_y$ | $s_w$ | $s_h$ | $z$ |
|-----------|-------|-------|-------|-------|-----|
| context | $0$ | $0$ | $25g$ | $6g$ | 10 |
| adviser | $25g$ | $0$ | $190g$ | $6g$ | 40 |
| avatar | $215g$ | $0$ | $25g$ | $6g$ | 10 |
| space | $0$ | $6g$ | $240g$ | $110g$ | 0 |
| stars | $0$ | $116g$ | $25g$ | $10g$ | 10 |
| graph | $0$ | $126g$ | $25g$ | $9g$ | 10 |
| commander | $25g$ | $116g$ | $190g$ | $6g$ | 20 |
| time | $215g$ | $116g$ | $25g$ | $19g$ | 10 |

8 tuples. exact coordinates in quanta. deterministic. single pass

verification: $25g + 190g + 25g = 240g$ ✓. $6g + 110g + 19g = 135g$ ✓

---

## 10. temporal stability

why this protocol will not become obsolete

**the protocol is renderer-independent.** it outputs coordinate tuples in quanta $g$. when a new rendering technology appears, it consumes the same tuples. prysm is bound to rectangles and arithmetic — both predate computing and will outlast it

**the axioms are mathematical, not technological.** $\Pi$ is a tree traversal protocol. $\Phi$ contains three relations between part and whole: independence, complement, similarity. $\mathcal{K}$ contains three ways to partition or overlay rectangles. none references a specific language, OS, device, or rendering API

**the protocol is minimal.** three axioms. Theorem 3 proves each sizing primitive is necessary. Conjecture 1 argues each container type is necessary. minimal systems survive because they have fewer parts that can become irrelevant

**the inputs are universal.** the protocol requires: an element tree, a viewport size in quanta, and sizing parameters per organelle. every display device provides a viewport. every interface has organelles arranged in space

**what would invalidate it.** a fundamentally non-rectangular display would require extending $\mathcal{K}$. the 3D extension (§11) addresses projection. a display with no spatial dimension falls outside layout scope

---

## 11. 3D extension

in 2D, layout has two participants: membrane and organelle. the membrane constrains, the organelle occupies, the membrane places. depth ($z$) is an integer ordering assigned by urgency $\mathcal{U}$

in 3D, depth becomes a real spatial dimension and a third participant enters the protocol: the [[cybergraph]] itself. what is important must appear close to the [[neuron]]. what is peripheral must recede. importance is not decided by membrane or organelle — it is computed by the [[tri-kernel]] as [[focus]] ($\pi^*$) and [[gravity]]

### 11.1 the gravity phase

the 2D protocol has three phases: constrain → occupy → place. the 3D protocol has four:

**constrain → occupy → gravitate → place**

| phase | who acts | what happens |
|-------|----------|-------------|
| constrain | membrane | imposes $(c_w, c_h)$ on xy-plane |
| occupy | organelle | returns $(s_w, s_h)$ subject to constraint |
| gravitate | [[cybergraph]] | computes $p_z$ from focus: $p_z = f(\pi^*(e))$ |
| place | membrane | assigns $(p_x, p_y)$ on xy-plane |

the gravity function:

$$p_z(e) = d_{max} \cdot (1 - \pi^*(e))$$

$\pi^*(e)$ — the focus of organelle $e$ in the [[cybergraph]], computed by the [[tri-kernel]]. $d_{max}$ — maximum depth of the 3D space (convention). when $\pi^* = 1$ (maximum focus): $p_z = 0$ — directly in front of the neuron. when $\pi^* = 0$ (no focus): $p_z = d_{max}$ — at the far edge of the space

this mirrors physical gravity: massive objects (high focus) attract the observer's attention. the [[cybergraph]] is the gravitational field. focus is mass. distance is inversely proportional to importance

### 11.2 three participants

| participant | 2D role | 3D role |
|-------------|---------|---------|
| membrane | constrains xy, places xy | constrains xy, places xy (unchanged) |
| organelle | occupies space, reports size | occupies space, reports size (unchanged) |
| [[cybergraph]] | not involved | computes $p_z$ via gravity. third participant |

in 2D, the protocol is a dialogue between membrane and organelle. in 3D, the [[cybergraph]] speaks — it determines which knowledge is near and which is far. this is not a design choice. it follows from the physics of the [[cybergraph]]: the [[tri-kernel]] computes focus continuously, and focus determines spatial proximity to the neuron

### 11.3 sizing and containers in 3D

$\Phi$ unchanged: fix, fill, scale apply per dimension. an organelle can be fix($6g$) wide, fill tall, and its depth is computed by gravity — not by sizing

$\mathcal{K}$ extends:
- stack: 1D chain along any axis (x, y, or z)
- grid: 2D lattice on any pair of axes (xy, xz, yz)
- layer: in 2D, layer = z-ordering by $\mathcal{U}$. in 3D, $\mathcal{U}$ combines with gravity — urgency adjusts $p_z$ within the gravity-determined depth band. a modal ($\mathcal{U} = 50$) is pulled closer to the neuron than its gravity alone would place it

### 11.4 invariants in 3D

| invariant | 3D status |
|-----------|-----------|
| I1 determinism | holds — gravity is a pure function of $\pi^*$ which is deterministic |
| I2 single-pass | holds — gravitate adds $\mathcal{O}(1)$ per node (lookup $\pi^*$) |
| I3 linear time | holds — $\mathcal{O}(n \cdot f_{max})$ + $\mathcal{O}(n)$ for gravity = still $\mathcal{O}(n \cdot f_{max})$ |
| I4 constraint respect | holds for xy. $p_z$ is not constrained by membrane — it is determined by [[cybergraph]] |
| I5 quantum alignment | holds — $g \mid p_z$ (gravity output rounded to $g$) |
| I6 z monotonicity | replaced by gravity monotonicity: $\pi^*(a) > \pi^*(b) \Rightarrow p_z(a) < p_z(b)$ (higher focus = closer) |
| I7 fold legibility | holds — fold on xy, gravity on z. independent |
| I8 renderer independence | holds — output is world coordinates in quanta $g$ |

### 11.5 the layout function in 3D

$$\text{layout}_{3D}(\mathcal{T},\; \square,\; \pi^*) \;\to\; \{(e_i,\; p_{x_i},\; p_{y_i},\; p_{z_i},\; s_{w_i},\; s_{h_i})\}$$

note the third input: $\pi^*$ — the focus distribution from the [[cybergraph]]. in 2D, layout depends only on tree and viewport. in 3D, it depends on the state of knowledge itself

ECS: `Gravity { focus: f64 }` component. `GravitateSystem` reads `Gravity`, writes `Position { z }`. runs between `OccupySystem` and `PlaceSystem`

---

## 12. related work

| system | year | what prysm takes | what prysm rejects |
|--------|------|------------------|-------------------|
| TeX (Knuth & Plass) | 1981 | box-glue decomposition: fix ≈ box, fill ≈ glue. proven formalism | global optimization (O(n²)). penalties (line-breaking is outside scope) |
| Cassowary (Badros et al.) | 2001 | formal rigor of constraint specification | constraint solving itself — exponential worst case, prysm requires O(n) |
| Cassius (Panchekha et al.) | 2016 | proof that layout semantics can be mechanically verified (QF_LRA) | CSS complexity — prysm must be simpler than CSS to remain verifiable |
| Flutter RenderBox | 2017 | single-pass protocol: constraints down, sizes up. the direct ancestor of $\Pi$ | unproven O(n) claim. no fold. no renderer independence. no ECS |
| Taffy | 2022 | Rust implementation of CSS Grid + Flexbox. implementation target for Bevy UI | CSS semantics — prysm defines its own protocol, Taffy implements it |
| Morphorm | 2023 | ambition of a simpler single-pass layout | no grid, no fold, no formal analysis |
| VLSI floorplanning | 1988 | proof that pure stacking (slicing) is incomplete for rectangular layouts (Kozminski & Kinnen). motivates grid-with-spans in $\mathcal{K}$ | VLSI-specific constraints |
| CuTe Layout Algebra (NVIDIA) | 2024 | demonstration that layout can be formalized as algebra. closest formal precedent | GPU memory domain — different problem, but same mathematical structure |
| cellular automata | 1970 | computational completeness of simple local rules on grids. prysm's container tree is a tree cellular automaton | — |
| biological cell | — | membrane-organelle relationship. the physical metaphor: membrane constrains, organelle occupies. 3.5 billion years of validation | — |

**gap this paper addresses:** no published layout composition algebra for UI exists. every system above is either a specification (CSS), an implementation (Flutter, Taffy), or solves a different problem (TeX, CuTe, VLSI). prysm is a first attempt: three axioms, four theorems, biological metaphor, gravity-based 3D, ECS-native

---

## 12a. system execution order

the layout protocol maps to a directed acyclic graph of ECS systems. the DAG defines the exact execution order — no system runs before its dependencies complete

```
DataFetchSystems ─────────────────────────────┐
  (chain state, cyberank, karma, balances)     │
                                               ▼
                                        EmotionSystem
                                        (§ emotion.md)
                                               │
                                               ▼
FilterSortSystem ──► ConstrainSystem ──► OccupySystem ──► FoldSystem
   (§6.2)               (§4.1)            (§4.2)          (§4.3)
                                                             │
                                                             ▼
                                                      GravitateSystem
                                                         (§11.1)
                                                             │
                                                             ▼
                                                       PlaceSystem
                                                         (§4.4)
                                                             │
                                                             ▼
                                                  EmotionPropagateSystem
                                                    (cell → molecule → atom)
                                                             │
                                               ┌─────────────┼─────────────┐
                                               ▼             ▼             ▼
                                        CssRenderSystem  BevyUiRender  Ren3dRender
                                           (§13)          (§13)         (§13)
```

| stage | systems | reads | writes |
|-------|---------|-------|--------|
| 0 | DataFetchSystems | chain RPC, IPFS | `TokenBalances`, `ValidatorSet`, `CyberankMap`, `KarmaMap` |
| 1 | EmotionSystem | `EmotionSource` | `Emotion` |
| 1 | FilterSortSystem | `GridFilter`, `GridSort` | row visibility, row order |
| 2 | ConstrainSystem | parent `OccupiedSize`, `Stack`/`Grid`/`Layer` params | `Constraint { c_w, c_h }` |
| 3 | OccupySystem | `Sizing`, `Constraint` | `OccupiedSize { s_w, s_h }` |
| 4 | FoldSystem | `FoldSet`, `Constraint` | `ActiveFold { index }` |
| 5 | GravitateSystem | `Gravity { focus }` | `Position { z }` |
| 6 | PlaceSystem | `OccupiedSize`, container params | `Position { x, y }` |
| 7 | EmotionPropagateSystem | `Emotion`, element tree | `Emotion` on descendant entities |
| 8 | RenderSystems | `Position`, `OccupiedSize`, `Emotion`, leaf data | frame buffer |

stages 1-1 (EmotionSystem and FilterSortSystem) run in parallel — no data dependency between them. all other stages are sequential. total: 9 stages, $\mathcal{O}(n)$ per stage, $\mathcal{O}(n)$ total

---

## 13. renderers

the layout function outputs $\{(e_i, p_{x_i}, p_{y_i}, s_{w_i}, s_{h_i}, z_i)\}$. renderers consume coordinates:

| world | renderer | engine | mapping | ECS system |
|-------|----------|--------|---------|-----------|
| Portal | Leptos + CSS | browser | grid-template-areas, flexbox | `CssRenderSystem` |
| Terminal | Sugarloaf | GPU text | $(p_x / \text{cell}_w,\; p_y / \text{cell}_h)$ → char position | `TermRenderSystem` |
| Interface | Bevy UI | Taffy | Node, Style, Display::Grid | `BevyUiRenderSystem` |
| 3D | Bevy 3D | [[Ren]] | $(p_x, p_y, z)$ projected onto surfaces | `Ren3dRenderSystem` |

---

## 14. validation

the protocol is validated by [[cyb]] at cyb.ai — the live interface to the [[cybergraph]]

every screen in [[cyb]] is an element tree computed by this protocol. invariants tested against the running system:

- I1 (determinism): same page load → same coordinates. screenshot comparison across sessions
- I2 (single-pass): layout profiler confirms no re-measurement
- I3 (linear time): layout time measured across pages with 10 to 10,000 organelles. linear relationship confirmed
- I4 (constraint respect): automated bounds checking — no organelle overflows its membrane
- I5 (quantum alignment): inspector confirms $g$-alignment on non-text organelles
- I6 (z monotonicity): modal above adviser above commander above space
- I7 (fold legibility): every molecule tested at $s_{min}$ on mobile viewport
- I8 (renderer independence): same coordinates across Leptos and Bevy UI
- I9 (semantic completeness): every interactive organelle has a non-empty label. CI check against component catalog

[[cyb]] is the proof. the paper is the specification

---

## 15. motion

motion is convention, not axiom. the protocol computes static coordinates — motion is how the renderer transitions between two successive layout computations

### 15.1 the motion function

$$\mu(e,\; s_0,\; s_1,\; t) = s_0 + (s_1 - s_0) \cdot \alpha(t)$$

$s_0$ — previous state (position + size). $s_1$ — target state (new layout output). $t$ — time elapsed since layout change. $\alpha(t)$ — easing function, $\alpha: [0, T] \to [0, 1]$, $\alpha(0) = 0$, $\alpha(T) = 1$

### 15.2 conventions

| parameter | value | rationale |
|-----------|-------|-----------|
| $T$ (duration) | $150\text{ms}$ | below perception threshold for causality (200ms). fast enough to feel instant, slow enough to track |
| $\alpha$ | ease (cubic-bezier 0.25, 0.1, 0.25, 1.0) | matches natural deceleration |
| fold transition | $150\text{ms}$ ease | conformation change — same as all other transitions |
| menu slide | $150\text{ms}$ ease | overlay entrance/exit |
| emotion change | $150\text{ms}$ ease | color transition |

all motion in prysm uses the same $T$ and $\alpha$. one duration, one curve. uniformity is legibility — the neuron learns one rhythm

### 15.3 when motion applies

motion applies only when $s_0 \neq s_1$ for the same entity $e$. the protocol guarantees: if the element tree and viewport have not changed, $s_0 = s_1$ (Theorem 2, determinism). motion is triggered by: viewport resize, fold transition, data update changing element tree, emotion change

motion does not affect layout computation. the protocol always outputs $s_1$ (target). the renderer interpolates the visual representation. this separation preserves I2 (single-pass) and I1 (determinism)

ECS: `MotionState { s_0, s_1, t_start }` component. `MotionSystem` reads `Position`, `OccupiedSize`, `Emotion`, writes interpolated values to render components. runs after layout, before render

---

## 16. accessibility

the protocol outputs spatial coordinates. accessibility requires semantic annotation: what each organelle means, not where it is

### 16.1 the semantic layer

every organelle carries an optional semantic role:

| role | meaning | examples |
|------|---------|----------|
| navigation | moves the neuron to a different location in the [[cybergraph]] | commander input, menu items, tabs, stars |
| action | triggers a state change | buttons (sign, delegate, send), toggles |
| display | presents data (read-only) | counters, address, pill, content render |
| input | accepts data from the neuron | text input, slider, token amount |
| landmark | structural anchor for orientation | context, avatar, commander, adviser |
| group | semantically related organelles | validator list, token table, filter bar |

### 16.2 annotation in ECS

- Component: `Semantic { role: Role, label: String, description: Option<String> }`
- Component: `NavigationOrder { index: u32 }` — tab order within a membrane
- Component: `LiveRegion { politeness: Polite | Assertive }` — for dynamic content (adviser messages, counter updates)

`NavigationOrder` follows the element tree: depth-first, same order as layout traversal. within a membrane, order matches placement direction (left-to-right for horizontal stack, top-to-bottom for vertical). this means navigation order is derived from the element tree — no manual assignment

### 16.3 renderer mapping

| renderer | semantic output |
|----------|----------------|
| Portal (Leptos) | ARIA roles, aria-label, aria-live, tabindex |
| Terminal (Sugarloaf) | focus ring, screen reader text |
| Bevy UI | AccessibilityNode (bevy_a11y) |
| 3D (Ren) | spatial audio cues for proximity, haptic feedback for focus |

the semantic layer is renderer-independent — same `Semantic` component, different output per renderer. the protocol does not define how accessibility is rendered, only what information each organelle carries

### 16.4 invariant

I9 (semantic completeness): every interactive organelle (role = navigation, action, or input) has a non-empty `label`

$$\forall e_i:\; \text{role}(e_i) \in \{\text{navigation}, \text{action}, \text{input}\} \;\Rightarrow\; \text{label}(e_i) \neq \emptyset$$

---

## 17. open problems

1. **completeness proof for {stack, grid, layer}.** can grid-with-spans express all non-overlapping rectangular partitions? Kozminski & Kinnen (1988) proved that pure slicing (recursive horizontal/vertical cuts) cannot produce all rectangular partitions — some require T-junctions that slicing cannot create. grid-with-spans handles T-junctions by allowing cells to span multiple rows/columns. the conjecture: grid-with-spans is complete for the class of rectangular partitions that arise in UI layout (where cells are axis-aligned and non-overlapping). a proof would require showing that every rectangular dual graph has a valid grid assignment with integer spans. Felsner & Nathenson (2022) show existence of area-universal representations for all rectangular layouts — the gap is connecting their representation to grid-with-spans specifically

2. **fold set derivation.** each molecule defines $\mathcal{F}$ manually. algorithm sketch for automatic derivation: (a) enumerate all subsets of a molecule's organelles, (b) for each subset, compute $s_{min}$ of the remaining organelles in the active container type, (c) order by $w_{min}$ descending, (d) prune dominated conformations (where a wider conformation shows strictly less information than a narrower one). complexity: $\mathcal{O}(2^m)$ where $m$ = organelle count per molecule. acceptable for specification-time computation (molecules have $m \leq 10$), not for runtime. the open question: can this be reduced to $\mathcal{O}(m \log m)$ by exploiting the lattice structure of organelle subsets?

3. **3D invariant verification.** I1-I3, I5, I7, I8 are verified in §11.4. remaining: I4 (constraint respect) is intentionally relaxed for $p_z$ — gravity determines depth independently of membrane constraint. this is a design choice, not a gap. I6 (z monotonicity) is replaced by gravity monotonicity — the replacement is well-defined. the genuine open problem: when $\mathcal{U}$ (urgency) and gravity disagree — a modal ($\mathcal{U} = 50$) for a low-focus entity — how exactly do they compose? current answer: $p_z = \min(p_{z,gravity},\; p_{z,urgency})$ — urgency can pull closer but not push farther. formal verification of this composition rule under all combinations is pending

4. **layout algebra.** can membrane composition be formalized as an algebra with operations and identities? candidates: membrane union (combining two membranes into one), membrane product (nesting), membrane quotient (extracting a sub-tree). if such an algebra exists, element trees could be simplified before layout computation — algebraic optimization

5. **multimodal extension.** the protocol addresses visual layout. a Type I civilization requires spatial audio (sound positioned at $p_z$), haptic feedback (touch intensity from focus), and neural interfaces. the question: can $\Pi$ (constrain → occupy → place) generalize to non-spatial channels where "constraint" and "position" have different physical meaning?

---

## 18. scope and catalog

this paper defines spatial placement: how elements are sized and positioned. it depends on nothing above it. everything visible depends on it

companion specifications:
- [[prysm/emotion]] — the emotion function: how protocol state maps to color
- [[prysm]] component catalog — atoms, molecules, cells, fold sets, visual parameters, interaction rules

this paper does not define what elements exist, how they look, or how they behave. those definitions live in the companion specifications above
