---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

hydrogen fuel rod cell in [[prysm]]

the energy management interface of [[cyb/hfr]]. neurons invest [[hydrogen]] to mint [[ampere]] (bandwidth) or [[volt]] (focus). choose resource type, set amount and lock period, monitor energy ratio and active rods

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. full page experience for [[cyb/hfr]]

## sizing

fill × fill (occupies entire space zone)

## structure

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    --- summary ---
    stack horizontal [gap 0]
      counter [A amount, ion ampere] | saber [vertical] | counter [V amount, ion volt] | saber [vertical] | counter [W, "My Energy"]
    --- resource tabs ---
    tabs [A (ampere) | V (volt)]
    --- mint section ---
    glass [fill × auto, depth midground]
      stack horizontal [gap 3g]
        stack vertical [fill, gap 2g]
          counter [h2, current resource amount]
          --- liquid ---
          text [caption, "Liquid"]
          counter [micro, liquid amount, ion H]
          slider [range, 0..max H, "amount to invest"]
          --- frozen ---
          text [caption, "Frozen"]
          counter [micro, frozen amount, ion H]
          slider [range, 1 day..2083 days, "lock period"]
        --- e-ratio (battery) ---
        stack vertical [fix(6g), gap g/2]
          text [caption, "E-Ratio"]
          glass [fix(6g) × fix(20g), corner-radius g, depth midground] — battery outline
            glass [fix(5g) × fix(level × 19g), corner-radius g/2, emotion tint, align bottom] — fill from bottom up
          text [h3, "0%"]
    --- rod table ---
    tabs [State | Unfreezing | Supplied | Received]
    table [columns: rod data per active tab]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): summary + mint section with e-ratio side by side + rod table
- $l_2$ ($w_{min} = 20g$): summary stacked, mint section full width, e-ratio below sliders
- $l_3$ ($w_{min} = 10g$, mobile): all stacked vertically, compact

## emotion

| element | emotion | trigger |
|---------|---------|---------|
| A counter | green if > 0, white if 0 | ampere available |
| V counter | green if > 0, white if 0 | volt available |
| W counter | green | total energy |
| E-Ratio pill | green (healthy), yellow (low), red (depleted) | energy ratio relative to needs |
| liquid slider | green | available to invest |
| frozen slider | yellow | locked, cannot withdraw |

## states

| state | visual | trigger |
|-------|--------|---------|
| viewing | summary + mint controls + rod table | default |
| minting | amount and period set, confirm in commander | tap mint |
| unfreezing | unfreeze confirmation | tap unfreeze on rod |
| loading | skeleton | fetching energy data |
| no data | icon + "no data" in rod table | no active rods |

## interaction

- tap A/V tab → switch between ampere and volt minting
- drag liquid slider → set H amount to invest
- drag frozen slider → set lock period (1 day to 2083 days)
- commander shows "Connect" or mint action button
- tap rod table tab → filter rods by state
- tap rod row → rod detail

## where in [[prysm/grid]]

space zone. commander adapts: shows mint/unfreeze actions

## 3D

renders at ambient $p_z$

## ECS

- Entity: hfr-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `ActiveResource { ampere | volt }`
  - `EnergySummary { a_amount, v_amount, w_energy }`
  - `MintParams { h_amount, lock_period }`
  - `ERatio { value }` — energy ratio 0.0-1.0
  - `RodTable { list of rod data }`
  - `RodTableTab { state | unfreezing | supplied | received }`
- Systems:
  - `HfrFetchSystem` reads energy state from chain
  - `HfrMintSystem` handles mint flow
  - `HfrSliderSystem` updates `MintParams` from slider values
