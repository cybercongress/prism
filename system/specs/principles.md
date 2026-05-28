---
tags: prysm, cyb, core
crystal-type: pattern
crystal-domain: cyber
---

# gravity

design book for [[cyb]]. three principles and one mechanism.

---

## speed

making fast is fundamental.

```
10ms   — instantaneous. the interface is thought
100ms  — fast. action and response feel connected
1000ms — slow. the user is waiting
```

eye perception sets the budget. every frame beyond 16ms (60fps target, 8ms for 120fps) is a broken promise. speed is not a feature — it is the baseline condition for the interface to exist.

**speed is less code.** the fastest path between two states is the one with the fewest instructions. complexity is latency. subtraction is optimization.

---

## energy

everything requires energy — the computer's and the agent's.

**black consumes less energy.** #000000 is the only color that draws zero power on OLED. every pixel of white is a watt spent. the dark base of [[prysm]] is not an aesthetic choice — it is the energetically correct default.

**battery and focus are the same resource.** a draining interface drains the neuron. energy efficiency in rendering is cognitive efficiency for the human using it.

---

## sex

*perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.* — Antoine de Saint-Exupéry

make the interface compelling. not by adding — by removing until what remains is irresistible.

**don't know what to add? add nothing.**
**don't know why to add? add nothing.**

---

## gravity

the mechanism that places elements without manual layout decisions.

**objects have mass. mass defines gravitation. gravitation defines proximity.**

in the [[cybergraph]], [[cyberank]] defines mass. highly ranked particles are heavy — they pull related elements toward them. low-ranked particles are light — they drift to the periphery. the layout is not designed; it emerges from the graph's own weight distribution.

this solves three nested problems:

| problem | description |
|---------|-------------|
| agent focus | where should the neuron's attention go? |
| element placement | where should elements be positioned? |
| placement-oriented focus | when placement drives attention, placement IS the interface |

a design system with automatic element placement based on mass is not a grid — it is a physics. [[prysm/layout]] formalizes this through the constrain → occupy → place protocol, with [[prysm/emotion]] as the visible output of mass (cyberank → emotion color → element weight in the neuron's perception).

---

## spacing

all space in multiples of **8pt** — the quantum $g$. no fractional spacing. no arbitrary values.

```
g    =  8pt
2g   = 16pt
3g   = 24pt
4g   = 32pt
5g   = 40pt
6g   = 48pt
...
```

the 8pt grid is not a convention — it is derived from the pixel grid of standard displays (where 8px = 1 logical unit at 1× DPI) and from Fitts's law minimum target sizes. see [[prysm/grid]] for the formal derivation.

---

*don't trust. don't fear. don't beg.*
