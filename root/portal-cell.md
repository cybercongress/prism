---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

onboarding cell in [[prysm]]

the first screen a new [[neuron]] encounters in [[cyb]]. guides from stranger to neuron — creating identity, claiming gift, learning the interface. every step is a guided transition into the [[cybergraph]]

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. a cell composing molecules into the [[cyb/portal]] experience

## sizing

fill × fill (occupies entire space zone)

## structure

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 3g, padding 3g]
    --- step 1: identity ---
    display [highlight]
      text [h2, "create your neuron"]
      input [name/alias]
      button [confirm, "generate identity"]
      adviser [bar, green, guidance text]
    --- step 2: gift ---
    display [highlight]
      text [h2, "claim your gift"]
      counter [gift amount]
      button [confirm, "claim"]
    --- step 3: orientation ---
    display
      text [body, interface tour]
      adviser [guidance for each zone]
    --- step 4: explore ---
    display
      text [h2, "explore"]
      stack horizontal [gap g]
        aip [oracle card]
        aip [brain card]
        aip [sense card]
        aip [sigma card]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): multi-column step layout with side illustrations
- $l_2$ ($w_{min} = 20g$): single column, steps stacked vertically
- $l_3$ ($w_{min} = 10g$, mobile): single column, compact padding $g$

## emotion

encouraging green throughout — welcoming the new neuron. adviser messages are positive (green tint)

## states

| state | visual | trigger |
|-------|--------|---------|
| step 1 | identity creation form | new neuron, no address |
| step 2 | gift claim | identity created |
| step 3 | interface tour | gift claimed |
| step 4 | aip exploration | tour complete |

## interaction

- fill input + tap button → progress to next step
- adviser guides each step with contextual hints
- each step completes with a confirmed action (identity generation, gift claim)

## 3D

portal-cell renders at ambient $p_z$. in 3D, onboarding steps could be positioned as stepping stones approaching the neuron — each completed step brings closer

## ECS

- Entity: portal-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `OnboardingStep { current: 1..4 }`
- Systems:
  - `PortalStepSystem` manages step progression
  - `PortalIdentitySystem` handles neuron creation
  - `PortalGiftSystem` handles gift claim
