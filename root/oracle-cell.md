---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

search and network explorer cell in [[prysm]]

the primary interface of [[cyb/oracle]]. search the [[cybergraph]], explore network state, browse blocks and transactions. contains 9 sub-pages accessible through the brain menu (left sidebar)

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. full page experience for [[cyb/oracle]]

## sizing

fill × fill (occupies entire space zone)

## brain menu

left sidebar navigation — present in oracle and robot contexts:

```
stack vertical [fix(25g) × auto, gap g/2]
  ion + text [main]
  ion + text [Particles]
  ion + text [brain]
  ion + text [Stats]
  ion + text [Blocks]
  ion + text [Txs]
  ion + text [Contracts]
  ion + text [Libs]
```

tap item → switches sub-page in space zone. active item highlighted

## sub-pages

### particle-page

page of a single [[particle]] — renders its content and all [[cyberlink]] connections. this is what opens when a neuron navigates to a specific particle

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    --- content render ---
    display [fill × auto, particle content — text, image, video, etc.]
    --- cyberlink filter bar ---
    glass [fill × fix(5g), depth midground]
      stack horizontal [gap 2g, align center]
        --- left: type filters ---
        text [body, green, "all"]
        ion [2g, file type]
        saber [vertical]
        ion [2g, star] + ion [2g, type icon]
        saber [vertical]
        --- neuron avatars ---
        stack horizontal [gap -g/2, overlap]
          ion [3g, avatar 1, circle]
          ion [3g, avatar 2, circle]
          ion [3g, avatar 3, circle]
        saber [vertical]
        --- link direction counters ---
        counter [body, outgoing count] + text [caption, "→"]
        ion [2g, particle icon, green]
        text [caption, "→"] + counter [body, incoming count]
        --- total ---
        counter [body, total] + text [caption, "particles"]
    --- linked particles list ---
    stack vertical [gap 0]
      glass [fill × auto, depth midground] — per linked particle
        stack horizontal [gap g]
          text [body, particle name or particle]
          pill [progress, emotion, rank weight] — right-aligned, vertical fill
      saber [horizontal, g/8]
      ...
```

filter bar allows filtering cyberlinks by: content type (all, file, star), authoring neuron (avatar icons), direction (outgoing → / → incoming). counters show `1617 →` outgoing and `→ 1109` incoming cyberlinks, total particle count

each linked particle row has a rank indicator (pill with fill level) on the right — [[cyberank]] weight of that link

commander: "add keywords, hash or file" + "Cyberlink" + "edit in studio"

### main

hero landing page for search

```
glass [fill × fill, depth background]
  stack vertical [gap 3g, align center]
    tabs [search | ask | learn]
    text [h1, "instantly and censorfree"]
    text [h1, "find and deliver content"] — "find" and "deliver" in green
    text [body, "decentralized ipfs search"]
    text [body, "3 143 650 particles and growing"] — "particles" and "growing" in green
    stack horizontal [gap 2g]
      pill [green, "cyber"]
      pill [green, "donut of knowledge"]
      pill [green, "help"]
```

commander shows "Ask" input

### Particles

feed of all particles in the [[cybergraph]]

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap g]
    glass [fill × fix(6g), depth midground] — per particle
      text [body, particle]
      ion [2g, particle type indicator] — optional, right side
```

tap particle → navigate to particle detail (search results for that particle)

### brain

graph visualization — particles as circles, cyberlinks as lines

```
glass [fill × fill, depth background]
  raster [graph render — particles (blue circles) + cyberlinks (green lines)]
```

in oracle: renders the global cybergraph neighborhood. in robot: renders the neuron's personal graph. commander shows "select 2 particles" + "Change limit" + fullscreen toggle

### Stats

network dashboard — grid of counters

```
glass [fill × fill, depth background]
  grid [4 columns, 4 rows, gap 0]
    counter [Negentropy, bits] | counter [GPU memory, MB] | counter [Transactions →] | counter [Blocks →]
    counter [Cyberlinks] | counter [Particles →] | counter [Neurons] | counter [Inflation, %]
    counter [Staked BOOT, %] | counter [Active heroes] | counter [Community pool] | counter [Proposals]
    counter [Citizens] | counter [Gift claims] | counter [Contracts] | counter [Beta]
```

each counter in its own glass pane, separated by sabers. → indicates link to detail page. counters update in real-time

### Blocks

block explorer table

