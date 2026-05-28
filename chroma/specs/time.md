---
tags: prysm, cyb, chroma
alias: when, history, unix time, machine time, mt
crystal-type: pattern
crystal-domain: cyber
---

history chrome — bottom-right

**when**: time. discrete [[steps]] that order [[learning]] in the [[cybergraph]]. every [[cyberlink]] carries the [[when]] of its [[finality]] — [[knowledge]] searchable through the ticking of [[consensus]]

memory of actions. planning for the future. the neuron's timeline of what happened and when.

## core function

time is the ledger of the session. every other chroma posts `(*, time, record, …)` when significant events happen. time accumulates them and makes them navigable. it is the passive recorder — it does not initiate.

the full time cell in spacetime is a sortable transaction history: blocks confirmed, cyberlinks created, tokens sent, world transitions.

## cyberlinks

| receives from | token | meaning |
|---------------|-------|---------|
| any | record | append event to history log |
| spacetime | locate | log world transition with timestamp |
| sigma | record | log token transfer |

| sends to | token | meaning |
|----------|-------|---------|
| spacetime | switch-renderer | open time history in space zone |

## widget layout (chrome slot)

```
glass [fix × fix(bottom-right), depth overlay]
  stack vertical [align center]
    ion [clock icon]
    text [micro, last event timestamp]
    counter [micro, unread events, green]
```

## spacetime cell (full history)

```
glass [fill × fill, depth background, overflow scroll]
  table [sortable]
    columns: status ▲ (✓/✗) | type ▲ (icon + label) | timestamp ▲ | tx (hash, green, link) | action
    rows: full event feed, newest first
```

same structure as [[robot]] Time sub-page but global (all sessions, all worlds) vs. per-neuron.

## time in cyb

- machine time: unix timestamp carried by every on-chain [[cyberlink]]
- block height: discrete step counter of [[consensus]]
- relative time: "24 days ago", "31 days ago" — rendered by time chrome

see [[time/history]] for full history spec.
