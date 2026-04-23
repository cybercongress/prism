---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

learning cell in [[prysm]]

the education and staking interface of [[cyberver]]. neurons learn, earn, and grow. shows mentors to follow, learner rankings, faculty topics, and staking rewards — knowledge acquisition as an economic game

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. a cell composing molecules into the [[cyberver]] experience

## sizing

fill × fill (occupies entire space zone)

## structure

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    tabs [faculties: math, physics, crypto, biology, ...]
    --- mentor list ---
    stack vertical [gap g]
      neuron-card [mentor 1, karma, reward rate]
      neuron-card [mentor 2, karma, reward rate]
      ...
    --- learner stats ---
    display [highlight]
      counter [earned rewards]
      pill [progress, staking completion level]
    --- delegation table ---
    table [columns: mentor, delegated, rewards, APR]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): tabs + mentor list + stats side by side + table
- $l_2$ ($w_{min} = 20g$): tabs + mentor list above stats, table below
- $l_3$ ($w_{min} = 10g$, mobile): tabs + stacked sections, compact

## emotion

green for profitable delegations, yellow for underperforming, red for negative returns. mentor neuron-cards carry [[karma]] emotion

## states

| state | visual | trigger |
|-------|--------|---------|
| browsing | mentor list + stats visible | default |
| delegating | delegation confirmation with amount input | tap "delegate" on mentor |
| loading | skeleton cards | fetching data |

## interaction

- tap faculty tab → filter mentors by topic
- tap mentor neuron-card → view mentor profile
- tap delegate button → enter delegation flow (amount input in commander)
- table sort by column (rewards, APR)

## 3D

cyberver-cell renders at ambient $p_z$. in 3D, mentor neuron-cards position by gravity — high-karma mentors closer to neuron

## ECS

- Entity: cyberver-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `ActiveFaculty { faculty_id }`
  - `MentorList { list of neuron data }`
  - `LearnerStats { rewards, progress }`
  - `DelegationTable { rows }`
- Systems:
  - `CyberverFacultySystem` reads tab selection, filters mentors
  - `CyberverDelegationSystem` handles delegation flow
