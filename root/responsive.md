---
tags: prysm, cyb, core
crystal-type: pattern
crystal-domain: cyber
---

responsive adaptation in [[prysm]]

how [[cyb]] adapts to any viewport without breakpoint heuristics. the layout protocol (§4.3) defines fold as a mathematical mechanism. this page defines the responsive strategy: which viewport classes exist, how the element tree restructures, and what invariants hold across all sizes

## the viewport

$$\square = (\square_w, \square_h)$$

$\square$ — viewport size in quanta $g$. the protocol does not name viewport classes (no "mobile", "tablet", "desktop" in the formal system). adaptation is continuous: each molecule selects its fold conformation based on its own constraint $c$, not the viewport class

for practical communication, two reference viewports:

| reference | $\square$ | $\square_w$ threshold |
|-----------|-----------|----------------------|
| desktop | $(240g, 135g)$ | $\square_w > 96g$ |
| mobile | $(49g, 106g)$ | $\square_w \leq 96g$ |

$96g$ — the structural breakpoint. below it, the root grid restructures (§8.2 of layout protocol). this is the only global breakpoint in prysm. all other adaptation is local (per-molecule fold)

## the structural breakpoint

above $96g$: three-column grid. context and avatar as side columns. stars and graph in bottom-left. time in bottom-right

below $96g$: the element tree restructures:

| element | desktop | mobile |
|---------|---------|--------|
| root grid | 3 columns (25g / fill / 25g) | 3 columns (auto / fill / auto) |
| top bar | fix($6g$) | fix($4g$) |
| context | fix($25g$) × fix($6g$), shows icon + name | auto × fix($4g$), icon only |
| avatar | fix($25g$) × fix($6g$), shows image + name + address | auto × fix($4g$), image only |
| stars | vertical stack, bottom-left | horizontal row, max 4, bottom row |
| graph | bottom-left below stars | moves inside menu context |
| menus | fix($25g$) × fill | fix($35g$) × fill |
| space padding | $3g$ | $2g$ |
| commander | fill × fix($6g$) | fill × fix($6g$) — unchanged |

the commander is invariant: fill × fix($6g$), always at bottom, both desktop and mobile. this is a design axiom of [[cyb]], not a responsive decision

## fold as responsive mechanism

responsive adaptation in prysm is fold (§4.3 of layout protocol). each molecule defines $\mathcal{F}$ — ordered conformations with decreasing $w_{min}$:

$$\mathcal{F} = \{l_1, l_2, \ldots, l_k\} \quad \text{where} \quad w_{min}(l_1) > w_{min}(l_2) > \cdots > w_{min}(l_k)$$

the layout system selects the widest conformation that fits the constraint. no media queries. no CSS breakpoints. fold is a pure function of constraint width

### common fold patterns

| pattern | $l_1$ (wide) | $l_2$ (medium) | $l_3$ (narrow) |
|---------|-------------|---------------|----------------|
| text reduction | icon + label + description | icon + label | icon only |
| column hiding | all columns visible | primary + secondary | primary only |
| layout change | side-by-side | stacked vertical | collapsed |
| detail removal | full content | summary | minimal |

every molecule in the [[prysm]] catalog defines its fold set. see individual molecule pages for specific conformations

## invariants across all viewports

| # | invariant | formal |
|---|-----------|--------|
| R1 | commander at bottom | $p_y(\text{commander}) + s_h(\text{commander}) = \square_h$ |
| R2 | space is scrollable | $\text{overflow}(\text{space}) = \text{scroll}$ for all $\square$ |
| R3 | context top-left | $p_x(\text{context}) = 0 \;\wedge\; p_y(\text{context}) = 0$ |
| R4 | avatar top-right | $p_x(\text{avatar}) + s_w(\text{avatar}) = \square_w \;\wedge\; p_y(\text{avatar}) = 0$ |
| R5 | S left, Σ right | $p_x(S) = 0 \;\wedge\; p_x(\Sigma) + s_w(\Sigma) = \square_w$ |
| R6 | no horizontal scroll | $s_w(\text{root}) = \square_w$ — root never exceeds viewport width |
| R7 | minimum viable | $\square_w \geq 40g$ — below $40g$ the interface is not guaranteed legible |

R1 is the strongest invariant: the commander is always at the bottom edge, regardless of viewport, orientation, or active [[aip]]. this guarantees the neuron always knows where to act

## orientation

the protocol does not distinguish portrait from landscape. $\square_w$ and $\square_h$ are symmetric inputs. when $\square_w < \square_h$ (portrait), the structural breakpoint naturally applies if $\square_w \leq 96g$. when $\square_w > \square_h$ (landscape on phone), the desktop layout may activate if $\square_w > 96g$

orientation change = viewport resize. the layout function recomputes. fold conformations re-evaluate. motion convention ($150\text{ms}$ ease) animates the transition

## ECS

- Component: `Viewport { w: u32, h: u32 }` — current viewport in quanta
- Component: `StructuralMode { desktop | mobile }` — derived from $\square_w > 96g$
- System: `ViewportSystem` — reads window size, writes `Viewport` and `StructuralMode`
- System: `TreeRestructureSystem` — when `StructuralMode` changes, restructures the element tree (graph moves into/out of menu, stars change direction)

`ViewportSystem` runs before `ConstrainSystem` — it sets the root constraint $c_{root} = \square$
