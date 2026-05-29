# prysm

**the visual protocol for [[superintelligence]].** every other UI library renders pixels. prysm renders **meaning**

> **speed.energy.sex** — three principles. one move: subtract.

---

## think in atoms · molecules · cells

build interfaces like life is built. thirteen **atoms** are the primitives — three substrate (`glass` is area, `saber` is line, `ion` is point), seven particle types (`text`, `image`, `vector`, `mesh`, `media`, `code`, `field`), two identity (`neuron`, `token`), one input (`entry`). atoms compose into **molecules** — twenty-four widgets with shape (`button`, `tabs`, `input`, `table`, `pill`, ...). molecules compose into **cells** — ten full-screen apps (`oracle`, `brain`, `sigma`, ...)

every size is a multiple of the quantum **g = 8pt** — one number for every gap, padding, margin. say `fix(N·g)` for rigid, `fill` for elastic, `scale(r)` for proportional. arrange in `stack` (1D chain), `grid` (2D lattice), or `layer` (depth)

## example · oracle search

```
cell oracle [grid]:
  mind                                      fill × fix(6g)
  stack vertical [gap g]:
    input [search, placeholder "ask"]       fill × fix(6g)
    table [results]                         fill × fill
      neuron-card                           per row, folds to avatar on narrow
      pill [cyberank %]                     per row, color = rank threshold
```

you write *what* to show. the protocol places it. resize the window → fold conformations adapt. no breakpoints, no media queries, no manual responsive css

## what you get

- **layout is a pure function** — same input, same output, always. **O(n)** layout, amortized **O(1)** fold selection. you can prove your interface
- **color is computed** — green appears because a value rose. red because it fell. designers never assign color; the aesthetic is derived from truth
- **proof is visible** — values are `proven`, `asserted`, or `local`. a verified glyph sits beside backed values and fades as the proof goes stale
- **black is the default** — `#000000` draws zero OLED power, is visually weightless, is the absence of signal. one answer, three reasons
- **renderer-blind** — the same prysm tree → wgpu, ANSI escapes, HTML, terminal cells. one protocol, every surface
- **three modes, one algebra** — `stack` for streams (chat, terminal), `grid` for screens (dashboards), `layer` for worlds (3D graph)

read the foundations: [[prysm/principles]] · [[prysm/composition]] · [[prysm/layout]] · [[prysm/emotion]] · [[prysm/interaction]] · [[prysm/proof]]

---

*don't trust. don't fear. don't beg.*
