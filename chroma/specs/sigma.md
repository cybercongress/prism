---
tags: prysm, cyb, chroma
alias: resource, wallet
crystal-type: pattern
crystal-domain: cyber
---

resource chrome — mid-right

**resource**: the economic interface between a [[neuron]] and the [[cybergraph]]. wallet, token balances, portfolio value. Σ widget on the right edge; full wallet cell in spacetime

## core function

sigma shows economic state. the Σ chrome slot shows total portfolio value and reflects balance changes through [[emotion]] color. any chroma can request identity via `(ava, sigma, identity, …)` to get the current neuron's resource state.

## cyberlinks

| receives from | token | meaning |
|---------------|-------|---------|
| ava | identity | neuron changed — reload balances |
| com | send | initiate token transfer |

| sends to | token | meaning |
|----------|-------|---------|
| ava | resource | current balance summary for avatar display |
| spacetime | switch-renderer | open sigma wallet in space zone |
| time | record | log transfers |

## widget layout (chrome slot)

```
glass [fix × fill(mid-right edge), depth overlay]
  stack vertical [align center]
    ion [Σ icon]
    counter [micro, total value]
    pill [emotion — green rising, red falling]
```

## spacetime cell (full wallet)

opened when Σ widget tapped — renders in space zone:

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
      saber [horizontal, g/8]
      ...
```

## tokens

each row: icon | ticker | balance | price | value. pill = share of total portfolio. expandable (>) for sub-tokens or LP details.

inputs: [[CYB]], [[HYDROGEN]], [[BOOT]], [[VOLT]], [[AMPERE]], IBC tokens, staking state, portfolio value
outputs: send → token transfer | stake → delegation | navigate → token detail or [[cyberver]]

## pages (full app)

- [[coins]]: fungible token balances and transfers
- [[cards]]: unique tokens and collectibles
- [[scores]]: reputation and contribution metrics
- [[badges]]: achievement tokens

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
| pill progress | green | proportion |
| Σ widget glow | green increase, red decrease | balance change |

## states

| state | visual | trigger |
|-------|--------|---------|
| viewing | token list | default |
| sending | amount input + recipient in commander | tap send |
| receiving | QR code / address display | tap receive |
| loading | skeleton rows | fetching balances |
| locked | "prove address" in commander | wallet not connected |

## ECS

- Entity: sigma-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `FoldSet { conformations }`
  - `TokenBalances { list of (icon, ticker, balance, price, value, proportion) }`
  - `TotalPortfolio { value }`
  - `NeuronAddress { bech32 }`
  - `WalletState { locked | unlocked }`
- Systems:
  - `SigmaFetchSystem` reads token balances from chain
  - `SigmaSendSystem` handles send flow
  - `SigmaPortfolioSystem` computes proportions and total
