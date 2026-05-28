---
tags: prysm, cyb, core
crystal-type: pattern
crystal-domain: cyber
---

the emotion function in [[prysm]]

emotion is a computed color signal that encodes protocol state as affect. grounded in the [[color-emotion spectrum]]: seven wavelengths, seven feelings, one function. every [[prysm]] component accepts emotion as input. no component assigns emotion manually — it is always derived from data

## the palette

9 values: 7 spectrum colors + neutral + inactive

| emotion | color | hex | signal domain |
|---------|-------|-----|---------------|
| anger | red | #ff0000 | danger, critical failure, overload |
| disgust | orange | #ff5b00 | contamination, invalid data, rejection |
| surprise | yellow | #fcf000 | attention, sudden change, caution |
| joy | green | #00fe00 | confidence, success, growth, life |
| interest | blue | #00acff | exploration, focus, discovery |
| sadness | indigo | #304ffe | withdrawal, loss, inactivity |
| fear | violet | #d500f9 | unknown threat, radiation, boundary |
| neutral | white | #ffffff | no signal, idle, default |
| inactive | gray | #4b4b4d | disabled, off, muted |

## the emotion function

$$\varepsilon: (v,\; \theta,\; d) \;\to\; C$$

$v$ — signal value (numeric or categorical). $\theta$ — reference threshold (context-dependent). $d$ — signal domain (determines which evaluation rule applies). $C$ — one of the 9 palette values

four evaluation rules, selected by domain $d$:

### polarity

binary: value is positive or negative relative to zero

$$\varepsilon_{polarity}(v) = \begin{cases} \text{green} & v > 0 \\ \text{white} & v = 0 \\ \text{red} & v < 0 \end{cases}$$

used by: [[prysm/counter]] (balance change), [[prysm/widget]] Σ (balance delta), [[prysm/table]] (row-level accent)

### threshold

value compared to reference with three zones

$$\varepsilon_{threshold}(v, \theta_{low}, \theta_{high}) = \begin{cases} \text{green} & v \geq \theta_{high} \\ \text{yellow} & \theta_{low} \leq v < \theta_{high} \\ \text{red} & v < \theta_{low} \end{cases}$$

used by: [[prysm/avatar]] border ([[karma]] thresholds), [[prysm/sphere-cell]] validator pills (metric vs network average), [[prysm/hfr-cell]] E-Ratio, tx status (complete/pending/failed maps to green/yellow/red)

generalizes to more zones:

$$\varepsilon_{threshold}(v, \vec{\theta}) = C_i \quad \text{where} \quad i = \max\{j : v \geq \theta_j\}$$

$\vec{\theta} = (\theta_1, \theta_2, \ldots)$ — ordered thresholds. $C_i$ — color for zone $i$. this allows mapping to any subset of the palette, not only green/yellow/red

### semantic

categorical: action type determines emotion directly

$$\varepsilon_{semantic}(a) = \text{lookup}(a, M)$$

$M$ — a finite map from action categories to colors:

| category | color | examples |
|----------|-------|----------|
| navigate | white | open, browse, expand |
| confirm | green | sign, stake, claim, delegate, send |
| danger | red | delete key, burn tokens, undelegate |
| caution | yellow | large transfer, irreversible action |
| explore | blue | search, discover, ask |
| guide | green/red/yellow/blue | adviser messages — by message type |

used by: [[prysm/button]], [[prysm/adviser]], [[prysm/mind]]

### continuous

numeric value mapped to spectrum position. used when emotion encodes magnitude, not polarity

$$\varepsilon_{continuous}(v, v_{min}, v_{max}) = \text{spectrum}\left(\frac{v - v_{min}}{v_{max} - v_{min}}\right)$$

the spectrum function maps $[0, 1]$ to the ROYGBIV gradient: $0 \to$ red, $0.5 \to$ green, $1.0 \to$ violet. intermediate values interpolate between adjacent spectrum colors

used by: [[prysm/pill]] progress fill (cyberank weight), [[prysm/slider]] (position-dependent color), [[prysm/glass]] tint (when driven by continuous metric)

## application

emotion applies to three visual properties:

| property | how | opacity |
|----------|-----|---------|
| text color | direct replacement of text fill | 100% |
| saber glow | glow-color parameter of [[prysm/saber]] | 100% |
| glass tint | color overlay on [[prysm/glass]] surface | 15% |

