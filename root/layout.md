---
tags: prysm, cyb, article, core
crystal-type: pattern
crystal-domain: cyber
crystal-size: deep
---

# prysm layout protocol

a formal spatial composition system for the interface of [[superintelligence]]

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
| $n_f$ | count of fill-type sibling organelles in a container |
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

$$\text{layout}(\mathcal{T},\; \omega) \;\to\; \{(e_i,\; p_{x_i},\; p_{y_i},\; s_{w_i},\; s_{h_i},\; z_i)\}$$

$\mathcal{T}$ — the element tree: a hierarchy of membranes and organelles. $\square = (\square_w, \square_h)$ — viewport size. output: for each organelle $e_i$, its position $p$, size $s$, depth $z$

### 3.2 conventions

practical choices independent of axioms. should eventually be derived from optimization

| convention | current value | optimization target |
|------------|--------------|-------------------|
| spatial quantum | $g = 8$ | derive from font metrics + device density |
| desktop viewport | $\square$ = 1920 × 1080 | neuron device distribution |
| mobile viewport | $\square$ = 390 × 844 | neuron device distribution |
| structural breakpoint | $\square_w$ = 768 | fold threshold analysis across molecules |
| side column | fix(200) | min width fitting context/avatar menu content |
| commander height | fix($6g$) | min touch target rounded to $g$ |
| top bar | fix(48) desktop, fix(32) mobile | content requirement per fold |
| menu overlay | fix(200) desktop, fix(280) mobile | content-driven |

note: $g$ is convention, not axiom. the protocol works for any $g > 0$. the choice $g = 8$ is empirical — it divides common viewport widths and aligns with monospace metrics at standard sizes

### 3.3 invariants

testable constraints. the layout is not ready until all pass

| # | invariant | formal statement |
|---|-----------|-----------------|
| I1 | determinism | $\forall \mathcal{T}, \omega: \text{layout}(\mathcal{T}, \omega)_1 = \text{layout}(\mathcal{T}, \omega)_2$ |
| I2 | single-pass | each organelle measured exactly once per layout computation |
| I3 | linear time | $\exists\, k:\; t(\text{layout}) \leq k \cdot |\mathcal{T}| \cdot f_{max}$ where $f_{max}$ = max fold set size |
| I4 | constraint respect | $\forall e_i:\; s_{w_i} \leq c_{w_i} \;\wedge\; s_{h_i} \leq c_{h_i}$ |
| I5 | quantum alignment | $\forall e_i:\; g \mid p_{x_i} \;\wedge\; g \mid p_{y_i} \;\wedge\; g \mid s_{w_i} \;\wedge\; g \mid s_{h_i}$ (except text glyph metrics) |
| I6 | z monotonicity | $\mathcal{U}(a) > \mathcal{U}(b) \;\Rightarrow\; z(a) > z(b)$ |
| I7 | fold legibility | $\forall$ molecule $m$ with fold set $\mathcal{F}_m$: $l_k$ renders legibly at $w_{min}(l_k)$ |
| I8 | renderer independence | output identical across all target renderers |

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

$c_w$ — maximum width the organelle may occupy (in quanta $g$). $c_h$ — maximum height. the organelle sees only $c$. it has no access to $\square$, siblings, or state outside its subtree. the root membrane receives $c_{root} = \omega$

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

fold is a step function — discrete transition between conformations. $\mathcal{F}$ is mandatory: a molecule without a fold set violates I7

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

no backtracking: organelle cannot access membrane state (§4.1). $\square$

**Theorem 2 (determinism).** for any tree $\mathcal{T}$ and viewport $\square$, $\text{layout}(\mathcal{T}, \omega)$ produces a unique output

**Proof.** by structural induction on $\mathcal{T}$

*base case.* a leaf $e$ with sizing type $\phi$ and constraint $c$. the sizing function (§5.1-5.3) is a pure function of $(\phi, c)$ — no randomness, no external state. occupied size $s$ is unique. position $p$ assigned by membrane. output for $e$ is unique

