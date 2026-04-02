---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

typography atom in [[prysm]]

the only way text appears in [[cyb]]. every word, label, heading, and paragraph renders through this atom. monospace foundation — a single font family across the entire interface. hierarchy comes from size and weight, never from decoration

## parameters

| parameter | values | default |
|-----------|--------|---------|
| content | any string | — (required) |
| size | h1 (32px), h2 (24px), h3 (20px), body (16px), caption (14px), micro (12px) | body (16px) |
| weight | regular (400), medium (500) | regular |
| align | left, center, right | left |
| color | any hex from palette | #ffffff (white) |
| [[emotion]] | overrides color with emotion hex | none |
| line-height | 1.0, 1.2, 1.4, 1.6 | 1.4 for paragraph, 1.0 for labels |
| max-lines | 1, 2, 3, unlimited | unlimited |
| truncate | ellipsis, clip, none | none |

### font

- family: monospace (single family everywhere)
- no bold. no italic. no underline. no decoration
- hierarchy only through size and weight

### size scale

| token | px | line-height | use |
|-------|----|-------------|-----|
| h1 | 32 | 1.2 | page titles, hero numbers |
| h2 | 24 | 1.2 | section headers |
| h3 | 20 | 1.2 | subsection headers, card titles |
| body | 16 | 1.4 | content text, descriptions |
| caption | 14 | 1.4 | labels, metadata, secondary info |
| micro | 12 | 1.0 | timestamps, minimal annotations |

### color rules

- default: #ffffff white on dark backgrounds
- secondary: #d7d7d7 gray-100 for less important text
- dim: #777777 gray-300 for placeholders and disabled
- muted: #4b4b4d gray-500 for ghost text
- emotion override: text color becomes the [[emotion]] hex when signaling state

## variants

- left — default alignment, used in body content and lists
- center — used in headings, empty states, and onboarding
- right — used in numeric columns and [[prysm/counter]]
- paragraph — multi-line block with line-height 1.4 and 8px spacing between paragraphs

## composition

- text inside [[prysm/button]] = action label
- text inside [[prysm/ion]] = icon caption
- text inside [[prysm/counter]] = formatted number
- text inside [[prysm/display]] = emphasized content
- text is the most composed atom — every molecule contains at least one
