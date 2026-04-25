---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

neuron dashboard cell in [[prysm]]

the personal space of a [[neuron]]. shows identity, stats, graph, social connections, energy, staking, badges, karma, and soul scripts. the robot is who the neuron IS — all other cells are what the neuron DOES

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. full page experience. accessible through avatar zone or by navigating to /@neuron_name

## sizing

fill × fill (occupies entire space zone)

## persistent header

always visible across all sub-pages:

```
glass [fill × auto, depth midground]
  stack horizontal [gap 2g]
    --- identity ---
    stack vertical [align center]
      glass [fix(8g) × fix(8g), corner-radius 4g] — avatar image (circle)
      text [body, "cybergirl.moon"]
      text [micro, "level 1"]
    --- address ---
    stack vertical [align center]
      address [big, with hash bars and sound]
      text [caption, "765 days"] — age in machine time
```

## stats sidebar

left column, present on all sub-pages. each row = link to corresponding sub-page:

```
stack vertical [fix(20g) × auto, gap g]
  ion + text + counter [Log, 0 tweets]
  ion + text + counter [Energy, 0 watt]
  ion + text + counter [Swarm, 0 learners]
  ion + text + counter [Security, 20 reward]
  ion + text + counter [Badges, 0 tokens]
  ion + text + counter [Karma, 0]
  ion + text + counter [Soul, 0]
```

tap item → navigates to that sub-page. active item highlighted

## left navigation menu

```
stack vertical [gap g/2]
  ion + text [main]
  ion + text [sense]
  ion + text [brain]
  ion + text [time]
  ion + text [sigma]
```

## sub-pages

### main

neuron profile overview. header + stats sidebar + feed area

```
--- right side ---
glass [fill × auto, depth midground]
  text [body, "no feeds"] — or feed of neuron's cyberlinks
```

commander shows "enter password to unlock" + "Unlock"

### Log (tweets)

feed of neuron's published [[particles]] — cyberlinks created by this neuron

### Energy

energy dashboard for this neuron — personal view of [[cyb/hfr]]

```
--- formula ---
stack horizontal [gap g]
  glass [fix(8g) × fix(8g), depth midground, emotion green tint]
    counter [h2, "0 W"]
    text [caption, "Energy"]
  text [h2, "+"]
  glass [fix(8g) × fix(6g), depth midground]
    counter [h2, "1 764 W"]
    text [caption, "Income"]
  text [h2, "-"]
  glass [fix(8g) × fix(6g), depth midground]
    counter [h2, "0 W"]
    text [caption, "Outcome"]
  text [h2, "="]
  glass [fix(8g) × fix(6g), depth midground]
    counter [h2, "1 764 W"]
    text [caption, "Free Energy"]

text [body, "Energy (W) is the product of amperes and volts"]

--- balance ---
text [h3, "Balance:"]
stack horizontal [gap g]
  glass: counter [0 A (ampere)]
  text [h2, "×"]
  glass: counter [0 V (volt)]
  text [h2, "="]
  glass: counter [0 W]

--- rod table ---
tabs [State ▲ | Unfreezing ▲ | Supplied ▲ | Received ▲]
table or "no data"
```

### Swarm

social connections — friends, following, followers

```
stack vertical [gap 3g]
  --- Friends ---
  text [h3, "Friends"]
  grid [avatar icons of mutual connections] or "no friends"
  --- Following ---
  text [h3, "Following"]
  grid [avatar icons] or "no following"
  --- Followers ---
  text [h3, "Followers"]
  grid [avatar icons] or "no followers"
```

### Security

personal staking — my heroes (validators I delegate to)

```
table [sortable]
  columns: Validator ▲ | Unbondings ▲ | Rewards ▲ | Amount ▲
  rows: delegations to validators
```

### Badges

earned tokens/NFTs — reputation markers

```
table [sortable]
  columns: Discipline ▲ | TOCYB ▲ | BOOT ▲
  rows: badge data or "no data"
```

### Karma

reputation score visualization (under construction — mushroom placeholder)

```
text [h1, "the page is under construction"]
raster [mushroom image]
```

future: karma breakdown, history, rank position

### Time

full transaction history for this neuron

```
table [sortable]
  columns: status ▲ (✓/✗) | type ▲ (icon + label) | timestamp ▲ | tx (hash, green, link) | action
  rows:
    ✓ | IBC Ack Packet | 24 days ago | BF4537...C8B976 | ibc.core.channel.v1.MsgAcknowledgement
    ✓ | IBC Transfer | 24 days ago | 5D0656...3CF12A | from/to/channel/token/amount (expandable)
    ✓ | Receive | 31 days ago | CA3867...7F8EF2 | from: mastercyb, to: cybergirl, amount: 42
    ✓ | Send | 31 days ago | FB279E...5DB798 | from: cybergirl, to: mastercyb, amount: 1
    ✗ | Cyberlink | 31 days ago | B125B9...E4F9AA | neuron: cybergirl, from: CID, to: CID
```

action column expands inline for IBC details (channel, timeout), send/receive (from/to/amount), cyberlinks (particle CIDs). differs from [[prysm/time-widget]]: widget = compact last events, this = full sortable history

### Sigma (inside robot)

personal token balances scoped to this neuron

### Soul

cybscript editor — programmable neuron behavior

```
toggle [cybscript enabled]
glass [fill × auto, depth midground]
  text [code editor, monospace, syntax highlighted]
    // cybscript code
    pub async fn moon_domain_resolver() {
      let nickname = cyb::context.user.nickname;
      let rng = rand::WyRand::new();
      return content_result('Hello, ${nickname}');
    }
```

commander shows "test cybscript" + "reset to default"

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): header + sidebar + content side by side
- $l_2$ ($w_{min} = 20g$): header stacked, sidebar above content
- $l_3$ ($w_{min} = 10g$, mobile): compact header, sidebar collapsed to icons, content full width

## emotion

| element | emotion | trigger |
|---------|---------|---------|
| stats counters | green if > 0, white if 0 | value state |
| Security row | green (has rewards) | reward pending |
| Energy formula | green tint on Energy box | energy available |
| address hash bars | full acid palette | address identity |
| Karma | under construction | — |

## states

| state | visual | trigger |
|-------|--------|---------|
| locked | "enter password to unlock" in commander | wallet not connected |
| unlocked | full functionality | password entered |
| viewing own | edit capabilities (soul editor, customize) | own neuron |
| viewing other | read-only profile | another neuron's address |

## interaction

- tap stats sidebar item → navigate to sub-page
- tap address → play melody + copy
- tap left menu item → switch navigation context
- soul editor: edit cybscript + test + reset

## where in [[prysm/grid]]

space zone. accessible via avatar zone tap or direct URL /@neuron_name

## 3D

renders at ambient $p_z$. in 3D, the neuron's avatar could be a 3D object with personal graph orbiting around it

## ECS

- Entity: robot-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `ActiveSubPage { main | log | energy | swarm | security | badges | karma | soul }`
  - `NeuronIdentity { address, name, level, age, avatar_cid }`
  - `NeuronStats { log_count, energy_watt, swarm_learners, security_reward, badges_tokens, karma, soul }`
  - `IsOwnNeuron { bool }` — determines edit capabilities
- Systems:
  - `RobotMenuSystem` handles sidebar navigation
  - `RobotStatsSystem` fetches neuron stats
  - `RobotEnergySystem` fetches energy balance
  - `RobotSwarmSystem` fetches social graph (friends, following, followers)
  - `RobotSecuritySystem` fetches delegations
  - `RobotSoulSystem` handles cybscript editing, testing, deployment