*inductive step.* a membrane $e$ with organelles $e_1, \ldots, e_m$. assume each organelle produces unique output given its constraint. the membrane computes constraints from its own size and container parameters — both determined (by inductive hypothesis on $e$'s own membrane). organelles are ordered (tree structure is fixed). each constraint is unique. by hypothesis, each organelle's output is unique. placement is a function of occupied sizes and container parameters — all determined. output for $e$ and all organelles is unique

*root.* the root membrane receives $c_{root} = \omega$, which is given. by induction, all organelles produce unique output. $\square$

---

## 5. sizing (axiom $\Phi$)

### 5.1 the three primitives

**fix** — intrinsic size. no dependency on membrane:

$$\text{size}(\text{fix},\; k) = k \cdot g \quad \text{where} \quad k \in \mathbb{N}^+$$

$k$ — size in quanta. $g$ — the spatial quantum (convention, currently 8). the renderer translates $k \cdot g$ into its native units. ECS: `Sizing { width: Fix(6) }` → $6g$

**fill** — extrinsic size. absorbs remaining space after fix and scale siblings:

$$\text{size}(\text{fill},\; s_r,\; n_f) = \frac{s_r}{n_f}$$

$s_r$ — remaining space in quanta: $s_r = c_{membrane} - \sum s_{fix} - \sum (r_j \cdot c_{membrane}) - (n - 1) \cdot gap$. $n_f$ — count of fill sibling organelles. $gap$ — spacing between organelles (in quanta)

weighted: $\text{size}(\text{fill}_w,\; s_r,\; w_i,\; W) = s_r \cdot w_i / W$ where $W = \sum w_j$

ECS: `Sizing { width: Fill { weight: 1.0 } }`

**scale** — proportional size. fraction of membrane:

$$\text{size}(\text{scale},\; r,\; c_{membrane}) = \max(s_{min},\;\; r \cdot c_{membrane}) \quad \text{where} \quad r \in (0, 1]$$

$r$ — fraction. $c_{membrane}$ — membrane's constraint in quanta. $s_{min}$ — minimum in quanta (triggers fold when hit)

ECS: `Sizing { width: Ratio { r: 0.33, min: 15 } }` → min $15g$

### 5.2 irreducibility

**Theorem 3.** no proper subset of $\Phi$ can express all sizing behaviors that $\Phi$ expresses

**Proof.** by exhibiting a layout requiring the removed primitive

*remove fix.* an organelle must be exactly $6g$ regardless of membrane size. scale($r$, $c_{membrane}$) = $r \cdot c_{membrane}$ varies with membrane — no constant $r$ produces $6g$ for all $c_{membrane}$. fill depends on siblings and membrane. neither produces a constant. fix is necessary

*remove fill.* a stack with two organelles: one is fix($25g$), the other must absorb whatever remains. scale($r$) requires knowing $r$ in advance, but the remainder $c_{membrane} - 25g$ as a fraction of $c_{membrane}$ is $1 - 25g/c_{membrane}$, different for every $c_{membrane}$. no fixed $r$ works across viewports. fill is necessary

*remove scale.* an organelle must always be $\frac{1}{3}$ of its membrane, regardless of siblings. fix is constant — cannot track membrane. fill depends on siblings — adding a fix($12g$) sibling changes the fill result. scale is necessary. $\square$

the three primitives correspond to three fundamental relations between part and whole:

| primitive | relation | meaning | formal class |
|-----------|----------|---------|-------------|
| fix | independence | part does not depend on whole | $s = k \cdot g$ (constant) |
| fill | complement | part fills what remains after other parts | $s = f(c_{membrane}, \text{siblings})$ |
| scale | similarity | part is proportional to whole | $s = r \cdot c_{membrane}$ (linear through origin) |

any function $s(c_{membrane})$ is either constant (fix), depends on the remainder after other parts (fill), proportional to the whole (scale), or a composition of these. there is no fourth relation between part and whole

### 5.3 resolution order

within any membrane: fix → scale → fill. fill absorbs the remainder. this order is invariant — changing it would break fill's definition

---

## 6. containers (axiom $\mathcal{K}$)

### 6.1 stack (1D)

organelles along a single axis. ECS: `Stack { direction, gap, align }`

| parameter | domain | default |
|-----------|--------|---------|
| direction | {horizontal, vertical} | vertical |
| gap | $\{g \cdot k : k \in \mathbb{N}\}$ | $g$ |
| align | {start, center, end, stretch} | start |

placement for horizontal stack with organelles $e_1, \ldots, e_n$:

$$p_{x_i} = \sum_{j=1}^{i-1} (s_{w_j} + gap) \qquad p_{y_i} = \text{align}(s_{h_i},\; c_h)$$

### 6.2 grid (2D)

organelles in rows and columns. ECS: `Grid { cols, rows, areas, col_gap, row_gap }`

| parameter | domain |
|-----------|--------|
| columns | list of track sizes (fix, fill, scale) |
| rows | list of track sizes (fix, fill, scale) |
| areas | named regions spanning cells |
| col-gap, row-gap | $\{g \cdot k\}$ |

track resolution: fix → scale → fill (same order as sizing)

a grid is a table. grid opescalens include:

**filter**: predicate $f: e \to \{\text{true}, \text{false}\}$ selecting visible rows. $\text{rows}_{vis} = \{e_i : f(e_i)\}$. filtered rows get $s_h = 0$, excluded from placement. applied before layout pass

**sort**: ordering $\sigma$ on rows. changes placement sequence, not sizing. applied before layout pass

ECS: `GridFilter { predicate }`, `GridSort { ordering }` — `FilterSortSystem` runs before layout

### 6.3 layer (z-axis)

organelles share the same spatial region, ordered by depth. ECS: `Layer`, `Position { z }`

$z$ is assigned by the membrane via the urgency function $\mathcal{U}$:

$$z(e) = \mathcal{U}(e)$$

| urgency | $z$ | elements | scalenale |
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

particles without spatial dimension: audio does not occupy layout coordinates. the protocol places a visual control (play button, waveform) which is a vector or raster leaf. audio playback is outside layout scope. 3D models in 2D mode render as raster (projected frame). in 3D mode (§10) they extend to 3D constraints

three types are sufficient because every visual output is either characters (text), paths (vector), or samples (raster). there is no fourth category of visual data

a leaf is a [[particle]] made spatial. storage ([[cybergraph]]) → placement (layout protocol) → rendering (target renderer). three independent systems

---

## 8. the [[cyb]] layout

root tree $\mathcal{T}$ for [[cyb]], demonstrating the protocol on a concrete interface

### 8.1 desktop ($\square$ = 1920 × 1080)

grid: columns fix(200) fill fix(200), rows fix(48) fill auto. named areas: context adviser avatar / space space space / bottom-l commander bottom-r

| element | entity type | sizing | $z$ | $\mathcal{U}$ | ECS components | role |
|---------|------------|--------|-----|------|----------------|------|
| context | frame | fix(200) × fix(48) | 10 | persistent | `GridArea, Sizing, FoldSet, Trigger::Tap` | subject being viewed |
| adviser | guidance | fill × fix(48) | 40 | guiding | `GridArea, Sizing, Visibility` | voice of [[cyb]]: errors, guidance |
| avatar | frame | fix(200) × fix(48) | 10 | persistent | `GridArea, Sizing, FoldSet, Trigger::Tap` | active [[neuron]] identity |
| space | ambient | fill × fill, scroll | 0 | ambient | `GridArea, Overflow::Scroll` | where [[particles]] render |
| S (sense) | frame | fix(32) × fix(48), left center | 10 | persistent | `FixedEdge::Left, Sizing` | [[cyb/sense]]: unread count, tap → page |
| Σ (sigma) | frame | fix(32) × fix(48), right center | 10 | persistent | `FixedEdge::Right, Sizing` | [[cyb/sigma]]: balance, tap → page |
| stars | frame | fix(200) × auto | 10 | persistent | `Stack::Vertical, Sizing` | pinned items by avatar |
| graph | frame | fix(200) × auto | 10 | persistent | `Sizing` | navigation minimap |
| commander | active | fill × fix(48) | 20 | active | `GridArea, Sizing` | input + buttons: search, command, sign |
| time | frame | fix(200) × auto | 10 | persistent | `GridArea, Sizing` | action timeline |
| menu context | overlay | fix(200) × fill($\omega_h$) | 30 | interrupting | `SlideOverlay::Left, Trigger::Tap` | settings, navigation |
| menu avatar | overlay | fix(200) × fill($\omega_h$) | 30 | interrupting | `SlideOverlay::Right, Trigger::Tap` | account switching |

### 8.2 mobile ($\square$ = 390 × 844, $\omega_w \leq 768$)

tree $\mathcal{T}$ restructures. grid: columns auto fill auto, rows fix(32) fill fix(48). areas: context adviser avatar / space space space / stars commander time

| change | desktop → mobile |
|--------|-----------------|
| top bar | fix(48) → fix(32). context, avatar fold to $l_k$ (icon only) |
| stars | vertical stack → horizontal, max 4 icons |
| graph | bottom-l → inside menu context |
| menus | fix(200) → fix(280) |
| space padding | $3g$ → $2g$ |

---

## 9. worked example

concrete computation for [[cyb]] desktop, demonstrating every protocol phase

### 9.1 input

$\square = (240g, 135g)$ (1920 × 1080 at $g = 8$)

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

the protocol as defined operates in 2D: every element receives $(p_x, p_y, s_w, s_h, z)$. $z$ is depth ordering, not a spatial coordinate

extending to 3D (Bevy 3D, [[Ren]] geometric algebra) requires addressing three problems that 2D does not have:

**occlusion depends on viewpoint.** in 2D, higher z always renders on top. in 3D, which element occludes which depends on the camera position. the z-ordering function $\mathcal{U}$ must become viewpoint-dependent or the renderer must resolve occlusion independently

**perspective couples depth to apparent size.** an element at distance $d$ from the camera subtends visual angle $\theta = 2 \arctan(s / 2d)$. this means sizing and positioning are no longer independent — moving an element in depth changes its apparent size. the constrain-occupy protocol must be extended: membrane imposes a 3D constraint volume $(c_w, c_h, c_d)$, organelle returns occupied volume $(s_w, s_h, s_d)$, membrane places in 3D $(p_x, p_y, p_z)$

**the spatial quantum may vary with depth.** $g$ assumes uniform density. in 3D with perspective, density varies with depth. the quantum becomes $g(d) = g_0 \cdot d / d_{ref}$

the minimal extension: add $p_z$ and $s_d$ to every element. the protocol phases remain identical — constrain, occupy, place — with constraints and sizes gaining one dimension. the renderer handles perspective projection

this extension is specified but not yet implemented. the 2D protocol is the foundation; 3D is an additive layer, not a replacement

---

## 12. related work

| system | year | key contribution | relation to prysm |
|--------|------|-----------------|-------------------|
| TeX (Knuth & Plass) | 1981 | boxes + glue + penalties. proven optimal line-breaking. O(n²) | prysm: no global optimization (single-pass), no penalties (no line-breaking). fix ≈ box, fill ≈ glue |
| Cassowary (Badros et al.) | 2001 | incremental linear constraint solver. maximal expressiveness | prysm trades expressiveness for O(n) guarantee. no constraint solving |
| Cassius (Panchekha et al.) | 2016 | mechanized verification of CSS 2.1 as QF_LRA | validates that layout can be formalized. prysm is simpler than CSS — verification should be easier |
| Flutter RenderBox | 2017 | single-pass constraints-down sizes-up. O(n) claimed | prysm protocol directly inspired by Flutter. prysm adds fold, ECS mapping, renderer independence |
| Taffy | 2022 | CSS Grid + Flexbox in Rust, platform-agnostic | prysm implementation target, not a new protocol |
| Morphorm | 2023 | simplified single-pass flex layout | similar goals, less formal, no grid or fold |
| VLSI floorplanning (Kozminski & Kinnen) | 1988 | not all rectangular layouts are sliceable | motivates grid-with-spans as necessary beyond pure stacking |
| CuTe Layout Algebra (NVIDIA) | 2024 | formal algebra for tensor memory layouts | not UI, but demonstrates that layout algebra is tractable. closest formal precedent |

**gap this paper addresses:** no published layout type theory or composition algebra exists for UI. every system above is either a specification (CSS), an implementation (Flutter, Taffy), or solves a different problem (TeX, CuTe). prysm is a first attempt at a minimal formal system: three axioms, provable properties, ECS-native

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

## 12. open problems

1. **completeness proof for {stack, grid, layer}.** can grid-with-spans express all non-overlapping rectangular partitions? the connection to Felsner & Nathenson (2022) area-universal layouts is suggestive but unproven

2. **fold set derivation.** each molecule defines $\mathcal{F}$ manually. can optimal fold sets be computed automatically from a molecule's organelle subtree?

3. **3D invariant verification.** the 3D extension (§9) preserves protocol structure but invariant proofs under perspective coupling are not yet verified

4. **layout algebra.** can membrane composition be formalized as an algebra with operations and identities? this would enable algebraic simplification of element trees

---

## 13. scope and catalog

this paper defines spatial placement: how elements are sized and positioned. it depends on nothing above it. everything visible depends on it

this paper does not define what elements exist, how they look, or how they behave. those definitions live in the [[prysm]] component catalog: atoms, molecules, cells, fold sets, visual parameters, interaction rules
