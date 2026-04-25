---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

transfer cell in [[prysm]]

the token transfer interface of [[cyb/teleport]]. send tokens to neurons, bridge between networks, swap on DEX. left menu: main, Send, Bridge, Swap

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]

## sizing

fill × fill

## sub-pages

### main

hero landing — teleport illustration + 3 cards linking to sub-pages

```
glass [fill × fill, depth background]
  stack horizontal [gap 3g]
    --- left: illustration ---
    raster [teleport animation, starfield]
    text [h1, "communicate"]
    --- right: cards ---
    stack vertical [gap 2g]
      glass [fill × auto, depth midground, padding 2g] — Send card
        text [h3, green, "Send"]
        text [caption, "messages with tokens to friends and aliens"]
        stack horizontal [gap g/2]
          glass × 4 [avatar circles] + ion [robot icon]
      glass [fill × auto, depth midground, padding 2g] — Bridge card
        text [h3, green, "bridge"]
        text [caption, "reliable transfer of tokens from net to net"]
        stack horizontal [gap g/2]
          ion × 2 [network icons] + pill ["+3 networks"]
          ion × 4 [token icons, colored]
      glass [fill × auto, depth midground, padding 2g] — Swap card
        text [h3, green, "swap"]
        text [caption, "truly free exchange with warp dex"]
```

### send

send tokens to a neuron with optional public message

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, align center]
    tabs [send | bridge | swap]
    --- form ---
    input [dropdown, "bostrom", "choose network"]
    input [text, red underline, "choose recipient"]
    stack horizontal [gap g]
      input [number, "0", "choose amount to send"]
      input [dropdown, icon + "BOOT", "choose token to send"]
    counter [body, balance "3 806"]
    counter [body, available "0"]
    --- log scale slider ---
    slider [logScale, 0%..Max, markers: 1%, 2%, 5%, 10%, 20%, 50%, Max]
    --- message ---
    input [text, "type public message", with saber underline]
    content [preview of attached particle]
    --- history ---
    stack vertical [gap g]
      glass [fill × auto, depth midground] — per past send
        text + avatar + amount + status
```

commander: "Send" button

### bridge

IBC transfer between networks

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, align center]
    tabs [send | bridge | swap]
    --- source ---
    stack horizontal [gap g]
      input [number, "0.000", "choose amount to send"]
      input [dropdown, icon + "ATOM", "choose token to send"]
    input [number, balance "0"]
    input [dropdown, icon + "choose", "choose source network"]
    --- log scale slider ---
    slider [logScale, 0.0%..Max]
    --- destination ---
    input [number, "0"]
    input [dropdown, icon + "bostrom", "destination network"]
    --- history ---
    glass [fill × auto, depth midground] — per past bridge
      text ["withdraw"] + avatar [from] + "→" + address [to]
      counter [amount, green] + pill [emotion, "complete"] + text [timestamp]
```

commander: "transfer" button

### swap

token exchange on warp DEX

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, align center]
    tabs [send | bridge | swap]
    --- from ---
    stack horizontal [gap g]
      input [number, "0", "choose amount to swap"]
      input [dropdown, icon + "BOOT", "choose token to swap"]
    counter [balance "3 806"]
    input [dropdown, icon + "warp", "choose dex"]
    --- log scale slider with price indicators ---
    slider [logScale, 0%..Max, with token price circles on track]
    text [caption, "slippage: 0%"]
    --- to ---
    stack horizontal [gap g]
      input [number, "0", "choose amount to receive"]
      input [dropdown, icon + "H", "choose token to receive"]
    counter [balance "15 495"]
    --- history ---
    glass [fill × auto, depth midground] — per past swap
      text ["swap"] + ion [from token] + "→" + ion [to token]
      counter [amount, green] + text [timestamp]
```

commander: "Swap" button

## shared UI pattern: log scale slider

all three sub-pages use the same logarithmic percentage slider:

```
glass [fill × fix(8g)]
  glass [fix(6g) × fix(6g), corner-radius 3g, depth midground] — diamond handle with arrows
  saber [horizontal, fill, with dot markers at: 1%, 2%, 5%, 10%, 20%, 50%, Max]
  text [micro, percentage labels]
```

handle is a diamond shape (rotated glass square). dots on track mark logarithmic positions. "Max" = green text at right end

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): full form with slider + history side by side
- $l_2$ ($w_{min} = 20g$): form stacked, history below
- $l_3$ ($w_{min} = 10g$, mobile): compact form, history collapsed

## emotion

| element | emotion | trigger |
|---------|---------|---------|
| input underline | red when empty/invalid, green when valid | validation |
| amount counter | green | balance available |
| history status | green (complete), yellow (pending), red (failed) | tx state |
| slider handle | white/green | position |

## states

| state | visual | trigger |
|-------|--------|---------|
| form | empty form ready for input | default |
| filling | inputs populated, slider adjusted | user input |
| confirming | preview in commander | ready to submit |
| processing | loading animation | tx submitted |
| complete | success adviser (green) | tx confirmed |

## where in [[prysm/grid]]

space zone. left menu: main, Send, Bridge, Swap

## 3D

renders at ambient $p_z$

## ECS

- Entity: teleport-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `ActiveSubPage { main | send | bridge | swap }`
  - `TransferParams { network, recipient, amount, token, message }`
  - `BridgeParams { source_network, dest_network, amount, token }`
  - `SwapParams { from_token, to_token, amount, dex, slippage }`
  - `TransferHistory { list of past transfers }`
- Systems:
  - `TeleportSendSystem` handles send flow
  - `TeleportBridgeSystem` handles IBC bridge
  - `TeleportSwapSystem` handles DEX swap
  - `TeleportHistorySystem` fetches past transfers
