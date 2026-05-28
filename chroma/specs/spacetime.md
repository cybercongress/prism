---
tags: prysm, cyb, chroma
alias: renderer slot, pluggable renderer
crystal-type: pattern
crystal-domain: cyber
---

renderer slot — center

**spacetime**: the only pluggable slot. hosts exactly one renderer at a time. switching renderers = world transition. the eight chromas are fixed; spacetime is the variable

## core function

spacetime receives `(com, spacetime, switch-renderer, …)` and swaps the active backend. it self-feeds output via `(spacetime, spacetime, output, …)` — the renderer writes its own display. it tells [[space]] which world is active via `(spacetime, space, locate, …)` after every switch.

## renderers

| renderer | crate | what it shows |
|----------|-------|---------------|
| mir | `mir` | 3D knowledge graph (wgpu) |
| sugarloaf | `sugarloaf` | terminal canvas (wgpu) |
| wry | `wry` | web content (Portal world) |
| bevy-ui | `bevy_ui` | native UI panels |
| symphony | (future) | audio scene |

## cyberlinks

| receives from | token | meaning |
|---------------|-------|---------|
| com | submit | text or command submitted by neuron |
| com | switch-renderer | replace active renderer |
| spacetime | output | renderer self-feeds display content |

| sends to | token | meaning |
|----------|-------|---------|
| space | locate | announce which world is now active |
| ad | output | pass hints or context to advisor |
| time | record | log world transitions |

## invariants

- exactly one renderer active at all times
- spacetime owns its own wgpu camera (order 0)
- the eight chromas live on a single overlay camera (order 100, no clear)
- chromas are agnostic to which renderer is active

## sizing

fill × fill (entire remaining space after chromas claim their edges)
