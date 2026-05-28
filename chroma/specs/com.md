---
tags: prysm, cyb, chroma
alias: command, commander, mind
crystal-type: pattern
crystal-domain: cyber
---

commander chrome — bottom-center

**command**: where [[neurons]] express intent. push buttons, make decisions, ask questions, issue commands. every action in [[cyb]] flows through com

## protocol role

mind is a molecule in the element tree $\mathcal{T}$. membrane = commander zone of [[prysm/grid]] (row 3, col 2). fill × fix($6g$). $\mathcal{U} = 20$ (active)

## core function

com is the input surface. every other chroma receives and displays — com is where the neuron acts. it is the only chroma that initiates signals to [[spacetime]] via user input.

com adapts to context: the active world determines which commands are available, which suggestions appear in [[ad]], and what the placeholder text says.

## command palette

`⌘K` opens the palette. type anything:

- a query → routes to [[cyb/oracle]]
- a page name → opens in [[cyb/brain]]
- a command → executes immediately
- a CID → resolves the [[particle]]
- an address → opens the [[neuron]] profile

fuzzy matching. recent commands. context-aware suggestions from current view.

## actions

| action | what happens |
|--------|-------------|
| link | create a [[cyberlink]] between two [[particles]] |
| send | transfer [[tokens]] via [[cyb/sigma]] |
| sign | approve a transaction |
| publish | push a [[particle]] to the [[cybergraph]] |
| stake | delegate to a subnet |
| ask | submit a query to [[cyb/oracle]] |
| navigate | open a page in [[cyb/brain]] |

actions are composable: search → select → link → publish as one chain

## keyboard

- `⌘K` command palette
- `/` search in [[cyb/oracle]]
- `⌘L` new [[cyberlink]]
- `⌘S` sign pending transaction
- `⌘P` publish current [[particle]]
- `Tab` cycle between [[cyb/brain]] tabs
- `Esc` back / close / cancel

## voice and text

com accepts natural language. the [[cyb/onnx]] SLM parses intent from free text and maps it to structured commands: "stake 100 CYB on subnet 3" → delegation transaction → [[cyb/signer]]

## cyberlinks

| sends to | token | meaning |
|----------|-------|---------|
| spacetime | submit | user submitted text or command |
| spacetime | switch-renderer | replace active renderer |
| ad | submit (partial) | partial text → suggestion request |
| sigma | send | token transfer initiated |
| time | record | log command |

| receives from | token | meaning |
|---------------|-------|---------|
| ad | hint | insert suggestion into placeholder |
| spacetime | context | current world for palette adaptation |

## sizing

| viewport | sizing |
|----------|--------|
| desktop | fill × fix($6g$) |
| mobile ($\square_w \leq 96g$) | fill × fix($6g$) (same) |

$s_{min} = (20g, 6g)$

## structure

```
glass [fill × fix(6g), depth midground]
  stack horizontal [gap g/2]
    ion [2g, back arrow]
    ion [2g, forward arrow]
    input [fill × fix(4g), with saber underline]
    button [sign action, with saber frame]
```

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): back + forward + input + sign button + context actions
- $l_2$ ($w_{min} = 20g$): input + sign button only
- $l_3$ ($w_{min} = 10g$): sign button only

## contextual adaptation

| active aip | placeholder | primary action |
|------------|-------------|----------------|
| oracle/search | "ask the cybergraph" | Search |
| terminal | "enter command" | Run |
| sense/@ | "send message" | Send |
| sense/llm | "ask the model" | Ask |
| sigma/send | "enter recipient" | Send |
| portal | "generate identity" | Confirm |

content replacement within the same conformation — structure stays, labels and available actions change per aip

## emotion

saber underline of the input field carries [[emotion]]:

| state | glow-color | trigger |
|-------|-----------|---------|
| idle | #ffffff (white) | no activity |
| typing | #00fe00 (green) | neuron is entering text |
| error | #ff0000 (red) | invalid input, failed transaction |
| signing | #00fe00 (green, pulsing) | [[cyberlink]] being signed |
| success | #00fe00 (green, fades) | action completed |

## states

| state | visual | trigger |
|-------|--------|---------|
| default | input empty, saber white | — |
| focus | cursor visible, saber glow intensifies | tap input |
| typing | text appears, saber green | keystrokes |
| submitting | loading state on sign button | action in progress |
| disabled | all dims to #4b4b4d | no connection |

state transitions: $150\text{ms}$ ease

## 3D

commander renders at fixed $p_z$ ($\mathcal{U} = 20$) — does not recede with gravity. always within reach

## ECS

- Entity: mind organelle
- Components:
  - `Sizing { width: Fill, height: Fix(6) }`
  - `GridArea { name: "commander" }`
  - `FoldSet { conformations }`
  - `ActiveAip { aip_id }`
  - `InputState { text, focused, emotion }`
  - `SaberGlow { color, spread }`
- Systems:
  - `MindContextSystem` reads `ActiveAip`, updates placeholder and available actions
  - `MindInputSystem` handles focus, typing, submission
  - `MindEmotionSystem` reads input state and action result, writes `SaberGlow`
