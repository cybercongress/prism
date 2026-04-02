---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

learning cell in [[prysm]]

the education and staking interface of [[cyberver]]. where [[neuron]] neurons learn, earn, and grow. the cyberver-cell shows mentors to follow, learner rankings, faculty topics, and staking rewards — turning knowledge acquisition into an economic game

## regions

- hud — persistent navigation for [[cyberver]] sections
- mentors — [[prysm/neuron-card]] list of mentors available for delegation. each card shows [[karma]], teaching topic, and reward rate
- learner — the active neuron's learning profile. [[prysm/counter]] for earned rewards + [[prysm/indicator]] for progress
- stats — delegation statistics. [[prysm/table]] with columns: mentor, delegated amount, rewards earned, APR
- faculties — topic navigation. [[prysm/tabs]] switching between knowledge domains

## interface

- inputs
	- neuron: the learner's identity and delegation state
	- mentors: list of available mentors with metrics
	- [[emotion]]: green for profitable delegations, yellow for underperforming
- outputs
	- delegate event: stake tokens with a mentor
	- undelegate event: withdraw stake
	- navigate event: open mentor profile or faculty detail

## composition

- cyberver-cell composed of [[prysm/neuron-card]] + [[prysm/table]] + [[prysm/tabs]] + [[prysm/counter]] + [[prysm/indicator]] + [[prysm/display]]
- cyberver-cell renders inside the [[prysm/hud]] content zone
- cyberver-cell is the primary cell of [[cyberver]]
