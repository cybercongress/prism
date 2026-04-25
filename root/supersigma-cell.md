---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

aggregate wallet cell in [[prysm]]

the total capital view across all avatars and all networks. supersigma = sum of all [[cyb/sigma]] balances. if sigma shows one avatar on one network, supersigma shows everything the [[neuron]] owns everywhere

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. accessible via cyb.ai/sigma

## sizing

fill × fill

## structure

same structure as [[prysm/sigma-cell]] but aggregated:

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    --- header ---
    stack horizontal [gap 2g]
      ion [6g, Σ supersigma icon]
      text [h2, "Supersigma"]
      counter [h2, total value across all avatars, right-aligned]
    --- per avatar section ---
    glass [fill × auto, depth midground] — per avatar/account
      stack horizontal [gap g]
        glass [fix(4g) × fix(4g), corner-radius 2g, green tint] — avatar circle
        address [big, with hash bars]
        counter [body, this avatar's total value, right-aligned]
      --- token list for this avatar ---
      stack vertical [gap 0]
        glass [fill × auto] — per token
          stack horizontal [gap g]
            ion [2g, token icon]
            text [body, ticker]
            text [caption, ">"]
            pill [progress, green, proportion]
            counter [body, balance]
            counter [caption, price]
            counter [body, value]
        saber [horizontal, g/8]
        ...
    --- next avatar ---
    ...
```

when neuron has multiple avatars on different networks (bostrom, osmosis, cosmos), each appears as a separate section with its own address and token list. the header counter sums all sections

## difference from sigma

| | sigma | supersigma |
|---|-------|-----------|
| scope | one avatar, one network | all avatars, all networks |
| header | "Sigma" | "Supersigma" |
| address rows | 1 | N (one per avatar) |
| total | sum of one account | sum of all accounts |
| URL | cyb.ai/@neuron/sigma | cyb.ai/sigma |

## fold

same as [[prysm/sigma-cell]]

## emotion

same as [[prysm/sigma-cell]]. additionally: if any avatar has balance changes, supersigma header reflects the net change (green increase, red decrease)

## states

| state | visual | trigger |
|-------|--------|---------|
| viewing | all avatars listed with balances | default |
| locked | "prove address" per unconnected avatar | wallet not connected |
| loading | skeleton per avatar | fetching |

## ECS

- Entity: supersigma-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `AvatarBalances { list of (avatar_id, address, tokens, total) }`
  - `TotalPortfolio { aggregated_value }`
- Systems:
  - `SupersigmaFetchSystem` fetches balances from all connected avatars across networks
  - `SupersigmaAggregateSystem` computes total portfolio value
