---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

staking cell in [[prysm]]

the staking interface of [[cyb/sphere]]. neurons delegate tokens to validators, earn rewards, and participate in consensus. two views: validator list and validator detail

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. full page experience for [[cyb/sphere]]

## sizing

fill × fill (occupies entire space zone)

## structure

### validator list (main view)

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    --- summary ---
    stack horizontal [gap 0]
      counter [available] | saber [vertical] | counter [staked] | saber [vertical] | counter [rewards] | saber [vertical] | counter [APR, %]
    --- tabs ---
    tabs [power | apr | my heroes]
    --- table header ---
    table header [id, moniker, Power, APR, Your bond]
    --- grouped rows ---
    stack vertical [gap 0]
      text [caption, "imperator", collapsible]
      table row [1, avatar + Bro_n_Bro, 15.43%, 1.82%]
      text [caption, "jedi", collapsible]
      table row [2, avatar + saturnia, 12.10%, 1.72%]
      table row [3, avatar + Citizen Web3, 11.65%, 1.82%]
      text [caption, "padawan", collapsible]
      ...
      text [caption, "heroes", collapsible]
      ...
```

### validator detail (on tap row)

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    --- header ---
    stack horizontal [gap 0]
      counter [staked] | saber [vertical] | glass [validator avatar circle + name] | saber [vertical] | counter [rewards]
    --- tabs ---
    tabs [main | rumors | leadership | search]
    --- content (main tab) ---
    glass [fill × auto, depth midground]
      stack vertical [gap g]
        stack horizontal: text [caption, "Operator Address:"] + text [body, address]
        stack horizontal: text [caption, "Address:"] + address [small, with hash bars]
        stack horizontal: text [caption, "website:"] + text [body, link]
        text [caption, "Details:"] 
        text [body, description]
    --- pills ---
    stack horizontal [gap g/2, wrap]
      pill [emotion, "1.82 % APR"]
      pill [emotion, "15.43 % Power"]
      pill [emotion, "5 % Commission"]
      pill [emotion, "5.09 % Self Stake"]
      pill [emotion, "94.91 % Delegator Shares"]
      pill [emotion, "3232 Delegators"]
```

### validator detail: rumors tab

delegation/undelegation activity for this validator

```
table [sortable]
  columns: status ▲ (✓/✗) | type ▲ (Delegate/Undelegate) | timestamp ▲ | tx (hash, green, link) | action
  action expanded: delegator (neuron name, link) | validator (name) | amount (counter, green)
```

commander: "Bro_n_Bro" (validator name) | Unstake | Restake | Stake — action buttons for this validator

### validator detail: leadership tab

validator's own governance and leadership activity. same table structure as rumors but filtered to validator's own transactions

### validator detail: search tab

particles linked by this validator — validator's knowledge contributions

```
stack vertical
  filter bar [all | star | delete | avatar icons | "0 → 1" | "1 particles"]
  stack vertical [gap g]
    glass [fill × auto, depth midground] — per particle
      text [body, particle name]
      content [particle preview]
```

commander: "add keywords, hash or file" + "Cyberlink" + "edit in studio"

## fold

$\mathcal{F}$:

validator list:
- $l_1$ ($w_{min} = 40g$): all columns visible, summary counters in row
- $l_2$ ($w_{min} = 20g$): id + moniker + Power + APR (hide Your bond)
- $l_3$ ($w_{min} = 10g$, mobile): moniker + Power only, summary stacked vertically

validator detail:
- $l_1$ ($w_{min} = 40g$): header + tabs + key-value pairs + pill row
- $l_2$ ($w_{min} = 20g$): header stacked, pills wrap to multiple rows
- $l_3$ ($w_{min} = 10g$, mobile): compact, key-value stacked vertically

## emotion

| element | emotion | trigger |
|---------|---------|---------|
| available counter | green if > 0, white if 0 | tokens available |
| staked counter | green | tokens delegated |
| rewards counter | green if > 0 | rewards pending |
| validator pills | [[emotion]] computed from value relative to network average: green = above average (good for neuron), yellow = around average, red = below average or risky | each metric evaluated independently |
| validator row | neutral by default, green highlight on "my heroes" tab if delegated | delegation state |

## states

| state | visual | trigger |
|-------|--------|---------|
| list view | validator table | default |
| detail view | validator profile | tap on row |
| delegating | amount input in commander + confirm button | tap delegate |
| undelegating | amount input + warning adviser (red, "21 day unbonding") | tap undelegate |
| loading | skeleton rows | fetching validator set |

## interaction

- tap row → navigate to validator detail
- tap tab (power/apr/my heroes) → re-sort table
- tap group header (imperator/jedi/padawan/heroes) → collapse/expand group
- tap delegate button (in detail) → delegation flow via commander input
- table sort by Power or APR column
- back arrow in commander → return to list from detail

## where in [[prysm/grid]]

space zone. commander adapts: shows "Connect" button when no wallet, delegate/undelegate buttons in validator detail

## 3D

renders at ambient $p_z$. in 3D, validators could position by power — high-power validators closer to neuron (gravity from stake weight)

## ECS

- Entity: sphere-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `SphereView { list | detail }`
  - `ValidatorSet { list of (id, moniker, avatar, power, apr, rank_group, bond) }`
  - `SelectedValidator { validator_id }` — for detail view
  - `ActiveTab { power | apr | my_heroes }`
  - `StakingSummary { available, staked, rewards, apr }`
- Systems:
  - `SphereFetchSystem` reads validator set from chain
  - `SphereSortSystem` sorts by active tab criterion
  - `SphereGroupSystem` groups validators by rank (imperator, jedi, padawan, heroes)
  - `SphereDelegationSystem` handles delegate/undelegate flow
