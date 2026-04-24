---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

token explorer cell in [[prysm]]

the token market of the [[cybergraph]]. lists all tokens with balances, prices, and market caps. self-service listing — any [[neuron]] can list a new token. token observatory + portfolio view

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. full page experience for [[cyb/nebula]]

## sizing

fill × fill (occupies entire space zone)

## structure

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    --- header ---
    stack horizontal [gap 3g]
      raster [nebula image, fix(12g) × fix(12g)]
      counter [h2, total portfolio value]
    --- token table ---
    table [sortable by any column]
      columns: icon+ticker | balance | price | market cap
      rows:
        ion [token icon, colored] + text [body, "BOOT"] | counter [481 029 349...] | counter [6, micro .634] | counter [3 191 587...]
        ion [token icon] + text [body, "TOCYB"] | counter [...] | counter [...] | counter [...]
        ion [token icon] + text [body, "H"] | counter [...] | counter [...] | counter [...]
        ...
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): header + full table (icon, ticker, balance, price, market cap)
- $l_2$ ($w_{min} = 20g$): icon + ticker + balance + market cap (hide price)
- $l_3$ ($w_{min} = 10g$, mobile): icon + ticker + market cap only

table: left column (icon + ticker) pinned on horizontal scroll

## emotion

| element | emotion | trigger |
|---------|---------|---------|
| token row | green if balance > 0, dim if 0 | neuron holds this token |
| price counter | green if price up, red if down | price change direction |
| market cap counter | neutral | — |
| total portfolio | green | aggregate value |

## states

| state | visual | trigger |
|-------|--------|---------|
| browsing | token list sorted by market cap | default |
| token detail | expanded row or separate view with charts, trades | tap on row |
| listing | token listing form in space | tap "list token" action |
| loading | skeleton rows | fetching token data |

## interaction

- tap column header → sort by that column (balance, price, market cap)
- tap token row → navigate to token detail (price history, pools, trades)
- tap "list token" (in commander) → open listing flow
- scroll → more tokens
- filter by: native tokens, LP tokens, IBC tokens

## where in [[prysm/grid]]

space zone. commander adapts: shows "list token" action, search for specific token

## 3D

renders at ambient $p_z$. in 3D, tokens with higher market cap position closer to neuron (gravity from market weight)

## ECS

- Entity: nebula-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `TokenList { list of (icon, ticker, balance, price, market_cap, price_change) }`
  - `TotalPortfolio { value }`
  - `SortColumn { ticker | balance | price | market_cap }`
  - `SortDirection { asc | desc }`
- Systems:
  - `NebulaFetchSystem` reads token data from chain + price feeds
  - `NebulaSortSystem` applies sort
  - `NebulaListingSystem` handles self-service token listing flow
