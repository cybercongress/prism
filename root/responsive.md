---
tags: prysm, cyb
crystal-type: entity
crystal-domain: cyber
---

responsive adaptation rules for [[prysm]]

one interface, two modes. every component in [[cyb]] works on desktop and mobile. the breakpoint is 768px — above is desktop, at or below is mobile. the principle: atoms stay identical, molecules rearrange, cells reflow, aips restructure

## breakpoint

| mode | viewport | target |
|------|----------|--------|
| desktop | >768px | laptop, monitor, tablet landscape |
| mobile | <=768px | phone, tablet portrait |

## atoms: unchanged

atoms render identically on both modes. same sizes, same spacing, same colors. [[prysm/glass]], [[prysm/text]], [[prysm/button]], [[prysm/saber]], [[prysm/ion]], [[prysm/toggle]], [[prysm/slider]], [[prysm/indicator]], [[prysm/counter]], [[prysm/address]], [[prysm/images]] — all pixel-identical. the 8px grid holds on every screen

## molecules: rearrange

molecules keep the same atoms but change layout

| molecule | desktop | mobile |
|----------|---------|--------|
| [[prysm/hud]] | three-zone: top bar + side widgets + center content | stacked: hamburger top, widgets as bottom sheet |
| [[prysm/tabs]] | 3/4/5 items horizontal | 3 items bottom bar, swipe for more |
| [[prysm/input]] | inline with icons L/R/LR | full-width, stacked icon above |
| [[prysm/table]] | multi-column grid | single-column cards or horizontal scroll |
| [[prysm/neuron-card]] | big card with full details | small card, expandable on tap |
| [[prysm/aip]] | 2-line or 3-line horizontal | 2-line vertical, menu on long-press |
| [[prysm/avatar]] | 2-line horizontal strip | avatar circle + name below |
| [[prysm/adviser]] | tooltip floating near anchor | bottom sheet overlay |
| [[prysm/bar]] | horizontal toolbar with multiple actions | collapsed to primary action + overflow menu |
| [[prysm/filter]] | horizontal row of options | horizontal scroll with fade edges |
| [[prysm/display]] | wide content pane | full-width, reduced padding (16→8) |
| [[prysm/content]] | wide format with side icons | stacked format, icon above text |
| [[prysm/pill]] | inline tag badges | same, but wrap to next line when overflow |
| [[prysm/time-widget]] | sidebar panel | bottom sheet, swipe up |

## cells: reflow

| cell | desktop | mobile |
|------|---------|--------|
| [[prysm/oracle-cell]] | search top + results grid below | search bar fixed top, results scroll below |
| [[prysm/portal-cell]] | multi-column onboarding layout | single-column step-by-step flow |
| [[prysm/cyberver-cell]] | stats + mentor list side by side | tabs switching between stats and mentors |

## [[prysm/mind]]: transforms

the most changed component between modes

| desktop | mobile |
|---------|--------|
| top input bar with search, navigation arrows, context | bottom action bar with back, forward, sign |
| always visible | revealed on scroll-up, hidden on scroll-down |
| search input inline | search is a tap-to-expand overlay |
| sign button in-context | sign button prominent in action bar |

## general rules

- touch targets: minimum 44x44px on mobile (Apple HIG). desktop can use 32x32
- padding: desktop uses 24px section gaps, mobile uses 16px
- typography: sizes stay the same. line lengths shorten naturally with viewport
- glass depth: mobile uses fewer nesting levels (max 2 vs desktop max 3)
- sidebar widgets on mobile become bottom sheets: [[cyb/brain]], [[cyb/sense]], [[cyb/sigma]], [[prysm/time-widget]] are swipe-up panels
- scroll: desktop allows side-scroll in tables and filters. mobile prefers vertical scroll with horizontal swipe for overflow
- gestures: mobile adds swipe-left (back), swipe-right (forward), long-press (context menu). desktop uses hover for these
- orientation: portrait is the primary mobile layout. landscape is allowed but treated as a wider portrait, not as desktop
