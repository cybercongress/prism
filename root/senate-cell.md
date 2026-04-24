---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

governance cell in [[prysm]]

the governance interface of [[cyb/senate]]. neurons view and vote on proposals that change network parameters. proposals have lifecycle: active (voting) → accepted or rejected

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. full page experience for governance

## sizing

fill × fill (occupies entire space zone)

## structure

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    --- summary ---
    stack horizontal [gap 0]
      counter [Community pool, BOOT amount] | saber [vertical] | counter [% of staked BOOT, link →] | saber [vertical] | counter [Network parameters count, link →]
    --- tabs ---
    tabs [Active | Accepted | Rejected]
    --- proposal cards ---
    stack vertical [gap 2g]
      glass [fill × auto, depth midground, padding 2g] — per proposal
        stack vertical [gap g]
          stack horizontal
            text [body, "#57 Recover Expired IBC Client for Cosmos Hub"]
            ion [2g, settings/type icon]
          text [caption, "Votes:"]
          vote-bar [fill × fix(g), multi-segment pill]
          text [micro, "Time accepted: 01/05/2026, 19:02:11"]
      ...
```

### vote-bar

a specialized pill with multiple colored segments representing vote distribution:

```
glass [fill × fix(g), corner-radius g/2] — track
  stack horizontal [gap 0]
    glass [scale(yes_ratio) × fix(g), #00fe00] — yes
    glass [scale(abstain_ratio) × fix(g), #00acff] — abstain
    glass [scale(no_ratio) × fix(g), #fcf000] — no
    glass [scale(veto_ratio) × fix(g), #ff0000] — veto
```

each segment uses scale sizing — proportional to its share of total votes

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): 3-column layout (Active | Accepted | Rejected side by side)
- $l_2$ ($w_{min} = 20g$): tabs switch between single column of proposals
- $l_3$ ($w_{min} = 10g$, mobile): compact cards, shorter titles

## emotion

| element | emotion | trigger |
|---------|---------|---------|
| Active proposals | #ffffff (white) | voting in progress |
| Accepted proposals | #00fe00 (green) | passed |
| Rejected proposals | #ff0000 (red) | rejected, glass tint red |
| vote-bar yes segment | #00fe00 (green) | yes votes |
| vote-bar abstain | #00acff (blue) | abstain votes |
| vote-bar no | #fcf000 (yellow) | no votes |
| vote-bar veto | #ff0000 (red) | no with veto |

## states

| state | visual | trigger |
|-------|--------|---------|
| browsing | proposal list | default |
| proposal detail | expanded proposal with full description + vote buttons | tap on card |
| voting | vote options in commander (Yes, No, Abstain, NoWithVeto) | tap vote on active proposal |
| loading | skeleton cards | fetching proposals |

### proposal detail (on tap card)

```
glass [fill × fill, depth background, overflow scroll]
  stack vertical [gap 2g, padding 3g]
    --- header ---
    text [h2, "#57 Recover Expired IBC Client for Cosmos Hub"]
    pill [emotion, "passed" / "rejected" / "voting"]
    --- info ---
    glass [fill × auto, depth midground, padding 2g]
      stack vertical [gap g]
        stack horizontal: text [caption, "Proposer:"] + avatar [small, proposer neuron]
        stack horizontal: text [caption, "Type:"] + text [body, proposal type]
        text [caption, "Description:"]
        text [body, full description]
    --- deposit + votes side by side ---
    stack horizontal [gap 2g]
      --- deposit ---
      glass [fill × auto, depth midground, padding 2g]
        pill [emotion, "passed" / status]
        slider [progress, 0..MinDeposit, current deposit]
        text [micro, "Total Deposit 42 000 000 000 BOOT"]
      --- vote results ---
      glass [fill × auto, depth midground, padding 2g]
        stack horizontal [gap g]
          pill [green, "Participation 25%"]
          pill [green, "Yes 50%"]
          pill [red, "No With Veto 25%"]
        stack vertical [gap g/2]
          text [caption, "Yes: 99.99%"] + pill [progress, green, 0.9999]
          text [caption, "No: 0%"] + pill [progress, yellow, 0]
          text [caption, "Abstain: 0%"] + pill [progress, blue, 0]
          text [caption, "No With Veto: 0%"] + pill [progress, red, 0]
    --- detail tabs ---
    tabs [voters | comments | meta]
    --- content per tab ---
    table [voters: neuron address + vote option]
    stack vertical [comments: cyberlink particle CIDs]
    table [meta: key-value parameters]
```

## interaction

- tap tab → filter by status (Active/Accepted/Rejected)
- tap proposal card → open detail view
- tap vote (on active proposal) → commander shows vote options (Yes, No, Abstain, NoWithVeto)
- counters "% of staked BOOT →" and "Network parameters →" are links — tap navigates
- in proposal detail: tap voters/comments/meta tabs to switch content

## where in [[prysm/grid]]

space zone. commander adapts: shows vote buttons when viewing active proposal

## 3D

renders at ambient $p_z$

## ECS

- Entity: senate-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `ActiveTab { active | accepted | rejected }`
  - `Proposals { list of (id, title, type_icon, votes, timestamp, status) }`
  - `VoteDistribution { yes, abstain, no, veto }` — per proposal
  - `GovernanceSummary { community_pool, staked_pct, param_count }`
- Systems:
  - `SenateFetchSystem` reads proposals from chain
  - `SenateVoteSystem` handles vote submission
