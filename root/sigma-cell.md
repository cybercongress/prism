---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

wallet cell in [[prysm]]

the token management interface of [[cyb/sigma]]. shows neuron's token balances, values, and enables send/receive. accessible as robot sub-page and as standalone cell via Σ widget

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]] or as robot sub-page

## sizing

fill × fill (occupies entire space zone)

## structure

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    --- header ---
    stack horizontal [gap 2g]
      ion [6g, Σ sigma icon]
      text [h2, "Sigma"]
      counter [h2, total portfolio value, right-aligned]
    --- address row ---
    glass [fill × fix(6g), depth midground]
      stack horizontal [gap g]
        glass [fix(4g) × fix(4g), corner-radius 2g, green tint] — avatar circle
        address [big, with hash bars]
        counter [body, total value, right-aligned]
    --- token list ---
    stack vertical [gap 0]
      glass [fill × auto, depth midground] — per token
        stack horizontal [gap g]
          ion [2g, token icon, colored]
          text [body, ticker "BOOT"]
          text [caption, ">"] — expandable
          pill [progress, green, proportion of portfolio]
          counter [body, balance "18 800"]
          counter [caption, price "6 .634"]
          counter [body, value "124 736"]
      saber [horizontal, g/8] — row separator
      --- next token ---
      ...
```

## tokens displayed

each token row shows: icon | ticker | balance | price | total value. pill progress bar shows this token's share of total portfolio. some tokens expandable (>) for sub-tokens or LP details

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): full table — icon + ticker + bar + balance + price + value
- $l_2$ ($w_{min} = 20g$): icon + ticker + balance + value (hide bar + price)
- $l_3$ ($w_{min} = 10g$, mobile): icon + ticker + value

## emotion

| element | emotion | trigger |
|---------|---------|---------|
| total portfolio counter | green | — |
| token value | green if increased, red if decreased | balance change |
| pill progress | green | proportion of portfolio |
| Σ widget glow | reflects balance change: green increase, red decrease | — |

## states

| state | visual | trigger |
|-------|--------|---------|
| viewing | token list | default |
| sending | amount input in commander + recipient address | tap send |
| receiving | QR code / address display | tap receive |
| loading | skeleton rows | fetching balances |
| locked | "prove address" in commander | wallet not connected |

## interaction

- tap token row → expand details (sub-tokens, LP positions)
- tap send (commander) → send flow
- tap receive → show address for receiving
- "prove address" → connect wallet

## where in [[prysm/grid]]

space zone (standalone) or robot sub-page (sigma). Σ widget on right edge shows current balance summary

## 3D

renders at ambient $p_z$

## ECS

- Entity: sigma-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `TokenBalances { list of (icon, ticker, balance, price, value, proportion) }`
  - `TotalPortfolio { value }`
  - `NeuronAddress { bech32 }`
  - `WalletState { locked | unlocked }`
- Systems:
  - `SigmaFetchSystem` reads token balances from chain
  - `SigmaSendSystem` handles send flow
  - `SigmaPortfolioSystem` computes proportions and total
