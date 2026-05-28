---
tags: prysm, cyb, chroma
alias: settings, configuration
crystal-type: pattern
crystal-domain: cyber
---

settings cell — accessible from [[ava]]

system configuration of [[cyb]]. manage keys, backends, networks, tokens, channels, hotkeys, and AI models. left sidebar menu with 8 sections

not a chrome slot — opens in [[spacetime]] when triggered from [[ava]] (avatar zone → "Settings")

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
```

## sections

### Keys

manage neuron keypairs and avatar access

```
glass [fill × auto, depth midground]
  raster [hardware key image]
  pill [green, "active"]
  text [caption, "key"] + pill [neutral, "cybergirl"]
  text [caption, "at path"] + pill [neutral, "44/118/0/0/0"]
  text [caption, "from neuron"] + address [small, with hash bars]
  text [caption, "gives"] + pill [green, "write"] + text [caption, "access to avatars:"]
```

commander: "add new key"

### Drive

backend status and IPFS configuration

```
text [h3, "Backend status"]
  db started (queries: 0)
  ipfs started (total: 0 | db - 0 node - 0 gateway - 0)
  rune started
  ml started — featureExtractor: ready
  sync started — transactions: listen, log cyberlinks: active, particles: active
button [green saber frame, "download logs"]
input [text, "enter sentence..."] + button ["Search by embedding"]
--- backend config ---
text [caption, "api"] + input [text, URL] + button ["edit"]
text [caption, "gateway"] + input [text, URL] + button ["edit"]
button ["Reconnect"]
```

### Signer

```
text [h2, "Signer confirmation page"]
toggle ["enabled"]
```

### Tokens

```
table [sortable]
  columns: id ▲ | contract ▲ | channel id ▲ | ticker ▲ | logo ▲ | decimals ▲ | chain id ▲
```

### Networks

```
table [sortable]
  columns: id ▲ | chainId ▲ | name ▲ | logo ▲ | genesis hash ▲ | prefix ▲
```

### Channels

```
table [sortable]
  columns: id ▲ | active ▲ (green dot) | destination chain id ▲ | destination channel id ▲ | source chain id ▲ | source channel id ▲
```

### Hotkeys

```
table
  columns: Hotkey | Page | Description
  rows:
    / | all | Focus commander
    tab, enter | all | action bar keyboard navigation
    f | graph | Toggle graph fullscreen
```

### LLM

```
text [h2, "LLM"]
text [body, "openai/gpt-4o-mini"]
pill [yellow, "GPT-4o-mini"]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): sidebar + content side by side
- $l_2$ ($w_{min} = 20g$): sidebar above content
- $l_3$ ($w_{min} = 10g$, mobile): sidebar collapsed to icons, content full width

## emotion

- sidebar active item: green text + colored icon
- Drive status: green = running, red = stopped
- Keys "active" pill: green
- Channel active dots: green

## ECS

- Entity: settings-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `FoldSet { conformations }`
  - `ActiveSection { keys | drive | signer | tokens | networks | channels | hotkeys | llm }`
  - `BackendStatus { db, ipfs, rune, ml, sync }`
  - `TokenRegistry { list of token entries }`
  - `NetworkRegistry { list of network entries }`
  - `ChannelRegistry { list of channel entries }`
- Systems:
  - `SettingsMenuSystem` handles section navigation
  - `SettingsBackendSystem` manages backend connection, logs, reconnect
  - `SettingsKeySystem` manages keypairs
  - `SettingsRegistrySystem` manages tokens/networks/channels tables
