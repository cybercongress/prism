---
tags: prysm, cyb, core
crystal-type: pattern
crystal-domain: cyber
---

the proof layer of [[prysm]]

cyb is a [[soft3]] interface. every value rendered on screen has a provenance — it is either cryptographically verified, asserted by an actor, or local to the neuron. prysm represents this provenance visually. the neuron always knows which values are proven and which are merely claimed

this page defines how proofs surface in the interface

---

## the three states of truth

every value in cyb is in exactly one state:

| state | meaning | source |
|-------|---------|--------|
| **proven** | cryptographic proof exists and verifies | [[zheng]] proof, [[bbg]] opening, [[lens]] commitment |
| **asserted** | claimed by an identified [[neuron]] but unverified | signed [[cyberlink]] not yet finalized |
| **local** | neuron's own state, never submitted | local UI state, draft input, key material |

the neuron sees the difference at a glance. proof is not metadata hidden behind a tooltip — it is the visual contract of the value itself

---

## the verified glyph

verified state attaches a single visible mark to the value:

```
vector [verified, 2g, joy green]
```

the verified glyph (joy green ✓) appears adjacent to any proven value: a balance, a [[cyberank]] score, a [[neuron]] identity, a query result. it is the visual instance of "this is backed by a [[zheng]] proof"

the glyph is sized $2g$ inline, $4g$ in cards, $g/2$ as a corner dot on glass surfaces. consistent across atoms

| atom | verified rendering |
|------|--------------------|
| `text` | vector [verified, $2g$] appended after the text run |
| `neuron` | vector [verified, $2g$] appended after the address |
| `token` | vector [verified, $2g$] appended after symbol |
| `field` | bright halo on the field surface, no glyph (value-per-point) |

---

## the asserted state

asserted values carry **identity but not yet proof**. a [[cyberlink]] in the mempool, a transaction signed but not finalized, a claim staked but not yet evaluated

asserted state renders with:

- the [[neuron]] sigil of the asserter, $2g$ inline
- no verified glyph
- color follows [[emotion]] normally — no special tint

asserted is not a warning. it is the natural in-flight state of any submission to the [[cybergraph]]. it becomes proven when the next block finalizes

---

## the local state

values that never left the neuron's device carry no signature, no proof. drafts in the commander, local UI preferences, key derivations. these render normally with no marker — the absence of identity is itself the signal

```
vector [verified, ...]   ← proven
vector [neuron-sigil, ...] ← asserted by a neuron
(nothing)                ← local
```

three states, three visual treatments. no ambiguity

---

## proof inspection

every proven value is tappable. tap opens the **proof inspector** — an overlay molecule that displays:

| field | content |
|-------|---------|
| commitment | [[bbg]] root hash at the block of proof |
| opening | [[lens]] opening for the queried dimension |
| block | finalization block height |
| algebra | which [[strata]] tier produced the proof |
| size | proof size in bytes |
| verify time | local verification duration (always shown — keeps the neuron honest about cost) |

the inspector is a [[prysm/display]] molecule with [[code]] atom rendering the proof hex. small. precise. the goal is not to make proofs pretty — it is to make them inspectable

---

## the field as proof surface

the [[prysm/field]] atom is the densest proof surface in cyb: every point in the field's domain is a value, and every value can be backed by a proof. the field renders both:

- the value (heatmap color, contour line, flow vector)
- the proof density (a subtle saber overlay where coverage is dense vs sparse)

regions with full proof coverage glow with [[emotion]] at full intensity. regions with sparse coverage dim. the neuron sees the proof landscape

this matters most for the [[cyberank]] field: high-rank regions are also typically high-proof regions, because they have been queried often and proven often. low-rank regions are dim in both senses

---

## staleness

proofs become stale. a proof generated at block $h$ may no longer reflect chain state at block $h + n$. prysm renders staleness as time-decay opacity on the verified glyph:

| age (blocks since proof) | verified glyph opacity |
|--------------------------|----------------------|
| 0 — current block | 100% |
| 1–10 | 90% |
| 10–100 | 60% |
| > 100 | 30% — explicitly stale |

the neuron sees a fading checkmark. they decide whether to re-query or accept staleness for performance. prysm never lies — stale proofs are visually distinct from fresh ones

---

## the rule

**emotion can soften. proof cannot lie.**

if a value cannot be proven, do not render the verified glyph. if a proof has expired, fade it. if a query is in flight, show the loading state — never speculate forward to "probably proven"

prysm shows truth as it is, including its absence. the cybergraph is verifiable by design; the interface honors that design by never claiming verification it cannot demonstrate

---

## ECS

- Component: `Provenance { Proven { proof_cid, block_height } | Asserted { neuron_id } | Local }`
- Component: `ProofFreshness { block_age }`
- System: `ProvenanceSystem` — reads chain state, writes `Provenance` to entities
- System: `VerifyGlyphSystem` — for `Proven` entities, attaches verified vector child with freshness-driven opacity
- System: `ProofInspectorSystem` — opens inspector overlay molecule on tap of verified glyph

---

*the cybergraph is a graph of proofs. prysm is the lens that shows them*
