---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

settings cell in [[prysm]]

system configuration of [[cyb]]. manage keys, backends, networks, tokens, channels, hotkeys, and AI models. left sidebar menu with 8 sections

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. accessible via "Settings" link in avatar zone

## sizing

fill × fill

## structure

```
glass [fill × fill, depth background]
  stack horizontal [gap 0]
    --- left: settings menu ---
    stack vertical [fix(20g) × auto, gap 2g]
      ion + text [Keys]
      ion + text [Drive]
      ion + text [Signer]
      ion + text [Tokens]
      ion + text [Networks]
      ion + text [Channels]
      ion + text [Hotkeys]
      ion + text [LLM]
    --- right: active section content ---
    glass [fill × fill, depth midground, overflow scroll]
      (depends on active section)
```

## sub-pages

### Keys

manage neuron keypairs and avatar access

```
text [h2, "Keys"]
glass [fill × auto, depth midground]
  stack horizontal [gap 3g]
    raster [key illustration — hardware key image]
    pill [green, "active"]
  stack vertical [gap g]
    text [caption, "key"] + pill [neutral, "cybergirl"]
    text [caption, "and located at the path"] + pill [neutral, "44/118/0/0/0"]
    text [caption, "from neuron"] + address [small, with hash bars]
    text [caption, "gives"] + pill [green, "write"] + text [caption, "access to avatars:"]
    stack horizontal [gap g]
      ion [avatar icon] + text [body, "cybergirl"] + text [caption, "main"]
```

commander: "add new key"

### Drive

backend status and IPFS configuration

```
text [h2, "drive"]
glass [fill × auto, depth midground, padding 2g]
  text [body, "this is tech preview of cyb brain..."]
  text [body, feature list: log links, connect ipfs, sync pins, import txs, query datalog]
text [h3, "Backend status"]
  text [code style]:
    db started (queries: 0)
    ipfs started (total: 0 | db - 0 node - 0 gateway - 0)
    rune started
    ml started — featureExtractor: ready - Xenova/all-MiniLM-L6-v2
    sync started — transactions: listen, log cyberlinks: active, particles: active
button [green saber frame, "download logs"]
--- embedding search ---
input [text, "enter sentence..."]
button ["Search by embedding"]
input [textarea, "Enter your query here..."]
--- backend config ---
button ["Run script"] + input [dropdown, "default commands..."]
button ["export"] + button ["import"]
stack vertical:
  text [caption, "api"] + input [text, URL] + button ["edit"]
  text [caption, "gateway"] + input [text, URL] + button ["edit"]
  text [caption, "id"] + text [body, "..."]
  text [caption, "agent version"] + text [body, "..."]
  text [caption, "repo size"] + text [body, "..."]
button ["Reconnect"]
```

### Signer

transaction signing configuration

```
text [h2, "Signer confirmation page"]
toggle ["enabled"]
```

### Tokens

hub token registry — sortable table

```
text [h2, green, "hub tokens"] + ion [link icon]
table [sortable]
  columns: id ▲ | contract ▲ | channel id ▲ | ticker ▲ | logo ▲ | decimals ▲ | chain id ▲
  rows:
    1 | native/boot | | BOOT | green icon | 0 | bostrom
    2 | native/hydrogen | | H | gray icon | 0 | bostrom
    3 | ibc/13B2C...FFED0B | channel-2 | OSMO | blue icon | 6 | bostrom
    ...
```

### Networks

hub network registry — sortable table

```
text [h2, green, "hub networks"] + ion [link icon]
table [sortable]
  columns: id ▲ | chainId ▲ | name ▲ | logo ▲ | genesis hash ▲ | prefix ▲
  rows:
    1 | bostrom | bostrom | green icon | QmYuby...mJCipr | bostrom
    2 | space-pussy | space-pussy | purple icon | QmTR1k...pPDnH7 | pussy
    3 | cosmoshub-4 | cosmos | blue icon | Qmc54D...mTaVig | cosmos
    ...
```

### Channels

IBC channel registry — sortable table

```
text [h2, green, "hub channels"] + ion [link icon]
table [sortable]
  columns: id ▲ | active ▲ (green dot) | destination chain id ▲ | destination channel id ▲ | source chain id ▲ | source channel id ▲
  rows:
    4 | ● | space-pussy | channel-0 | bostrom | channel-11
    6 | ● | desmos-mainnet | channel-6 | bostrom | channel-13
    11 | ● | osmosis-1 | channel-95 | bostrom | channel-2
    ...
```

### Hotkeys

keyboard shortcut reference

```
table
  columns: Hotkey | Page | Description
  rows:
    / | all | Focus commander
    tab, enter | all | action bar keyboard navigation
    f | graph | Toggle graph fullscreen
```

### LLM

AI model configuration

```
text [h2, "LLM"]
text [body, "openai/gpt-4o-mini"]
text [caption, "selection in work in progress"]
pill [yellow, "GPT-4o-mini"]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): sidebar + content side by side
- $l_2$ ($w_{min} = 20g$): sidebar above content (stacked)
- $l_3$ ($w_{min} = 10g$, mobile): sidebar collapsed to icons, content full width

## emotion

- sidebar active item: green text + colored icon
- Drive status indicators: green = running, red = stopped
- Keys "active" pill: green
- Channel active dots: green

## states

| state | visual | trigger |
|-------|--------|---------|
| browsing | section content visible | default |
| editing | input fields editable | tap "edit" on config values |
| reconnecting | loading state | tap "Reconnect" |

## where in [[prysm/grid]]

space zone. accessible via "Settings" in avatar zone

## ECS

- Entity: settings-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `ActiveSection { keys | drive | signer | tokens | networks | channels | hotkeys | llm }`
  - `BackendStatus { db, ipfs, rune, ml, sync }`
  - `KeyList { list of key data }`
  - `TokenRegistry { list of token entries }`
  - `NetworkRegistry { list of network entries }`
  - `ChannelRegistry { list of channel entries }`
  - `HotkeyMap { list of (key, page, description) }`
  - `LlmConfig { provider, model }`
- Systems:
  - `SettingsMenuSystem` handles section navigation
  - `SettingsBackendSystem` manages backend connection, logs, reconnect
  - `SettingsKeySystem` manages keypairs
  - `SettingsRegistrySystem` manages tokens/networks/channels tables
