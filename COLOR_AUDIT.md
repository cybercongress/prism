# prysm color audit

extracted from cyb.sketch components page (487 artboards, 107 unique colors)

## the spectrum: 7 emotions = 7 acid colors

from [[color-emotion spectrum]] — the evolutionary framework grounding prysm's visual language. the full ROYGBIV spectrum maps to seven fundamental emotions. the colors are acid — pure neon, maximum saturation, unmistakable on dark backgrounds. prysm refracts light into its purest wavelengths

| emotion | color | wavelength | signal in cyb | acid hex |
|---------|-------|------------|---------------|----------|
| [[anger]] | [[red]] | 620-750 nm | danger, overload, critical failure | #ff0000 |
| [[disgust]] | [[orange]] | 590-620 nm | invalid data, rejection, contamination | #ff5b00 |
| [[surprise]] | [[yellow]] | 570-590 nm | attention, sudden change, new event | #fcf000 |
| [[joy]] | [[green]] | 495-570 nm | confidence, success, growth, life | #00fe00 |
| [[interest]] | [[blue]] | 450-495 nm | exploration, curiosity, discovery | #00acff |
| [[sadness]] | [[indigo]] | 420-450 nm | withdrawal, loss, inactivity | #304ffe |
| [[fear]] | [[violet]] | 380-420 nm | unknown threat, irreversible action | #d500f9 |

## what sketch has vs what prysm needs

### the chaos: 107 colors found

67 solid + 40 alpha variants. for 7 emotions + neutrals this is ~7x more than needed

### green (joy) — 12 variants in sketch, should be 1 acid

| hex | count | verdict |
|-----|-------|---------|
| #36d6ae | 695x | REPLACE → #00fe00 (was muted teal, not acid) |
| #76ff03 | 347x | REPLACE → #00fe00 |
| #7afaa1 | 90x | REPLACE → #00fe00 |
| #00bfa5 | 63x | REPLACE → #00fe00 |
| #3ab793 | 46x | REPLACE → #00fe00 |
| #1de9b6 | 38x | REPLACE → #00fe00 |
| #6bffda | 23x | REPLACE → #00fe00 |
| #29a385 | 22x | REPLACE → #00fe00 |
| #2cbdbc | 21x | REPLACE → #00fe00 |
| #00ffbf | 6x | REPLACE → #00fe00 |
| #35d6ae | 6x | REPLACE → #00fe00 |
| #00ff02 | 2x | REPLACE → #00fe00 |

note: #36d6ae remains as CSS --primary-color in cyb codebase for now. the emotion palette is a separate layer — pure spectrum

### blue (interest) — 7 variants, should be 1 acid

| hex | count | verdict |
|-----|-------|---------|
| #1fcbff | 221x | REPLACE → #00acff |
| #00edeb | 150x | REPLACE → #00acff |
| #00c3ff | 94x | REPLACE → #00acff |
| #00b8d4 | 38x | REPLACE → #00acff |
| #00b0ff | 21x | REPLACE → #00acff |
| #0075ff | 12x | REPLACE → #00acff |
| #d3f4ff | 16x | KEEP — ice blue glass tint (alpha use only) |

### indigo (sadness) — 1 variant, consolidate

| hex | count | verdict |
|-----|-------|---------|
| #000aff | 130x | REPLACE → #304ffe |

### violet (fear) — 4 variants, should be 1 acid

| hex | count | verdict |
|-----|-------|---------|
| #d500f9 | 21x | KEEP — acid violet |
| #f62bfd | 87x | REPLACE → #d500f9 |
| #ed2be7 | 27x | REPLACE → #d500f9 |
| #9747ff | 5x | DELETE — Figma default, stray |
| #6200ea | 1x | DELETE — stray |

### red (anger) — almost missing, needs building

| hex | count | verdict |
|-----|-------|---------|
| #ff0000 | 6x | KEEP — acid red |
| #c62828 | 2x | DELETE — too muted |
| #c70000 | 1x | DELETE — too muted |

red has only 9 uses total. every destructive action, error state, and overload should glow #ff0000

### orange (disgust) — buried under MetaMask branding

| hex | count | verdict |
|-----|-------|---------|
| #ff5b00 | 10x | KEEP — acid orange |
| #ff5c00 | 6x | MERGE → #ff5b00 |
| #e27625, #f5831f, #e27525, #cc6128, etc. | 156x total | ISOLATE — MetaMask brand, confined to metamask icon only |

### yellow (surprise) — correct

| hex | count | verdict |
|-----|-------|---------|
| #fcf000 | 11x | KEEP — acid yellow |

### neutral — 10 variants, should be 5

| hex | count | verdict |
|-----|-------|---------|
| #ffffff | 1212x | KEEP — white (foreground text) |
| #d7d7d7 | 671x | KEEP — gray-100 (secondary text) |
| #777777 | 47x | KEEP — gray-300 (dim text, placeholders) |
| #4b4b4d | 125x | KEEP — gray-500 (muted, disabled) |
| #161616 | 6x | KEEP — gray-900 (surface, cards) |
| #000000 | 154x | KEEP — black (background) |
| #e5e5e5 | 25x | MERGE → #d7d7d7 |
| #999999 | 16x | MERGE → #777777 |
| #969696 | 11x | MERGE → #777777 |
| #666666 | 6x | MERGE → #4b4b4d |
| #616161 | 4x | MERGE → #4b4b4d |
| #515151, #525252 | 5x | MERGE → #4b4b4d |
| #222222, #262626 | 8x | MERGE → #161616 |

### glass opacity — 40 variants, should be 4

| value | count | verdict |
|-------|-------|---------|
| 0.70 | 24x | KEEP — foreground glass |
| 0.38 | 66x | KEEP — midground glass |
| 0.15 | 6x | KEEP — background glass |
| 0.07 | 2x | KEEP — subtle glass |
| all others | 36x | MERGE → nearest of the 4 levels |

## canonical palette: 17 tokens

### 7 acid emotions

| token | hex | emotion | signal |
|-------|-----|---------|--------|
| --red | #ff0000 | anger | danger, overload, critical failure |
| --orange | #ff5b00 | disgust | invalid data, rejection |
| --yellow | #fcf000 | surprise | attention, sudden change |
| --green | #00fe00 | joy | confidence, success, growth |
| --blue | #00acff | interest | exploration, curiosity |
| --indigo | #304ffe | sadness | withdrawal, inactivity |
| --violet | #d500f9 | fear | unknown threat, edge |

### 6 neutrals

| token | hex | role |
|-------|-----|------|
| --white | #ffffff | foreground text |
| --gray-100 | #d7d7d7 | secondary text |
| --gray-300 | #777777 | dim text, placeholders |
| --gray-500 | #4b4b4d | muted, disabled |
| --gray-900 | #161616 | surface, cards |
| --black | #000000 | background |

### 4 glass opacities

| token | value | role |
|-------|-------|------|
| --glass-fg | 0.70 | foreground pane |
| --glass-mid | 0.38 | midground pane |
| --glass-bg | 0.15 | background pane |
| --glass-subtle | 0.07 | barely visible |

## summary

107 colors → 17 tokens (7 acid emotions + 6 neutrals + 4 glass levels)

action: consolidate sketch file to canonical palette, then generate SVG atoms with correct colors
