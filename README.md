# prysm

the design system of [[cyb]] — a visual language for interfacing with [[Superintelligence]]

every screen in [[cyb]] is a composition of prysm components. the system defines how humans perceive, navigate, and interact with the [[cybergraph]]

## first principles

- the interface is a lens — [[cyb]] refracts the [[cybergraph]] into something a human can perceive and act on
- emotion as signal — components carry [[emotion]], a color-coded signal layer computed from [[cyberank]], [[karma]], and context
- everything is a [[particle]] — text, image, video, audio, pdf, 3d model. the renderer adapts, the interface stays consistent
- the [[neuron]] is the user — every action traces to a neuron, every view is from a neuron's perspective
- glass as medium — translucent panes that layer and compose, defining spatial hierarchy

## composition model

four levels, each built from the previous:

```
atoms → molecules → cells → aips
```

### atoms

the smallest visual units. an atom cannot be broken into smaller prysm components — it is a single rendered element with one responsibility. a glass pane, a line of text, a divider line. atoms carry no domain logic. they accept data and emotion, render a visual, and emit events. they look the same on desktop and mobile. they know nothing about neurons, particles, or cyberlinks — that meaning comes from how molecules combine them

5 atoms: surfaces (glass), typography (text), structure (ion, saber), iconography (images)

| atom | description | variants |
|------|-------------|----------|
| [glass](root/glass.md) | surface pane, foundational container | plane, side-button |
| [text](root/text.md) | typography | left, center, right, paragraph |
| [ion](root/ion.md) | icon-label pair | centric, horizontal, input, star, trapezoid |
| [saber](root/saber.md) | accent line and divider | 1px, 2px, horizontal |
| [images](root/images.md) | icon library | 16, 20, 32, 48, 96 px |

### molecules

where atoms gain meaning. a molecule is two or more atoms composed into a functional unit with a clear interface: what data it takes, what actions it emits, what states it can be in. a neuron-card is a glass + address + counter + ion arranged to show identity. an input is a glass + text + button + saber wired for data entry. the molecule knows its domain — it understands what a neuron is, what a particle looks like, how to display a search result

molecules are grouped by role:
- actions — button, toggle: how you interact
- navigation — hud, tabs, mind (commander): how you move through [[cyb]]
- content — content, display, neuron-card, aip, avatar, adviser, tooltip: how you see data
- identity — address, counter, indicator: how you read state
- input — input, filter, slider: how you enter and refine data
- data — table, bar: how you read structured information
- tags — pill: how you classify and filter
- widgets — brain, sense, sigma, time: persistent sidebar tools

each molecule adapts between desktop and mobile. atoms inside stay identical — the molecule rearranges their layout

| molecule | description | assets |
|----------|-------------|--------|
| [button](root/button.md) | call-to-action (saber + text + saber) | default, double, triple, side |
| [toggle](root/toggle.md) | binary state switch | on, off, star |
| [slider](root/slider.md) | continuous value selector | range, progress |
| [indicator](root/indicator.md) | progress display | partial, full |
| [counter](root/counter.md) | numeric display with emotion | default, danger |
| [address](root/address.md) | neuron identity with hash-bar waveform | big, small |
| [hud](root/hud.md) | heads-up display shell | — |
| [tabs](root/tabs.md) | section navigation | [3](components/1-molecules/tabs/3-items.png) [4](components/1-molecules/tabs/4-items.png) [5](components/1-molecules/tabs/5-items.png) [m](components/1-molecules/tabs/m.3-items.png) |
| [content](root/content.md) | particle renderers by format | [text+L](components/1-molecules/content/text+icon-L.png) [LR](components/1-molecules/content/text+icon-LR.png) [R](components/1-molecules/content/text+icon-R.png) [H3](components/1-molecules/content/H3+icon.png) [num](components/1-molecules/content/number+indicator.png) |
| [display](root/display.md) | content container | [highlight](components/1-molecules/display/highlight.png) [2-line](components/1-molecules/display/highlight-2-lines.png) [empty](components/1-molecules/display/empty-0.62%25.png) |
| [neuron-card](root/neuron-card.md) | neuron identity card | [big](components/1-molecules/neuron/big/default.png) [small](components/1-molecules/neuron/small/default.png) |
| [aip](root/aip.md) | entity card | [2-line](components/1-molecules/aip/2-lines.png) [3-line](components/1-molecules/aip/3-lines.png) [+menu](components/1-molecules/aip/3-lines+menu.png) |
| [avatar](root/avatar.md) | identity strip | [2-line](components/1-molecules/avatar/2-line.png) [chooser](components/1-molecules/avatar/chooser.png) |
| [adviser](root/adviser.md) | contextual hint | [closed](components/1-molecules/adviser/closed.png) [positive](components/1-molecules/adviser/opened-positive.png) [negative](components/1-molecules/adviser/opened-negative.png) [neutral](components/1-molecules/adviser/opened-neutral.png) [particle](components/1-molecules/adviser/particle.png) |
| [input](root/input.md) | data entry | [L](components/1-molecules/input/default/L.png) [R](components/1-molecules/input/default/R.png) [LR](components/1-molecules/input/default/LR.png) [dropdown](components/1-molecules/input/default/dropdown.png) |
| [filter](root/filter.md) | result filtering | [3-items](components/1-molecules/filter/3-items.png) [wide](components/1-molecules/filter/wide.png) |
| [table](root/table.md) | data grid | [line](components/1-molecules/table/line.png) [row-L](components/1-molecules/table/row-L.png) [row-R](components/1-molecules/table/row-R.png) |
| [bar](root/bar.md) | saber+ion composite | [1-sided](components/1-molecules/saber+ion/button/1-sided.png) [bi-sided](components/1-molecules/saber+ion/button/bi-sided.png) |
| [time-widget](root/time-widget.md) | personal history | [time](components/1-molecules/widgets/time.png) |
| [pill](root/pill.md) | tag badge | [green](components/1-molecules/pill/green.png) [red](components/1-molecules/pill/red.png) [blue](components/1-molecules/pill/blue.png) [white](components/1-molecules/pill/white.png) |
| [tooltip](root/tooltip.md) | floating contextual popup | — |
| [mind](root/mind.md) | commander (bottom action bar) | — |

