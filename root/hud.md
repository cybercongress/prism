---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

heads-up display shell molecule in [[prysm]]

the persistent navigation frame of [[cyb]]. always visible, always present. the hud divides the screen into zones: top bar for global navigation, side panel for widgets ([[cyb/brain]], [[cyb/sense]], [[cyb/sigma]]), and the central content area where [[aip]] cells render. the hud is the skeleton that every screen inherits

## interface

- inputs
	- active [[aip]]: which application occupies the content area
	- widget states: open/collapsed for each sidebar widget
	- [[emotion]]: global mood indicator from [[cyb/robot]] state
- outputs
	- navigation event: switch between [[aip]] applications
	- widget toggle: open/close sidebar panels
- states
	- default, expanded sidebar, collapsed sidebar, mobile (stacked)

## variants

- desktop — three-zone layout: top bar, side widgets, central content
- mobile — stacked: top bar collapses to hamburger, widgets become bottom sheet

## composition

- hud is composed of [[prysm/glass]] panes + [[prysm/button]] + [[prysm/ion]] + [[prysm/saber]] frame borders
- hud contains [[prysm/tabs]] for [[aip]] switching
- hud hosts [[cyb/brain]], [[cyb/sense]], [[cyb/sigma]], [[prysm/time-widget]] as sidebar widgets
- every [[prysm/portal-cell]], [[prysm/oracle-cell]], [[prysm/cyberver-cell]] renders inside the hud content zone
