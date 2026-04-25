---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

DEX cell in [[prysm]]

the decentralized exchange interface of [[cyb/warp]]. manage liquidity pools, create new pools, add and remove liquidity. left menu: main, Add liquidity, Create pool, Sub liquidity

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]

## sizing

fill × fill

## sub-pages

### main

pool overview — summary counters + pool list sorted by filter

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    --- summary ---
    stack horizontal [gap 0]
      counter [My liquidity] | saber [vertical] | counter [Liquidity, total] | saber [vertical] | counter [My share, %] | saber [vertical] | counter [Volume 24h] | saber [vertical] | counter [Avg APR (fees), %]
    --- sort pills ---
    stack horizontal [gap g, align right]
      pill [TVL]
      pill [APR]
      pill [Vol 24h, active]
    --- pool cards ---
    stack vertical [gap 2g]
      glass [fill × auto, depth midground, padding 2g] — per pool
        stack vertical [gap g]
          stack horizontal
            text [caption, "#3"]
            ion × 2 [token pair icons, overlapping]
            text [h3, "BOOT-TOCYB"]
            counter [body, TVL value, right-aligned]
          --- token rows ---
          stack horizontal: text [body, green, "BOOT"] + counter [balance] + counter [price] + counter [value]
          stack horizontal: text [body, blue, "TOCYB"] + counter [balance] + counter [price] + counter [value]
          stack horizontal: text [caption, "Vol 24h"] + counter [value]
          stack horizontal: text [caption, "APR (fees)"] + counter [%, right-aligned]
```

### Add liquidity

add tokens to existing pool — two token inputs with swap arrow

```
glass [fill × fill, depth background]
  stack vertical [gap 2g, align center]
    tabs [Add liquidity | Create pool | Sub liquidity]
    --- token A ---
    text [caption, "Available"] + text [caption, "..."]
    stack horizontal [gap g]
      ion [token icon]
      input [dropdown, "BOOT"]
    input [number, "0"]
    --- swap direction ---
    ion [4g, diamond arrows ⇅]
    --- token B ---
    text [caption, "Available"]
    stack horizontal [gap g]
      ion [token icon]
      input [dropdown, "H"]
    input [number, "0"]
```

commander: "Connect" (or "Add" when filled)

### Create pool

create new liquidity pool — same layout as Add liquidity but creates a new pair

```
tabs [Add liquidity | Create pool | Sub liquidity]
--- same token pair inputs as Add liquidity ---
```

commander: "Connect" (or "Create" when filled)

### Sub liquidity

remove liquidity from pool

```
tabs [Add liquidity | Create pool | Sub liquidity]
text [caption, "Available"]
text [body, "sub"]
stack horizontal [gap g]
  ion [token icon, orange]
  input [dropdown, "choose"]
input [number, "0"]
```

commander: "Connect" (or "Remove" when filled)

## fold

$\mathcal{F}$:

main:
- $l_1$ ($w_{min} = 40g$): summary + full pool cards with all metrics
- $l_2$ ($w_{min} = 20g$): pool cards with token pair + TVL + APR
- $l_3$ ($w_{min} = 10g$, mobile): pool pair name + TVL only

liquidity forms:
- $l_1$ ($w_{min} = 25g$): centered form
- $l_2$ ($w_{min} = 10g$): full-width form, compact

## emotion

| element | emotion | trigger |
|---------|---------|---------|
| pool TVL counter | green | — |
| APR counter | green if positive | pool performance |
| Vol 24h counter | green | trading activity |
| sort pill active | green border | selected filter |
| token balance | green if > 0, white if 0 | available |

## states

| state | visual | trigger |
|-------|--------|---------|
| browsing | pool list | default |
| pool detail | expanded pool card | tap on pool |
| adding | liquidity form with amounts | Add liquidity tab |
| creating | create pool form | Create pool tab |
| removing | sub liquidity form | Sub liquidity tab |
| locked | "Connect" in commander | wallet not connected |

## interaction

- tap pool card → expand details or navigate to pool
- tap sort pill (TVL/APR/Vol 24h) → re-sort pool list
- fill amounts in liquidity forms → commander shows action button
- diamond arrows ⇅ → swap token order

## where in [[prysm/grid]]

space zone. left menu: main, Add liquidity, Create pool, Sub liquidity

## 3D

renders at ambient $p_z$

## ECS

- Entity: warp-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `ActiveSubPage { main | add_liquidity | create_pool | sub_liquidity }`
  - `PoolList { list of (id, pair, tvl, apr, vol24h, tokens) }`
  - `PoolSort { tvl | apr | vol_24h }`
  - `LiquidityParams { token_a, token_b, amount_a, amount_b }`
  - `WarpSummary { my_liquidity, total_liquidity, my_share, volume_24h, avg_apr }`
- Systems:
  - `WarpPoolSystem` fetches pool data
  - `WarpLiquiditySystem` handles add/create/sub liquidity flows
