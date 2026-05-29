---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

asset identity atom in [[prysm]]

the primitive for any asset in the [[cybergraph]] — native tokens, IBC assets, synthetic instruments. renders as symbol text with an optional sigil. a leaf in the element tree (leaf type: token). the token atom is pure identity — it knows the asset and nothing else. molecules (bar, pill, sigma displays) compose it into richer contexts

parallel to [[prysm/neuron]]: neuron is actor identity (who), token is asset identity (what)

## protocol role

token is a leaf in the element tree $\mathcal{T}$ (§7 of [[prysm/layout]]). leaf type: token. it has no sub-organelles. its membrane constrains it, it occupies space based on format, membrane places it

## sizing

all values in spatial quanta $g$

| parameter | sizing type | values | default |
|-----------|-----------|--------|---------|
| id | — | token identifier (symbol + chain) | required |
| format | — | sigil-only, symbol-only, sigil+symbol | sigil+symbol |
| size | fix | $2g$, $4g$, $6g$ | $2g$ |

height is always fix $2g$ for symbol-only and sigil+symbol. sigil-only height = size

| format | width | height |
|--------|-------|--------|
| sigil-only | fix $size$ | fix $size$ |
| symbol-only | text width at body | fix $2g$ |
| sigil+symbol | $size$ + $g/2$ gap + text width | fix $2g$ |

## token registry

tokens are resolved by id against the [[cybernet]] token registry. the registry provides: symbol string, chain, contract address, decimal precision, and sigil name (for lookup in the [[prysm/vector]] catalog)

| field | example |
|-------|---------|
| symbol | CYB, BOOT, ETH, ATOM |
| chain | bostrom, cosmoshub, ethereum |
| contract | 0x... or native |
| decimals | 6, 18 |
| sigil | cyb-sigil, eth-sigil, ... |

unknown tokens render as: vector [unknown-token, $size$] + symbol string. no sigil fallback

## color

| condition | color |
|-----------|-------|
| default | #ffffff (symbol text), brand-fixed (sigil) |
| hover | symbol text #d7d7d7, sigil unchanged |
| disabled | #4b4b4d |

sigil colors are brand-fixed (immutable, not [[emotion]]-driven). symbol text is #ffffff by default

## states

| state | visual change | trigger |
|-------|-------------|---------|
| default | sigil + symbol at full opacity | — |
| hover | symbol dims to #d7d7d7 | pointer over |
| active | copy token id to clipboard | tap/click |
| loading | pulse on sigil area | registry resolving |
| unknown | unknown-token vector + raw symbol | unrecognized id |

state transitions: $150\text{ms}$ ease

## 3D

in the 3D extension (§11 of [[prysm/layout]]):

- token renders on a plane at the same $p_z$ as its membrane
- token always faces the neuron (billboard)

## ECS

- Entity: token organelle
- Components:
  - `Sizing { width, height }` — computed from format and size
  - `TokenId { symbol, chain }` — asset identifier
  - `TokenFormat { sigil_only | symbol_only | sigil_and_symbol }`
  - `TokenSize { token }` — size from scale
  - `TokenResolved { Option<TokenMeta> }` — from registry (sigil name, decimals, etc.)
- System: token participates in `OccupySystem` as a leaf — computes size from format; queries registry for sigil resolution