```
glass [fill × fill, depth background, overflow scroll]
  table [sortable]
    columns: hash ▲ | height ▲ (green, link) | tx ▲ | proposer address ▲ | timestamp UTC ▲
    rows: live block feed, newest first
```

tap height → navigate to block detail. tap proposer → navigate to neuron profile

### Txs

transaction explorer table

```
glass [fill × fill, depth background, overflow scroll]
  table
    columns: status (✓/✗ icon) | tx (hash, green, link) | block height | type (icon + label)
    rows: live tx feed
```

type column can have multiple stacked types per row (e.g. Withdraw Reward × 2). tap tx hash → transaction detail

### Contracts

smart contract explorer

```
glass [fill × fill, depth background, overflow scroll]
  --- summary ---
  stack horizontal [gap 0]
    counter [Contracts count] | counter [Income, BOOT] | counter [Gas used] | counter [Total txs] | counter [Libs →]
  --- table ---
  table [sortable]
    columns: Name | Address (green, link) | Owner (green, link) | Txs | Gas | Income
    rows: sorted by Txs descending
```

tap address → contract detail. tap owner → neuron profile

### Libs

WASM code library (Codes)

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap g]
    glass [fill × auto, depth midground] — per code
      stack horizontal [gap 2g]
        text [h3, "#" + code_id]
        stack vertical
          text [caption, "Creator:"] + text [body, address]
          text [caption, "Checksum:"] + text [body, hash]
          text [caption, "Instances:"] + text [body, count]
```

commander shows "Select .wasm file" + "Upload" button

## fold

$\mathcal{F}$ per sub-page:

| sub-page | $l_1$ ($w_{min}$) | $l_2$ | $l_3$ (mobile) |
|----------|-----|------|-------|
| particle-page | $40g$: content + filter bar + full list | $20g$: content + filter (hide avatars) + list | $10g$: content + list (filter collapsed) |
| main | $40g$: full hero | $20g$: compact hero | $10g$: search only |
| Particles | $25g$: name + type icon | $10g$: name only | same |
| brain | $30g$: full graph | $15g$: reduced node limit | same |
| Stats | $40g$: 4×4 grid | $20g$: 2×4 grid | $10g$: 1×4 stack |
| Blocks | $40g$: all columns | $20g$: hash + height + tx | $10g$: height + tx |
| Txs | $40g$: all columns | $20g$: tx + height + type | $10g$: tx + type |
| Contracts | $40g$: all columns | $20g$: name + txs + income | $10g$: name + txs |
| Libs | $25g$: full card | $10g$: id + creator | same |

## emotion

| element | emotion |
|---------|---------|
| particle rank pill | emotion from [[cyberank]] weight — higher rank = greener fill |
| "all" filter text | #00fe00 green — active filter |
| link direction counters | neutral, green particle icon between them |
| hero text "find" "deliver" | #00fe00 green — action words |
| particle count "growing" | #00fe00 green — positive growth |
| block height links | #00fe00 green — navigable |
| tx status ✓ | #00fe00 green — success |
| tx status ✗ | #ff0000 red — failed |
| stats counters | neutral, → links in green |

## states

| state | visual | trigger |
|-------|--------|---------|
| main | hero page | default, no query |
| searching | results loading in space | query submitted |
| results | ranked particle cards | results arrived |
| sub-page | active sub-page content | brain menu item tapped |

## where in [[prysm/grid]]

space zone. brain menu occupies left part of space (overlay or inset depending on viewport). commander adapts per sub-page: "Ask" for main, "select 2 particles" for brain, "Select .wasm file" + "Upload" for Libs

## 3D

renders at ambient $p_z$. brain graph visualization is inherently 3D-ready — particles and cyberlinks can extend into depth via gravity

## ECS

- Entity: oracle-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `ActiveSubPage { main | particle_page | particles | brain | stats | blocks | txs | contracts | libs }`
  - `SearchQuery { particle }` — for main/search
  - `BrainMenuVisible { bool }`
- Systems:
  - `OracleMenuSystem` handles brain menu navigation
  - `OracleSearchSystem` handles search from commander
  - `OracleParticleSystem` fetches particle content + cyberlinks (incoming/outgoing), computes rank pills
  - `OracleStatsSystem` fetches network stats
  - `OracleBlocksSystem` fetches live blocks
  - `OracleTxsSystem` fetches live transactions
  - `OracleContractsSystem` fetches contract list
  - `OracleLibsSystem` fetches WASM codes + handles upload