### cells

a cell owns a region of the screen. it composes molecules into a coherent experience: the oracle-cell arranges a search input, content feed, and aip selector into a discovery flow. a cell manages layout, scroll behavior, and data flow between its molecules. cells are the unit of screen real estate — an aip is one or more cells filling the viewport

| cell | description |
|------|-------------|
| [portal-cell](root/portal-cell.md) | onboarding: citizenship, gift, hud, cyb-map |
| [cyberver-cell](root/cyberver-cell.md) | learning: hud, mentors, learner, stats, faculties |
| [oracle-cell](root/oracle-cell.md) | search: aip selector, mind, particle display, content feed |

### aips

the top level. an aip (autonomous intelligent program) is a full-screen application built from cells. each aip is a complete experience: search (oracle), file management (brain), onboarding (portal), messaging (sense), wallet (sigma). aips own their routing, state management, and connection to the [[cybergraph]]. they are what the user sees and names

[[cyb/oracle]] · [[cyb/brain]] · [[cyb/portal]] · [[cyberver]] · [[cyb/sense]] · [[cyb/sigma]] · [[teleport]] · [[sphere]] · [[warp]] · [[aos/hfr]]

## properties

| property | values |
|----------|--------|
| color | dark base, light foreground. 7 acid emotion colors from [[color-emotion spectrum]]: red (anger), orange (disgust), yellow (surprise), green (joy), blue (interest), indigo (sadness), violet (fear). see [COLOR_AUDIT.md](COLOR_AUDIT.md) |
| typography | monospace, hierarchy through size: h1(32) h2(24) h3(20) body(16) caption(14) micro(12) |
| spacing | 8px grid. padding: 8, 16, 24. gaps: 24, 32, 48 |
| motion | 150ms ease state changes, 200ms ease-out glass depth. no decorative animation |
| responsive | desktop (>768) / mobile (<=768). atoms identical, molecules rearrange, commander always at bottom. see [responsive](root/responsive.md) |
| time | UTC 0, Unix epoch (1970) = year 0 of machine time. e.g. 2026 = year 56 |

## interfaces

every component exposes:

- inputs: data, [[emotion]], context
- outputs: action, state change, [[cyberlink]]
- states: default, hover, active, disabled (+ loading, error, empty, expanded for stateful components)

emotion overlays any state with a color signal

## source tree

```
root/              knowledge graph pages (optica subgraph)
svg/
  atoms/           SVG atoms with acid palette (32 files)
components/
  0-atoms/         atom PNG assets from Sketch
    images/        icon library (16x16)
  1-molecules/     molecule PNG assets from Sketch
```

## status

5 atoms. 22 molecules. 3 cells. 10 aips. 17 atom SVGs. 59 molecule SVGs. acid color palette (17 tokens). responsive rules defined

## license

don't trust. don't fear. don't beg.