a single component can carry emotion on multiple properties simultaneously: a [[prysm/button]] applies emotion to both text color and saber glow. a [[prysm/counter]] applies emotion to text and its saber change indicator

## inheritance

emotion flows through the element tree $\mathcal{T}$:

1. a cell computes emotion from protocol data (chain state, [[cyberank]], [[karma]])
2. the cell passes emotion to its molecules as a parameter
3. molecules pass emotion to their atoms

an atom never computes emotion. it receives and renders. a molecule may compute emotion for its sub-atoms (e.g. [[prysm/counter]] computes polarity from value delta). a cell computes emotion from the [[cybergraph]]

## concrete thresholds

threshold values for every component that uses $\varepsilon_{threshold}$:

### karma (avatar border, neuron-card)

| zone | condition | color |
|------|-----------|-------|
| high | karma $\geq \mu + \sigma$ | green (#00fe00) |
| medium | $\mu - \sigma \leq$ karma $< \mu + \sigma$ | white (#ffffff) |
| low | karma $< \mu - \sigma$ | red (#ff0000) |

$\mu$ — network mean karma, $\sigma$ — network standard deviation. thresholds are relative to network distribution, not absolute

### validator pills (sphere-cell)

each metric (APR, power, commission, self-stake) evaluated independently:

| zone | condition | color |
|------|-----------|-------|
| above average | $v \geq \mu_{network}$ | green (#00fe00) |
| around average | $\mu_{network} \cdot 0.8 \leq v < \mu_{network}$ | yellow (#fcf000) |
| below average | $v < \mu_{network} \cdot 0.8$ | red (#ff0000) |

### E-Ratio (hfr-cell)

| zone | condition | color |
|------|-----------|-------|
| healthy | $e \geq 0.5$ | green (#00fe00) |
| low | $0.2 \leq e < 0.5$ | yellow (#fcf000) |
| depleted | $e < 0.2$ | red (#ff0000) |

$e = \text{available energy} / \text{max energy}$, range $[0, 1]$

### transaction status

| state | color |
|-------|-------|
| complete | green (#00fe00) |
| pending | yellow (#fcf000) |
| failed | red (#ff0000) |

categorical, not threshold — included here because it follows the green/yellow/red pattern

### cyberank (content, pill, oracle-cell particle rank)

uses $\varepsilon_{continuous}$: $v = \log_{10}(\text{rank})$, $v_{min} = 0$, $v_{max} = \log_{10}(\text{max\_rank})$. higher rank → greener. the logarithmic scale prevents a few high-rank particles from compressing the entire spectrum

## default

when no signal drives emotion: $\varepsilon = \text{neutral}$ (white). when a component is disabled: $\varepsilon = \text{inactive}$ (gray)

## fallback

when `EmotionSource` data is unavailable (chain offline, RPC timeout, fetching):

| condition | emotion | rationale |
|-----------|---------|-----------|
| data fetching (loading) | neutral (white) | no information — no signal |
| chain unreachable | neutral (white) | no data to evaluate — show absence of signal, not false signal |
| stale data (> 60s old) | last computed emotion, opacity 50% | fade indicates staleness — the neuron sees that information is aging |
| error in computation | neutral (white) + adviser red message | emotion system fails gracefully — never show wrong color |

the rule: emotion must never lie. if the system cannot compute a truthful signal, it shows no signal (neutral). showing a false green on stale data is worse than showing white

ECS: `EmotionSource` includes `freshness: Instant`. `EmotionSystem` checks freshness: if $t_{now} - t_{fresh} > 60s$, apply 50% opacity to `Emotion`. if source is `None`, emit neutral

## ECS

- Component: `Emotion { color: EmotionColor }` — the computed color, attached to any entity
- Component: `EmotionSource { domain: Domain, value: f64, thresholds: Vec<f64> }` — the input data
- System: `EmotionSystem` — reads `EmotionSource`, writes `Emotion` using the evaluation rules above
- System: `EmotionPropagateSystem` — propagates `Emotion` from cells → molecules → atoms through the element tree

`EmotionSystem` runs before render systems, after data-fetch systems. emotion is recomputed every frame when the source value changes

## the binding

the color-emotion mapping is innate — ancestral environments selected for wavelength-affect bindings. green = vegetation = life. red = blood = danger. this is the perceptual interface between a [[neuron]] and the [[cybergraph]]. see [[color-emotion spectrum]] for the evolutionary framework
