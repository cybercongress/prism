# prysm

**the visual protocol for [[superintelligence]].** every other UI library renders pixels. prysm renders **meaning**

> **speed.energy.sex** — three principles. one move: subtract.

---

drop a molecule into a cell. the protocol places it. resize the window — it folds. the colors come from your data, not a stylesheet. the proofs show themselves. you compose; the system arranges. it is like writing CSS if CSS had been derived from first principles instead of accumulated for thirty years

## the model

prysm is biology, compressed. **atoms** are irreducible primitives — area, line, point, content, identity, input. **molecules** are shaped widgets composed of atoms. **cells** are full applications composed of molecules. three levels, closed

every distance is a multiple of the quantum **g = 8pt** (one logical pixel — what browsers, iOS, and Android already use; retina is the GPU's problem). size with `fix(N·g)`, `fill`, or `scale(r)`. arrange in `stack`, `grid`, or `layer`. snap to named **sections**: `col` (25g) · `wide` (50g) · `band` (75g) · `canvas` (fill) horizontally; `line` (2g) · `bar` (6g) · `row` (12g) vertically. seven names, no arithmetic

## chroma — the robot, ready-made

[[cyb]] is a robot. its body is given. **context** tells the neuron where they are. **avatar** tells them who they are. **commander** takes their input. **time-widget** shows what just happened. **stars** holds their favorites. **adviser** delivers messages. **S** is focus. **Σ** is energy. these are not widgets you compose — they are the robot's organs, pre-wired, sharing emotion, folding together, navigating, reading the chain

build a cell. inhabit the **space** zone. you write what is unique. the rest is already there. this is the biggest shortcut prysm offers — you are not building an interface, you are extending a robot that already has its body

## example · oracle search

```
cell oracle [grid]:
  inhabits the space zone of chroma
  stack vertical [gap g]:
    input [search, placeholder "ask"]       canvas × bar
    table [results]                         canvas × canvas
      neuron-card                           col per row, folds to avatar on narrow
      pill [cyberank %]                     col per row, color = rank threshold
```

you write *what*. the protocol decides *where*. resize → fold adapts. chroma stays. only space reflows

## what makes it different

- **layout is a pure function** — same input, same output, always. **O(n)** layout, **O(1)** fold. provable interface
- **color is computed from your data** — green when a value rises, red when it falls. you never assign a hex
- **proof is part of the picture** — every value is `proven`, `asserted`, or `local`. the interface tells you which
- **black is the default** — `#000000` is zero OLED power, zero visual weight, zero signal. one answer, three reasons
- **renderer-blind** — the same tree paints to wgpu, ANSI, HTML, terminal cells
- **chrome is given** — you do not design the robot. you fill its space zone
- **three modes, one algebra** — stream, screen, world. all from the same axiom

read deeper: [[prysm/principles]] · [[prysm/composition]] · [[prysm/layout]] · [[prysm/emotion]] · [[prysm/interaction]] · [[prysm/proof]] · [[chroma]]

*don't trust. don't fear. don't beg.*
