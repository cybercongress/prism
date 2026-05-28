---
tags: prysm, cyb, core
crystal-type: pattern
crystal-domain: cyber
---

the color palette of [[prysm]]

every color in [[cyb]] comes from this page. no hardcoded hex values outside this palette. renderers reference these tokens by name

## background

| token | hex | use |
|-------|-----|-----|
| void | #000000 | screen background, the absence of signal |

## emotion spectrum

7 acid colors from the [[color-emotion spectrum]] + neutral + inactive. these are the only colors that carry meaning

| token | emotion | hex | signal |
|-------|---------|-----|--------|
| anger | red | #ff0000 | danger, critical failure, overload |
| disgust | orange | #ff5b00 | contamination, invalid data, rejection |
| surprise | yellow | #fcf000 | attention, sudden change, caution |
| joy | green | #00fe00 | confidence, success, growth, life |
| interest | blue | #00acff | exploration, focus, discovery |
| sadness | indigo | #304ffe | withdrawal, loss, inactivity |
| fear | violet | #d500f9 | unknown threat, radiation, boundary |
| neutral | white | #ffffff | no signal, idle, default |
| inactive | gray | #4b4b4d | disabled, off, muted |

## text

4 levels of text luminance on void background

| token | hex | use |
|-------|-----|-----|
| primary | #ffffff | default text, active labels |
| secondary | #d7d7d7 | supporting text, descriptions |
| dim | #777777 | placeholders, metadata, timestamps |
| muted | #4b4b4d | ghost text, disabled labels |

## glass

translucent surfaces over void. glass color = white at varying opacity. [[prysm/emotion]] tint overlays at 15% opacity when present

| token | opacity | hex (effective on #000) | use |
|-------|---------|------------------------|-----|
| foreground | 0.70 | ~#b3b3b3 | modals, tooltips |
| midground | 0.38 | ~#616161 | cards, panels, commander |
| background | 0.15 | ~#262626 | space-level containers |
| subtle | 0.07 | ~#121212 | ambient regions |

glass border: white at lower opacity than fill

| token | opacity | use |
|-------|---------|-----|
| foreground-border | 0.15 | visible edge on foreground glass |
| midground-border | 0.10 | subtle edge on midground glass |
| background-border | 0.06 | barely visible edge |
| subtle-border | 0.03 | near-invisible edge |

## saber

line colors inherit from emotion or default to neutral

| token | hex | use |
|-------|-----|-----|
| saber-default | #ffffff | neutral separator, structural lines |
| saber-emotion | (from emotion) | glow carries action/state emotion |
| saber-dim | rgba(255,255,255,0.12) | structural dividers, inactive separators |

## emotion tint on glass

when glass carries [[prysm/emotion]], the tint is applied as color overlay at fixed opacity

| property | value |
|----------|-------|
| tint opacity | 15% (0.15) |
| tint color | emotion hex at 15% over glass fill |

## token logos

token icons carry their brand color. these are the only non-palette colors allowed in prysm

| token | color | hex |
|-------|-------|-----|
| BOOT | green | #00fe00 |
| HYDROGEN | gray | #777777 |
| ATOM | blue | #6f7390 |
| OSMO | purple | #5e12a0 |

## rendering

- void (#000000) is always the base. every other color exists on void
- emotion colors are max saturation / max brightness — acid, not pastel
- text levels are pure white at varying opacity (no warm/cool tint)
- glass is pure white at varying opacity (no color shift)
- the only colored elements are emotion signals and token logos
- if a color is not in this palette, it does not belong in [[cyb]]
