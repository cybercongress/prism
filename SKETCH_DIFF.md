# sketch vs descriptions: diff

## components in Sketch missing from descriptions (root/)

| sketch component | artboards | action |
|------------------|-----------|--------|
| pill | 13 (on, off, bulb, colors) | ADD — tag/badge atom, widely used |
| tooltip | 3 (default, halogram, no-glossy-fx) | MERGE into adviser or ADD separately |
| brain-map | 1 (map+stats) | ADD — graph visualization widget |
| progress-bar | 3 (horizontal, descending, mobile) | MERGE into indicator + slider (already described) |
| 2-cells/mind | 10 artboards | ADD — action bar / navigation awareness cell |
| 2-cells/menu | 2 (menu, menu-2L) | ADD — context menu cell |
| 2-cells/robot | 4 (aip-menu, feature, features, old-menu) | ADD — robot settings cell |
| 2-cells/sense | 6 (messages, list, sabers) | ADD — messaging cell |
| 2-cells/tables | 14 (headers, legends, scroll, sub-groups) | UPDATE table.md — much richer than described |
| 2-cells/displays | 3 (bigHeader, smallHeader) | UPDATE display.md — has header variants |
| 2-cells/time | 1 (history) | already covered by time-widget.md |

## naming differences (Sketch vs prysm description)

| sketch name | prysm name | action |
|-------------|------------|--------|
| advicer | adviser | typo in Sketch, description is correct |
| aipp | aip | RESOLVED — renamed object → aip |
| avatar | avatar | RESOLVED — renamed subject → avatar |
| tripple | triple | typo in Sketch |
| saber+ion | bar | description uses "bar" = saber+ion composite |

## variants in Sketch missing from descriptions

| component | sketch has | description missing |
|-----------|-----------|---------------------|
| button | sense-side-panel, sigma-side-panel | specific side panel buttons for widgets |
| address | big-play, big-hover, small-hover, hoveredAddress | hover and play states |
| content | date, star-indicator, value-change | date display, star rating, value change indicator |
| input | m.-logScale, m.-text, neuron+dropdown | mobile variants, log scale selector, neuron+dropdown |
| display | indicator-2-line, indicator-default, saber | indicator display, saber display |
| pill | on/off, bulb, account, blackbackground, 6 colors | entirely missing component |
| table | list-row-8gutter, list-row-8gutter-R | row variants with different gutters |
| tabs | 5 (5-item), m.tab-3, m.tabs-3 | mobile tab variants |
| saber+ion (bar) | button-bi-side, display-biside, display-horizontal, input, input-focus | bi-sided and focus variants |

## components in descriptions missing from Sketch

| prysm description | status |
|-------------------|--------|
| slider | no dedicated artboard (lives inside input/m.-logScale) |
| toggle | no dedicated artboard (reused from pill on/off?) |
| counter | no dedicated artboard (lives inside content/value-change) |
| hud | no dedicated artboard (assembled from cells) |
| neuron-card | exists as 1-molecules/neuron (6 artboards in PNG export, not in components JSON) |
| portal-cell | no artboard (exists in 3-aips/citizenship) |
| cyberver-cell | no artboard |
| oracle-cell | no artboard |

## priority actions

1. ADD pill component — 13 artboards, heavily used, entirely missing from descriptions
2. UPDATE table.md — Sketch has 18 artboards (molecules + cells), description has 5 variants
3. UPDATE bar.md — Sketch saber+ion has 6 variants including bi-sided and focus states
4. UPDATE input.md — Sketch has 9 variants including mobile, log-scale, and neuron+dropdown
5. UPDATE address.md — add hover and play state variants
6. UPDATE content.md — add date, star-indicator, value-change variants
7. CLARIFY naming: decide if aipp=object, avatar=subject, or keep both names
8. ADD mind as a cell or molecule — 10 artboards, core navigation component
