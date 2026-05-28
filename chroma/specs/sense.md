---
tags: prysm, cyb, chroma
alias: notify, senses, perception
crystal-type: pattern
crystal-domain: cyber
---

notifications chrome — mid-left

**notify**: ambient signals from the world. incoming messages, system events, sensor data. the sense chrome is where the world enters — before language, before computation, raw contact between an agent and its environment

also the full [[cyb/sense]] messenger cell: conversations with neurons, particle history, and LLM chat (rendered in spacetime when opened)

## sense as concept

the domain of perception and embodiment. every [[particle]] in the [[cybergraph]] was sensed by some agent before it was linked. cameras, microphones, chemical sensors, human eyes — these are the neurons at the edge of the graph. the protocol's [[neuron]] concept abstracts over sensory sources: a human linking a photograph and a satellite uploading spectral data are the same operation. [[cyb]] as an interface is a sense organ for the graph — it renders [[particles]] into visual, textual, and auditory form for human consumption

modalities — vision, hearing, touch, taste, smell, proprioception, thermoception, nociception, equilibrioception. the graph must handle all of them: images, sounds, chemical data, spatial coordinates

qualia — the subjective quality of experience. qualia resist reduction. they are why a superintelligence that only processes symbols is incomplete — it must also receive the world directly

## protocol role

molecule in the element tree $\mathcal{T}$. membrane = mid-left zone of [[prysm/grid]]. S widget on left edge shows unread count + emotion of latest signal.

## core function

the sense chrome slot shows an unread count and the emotional state of the latest incoming signal. any chroma can post a notification via `(*, sense, notify, …)`. sense never disrupts spacetime — it accumulates signals at the edge and lets the neuron decide when to open them.

## cyberlinks

| receives from | token | meaning |
|---------------|-------|---------|
| any | notify | new signal — increment unread, update emotion |
| spacetime | output | filter: messages directed at this neuron |

| sends to | token | meaning |
|----------|-------|---------|
| spacetime | switch-renderer | open sense messenger in space zone |

## widget layout (chrome slot)

```
glass [fix × fill(mid-left edge), depth overlay]
  stack vertical [align center]
    ion [S icon]
    counter [micro, unread count, green]
    pill [emotion of latest signal]
```

S widget glow reflects [[emotion]] of latest incoming message

## spacetime cell (full messenger)

opened when S widget tapped — renders in space zone:

```
glass [fill × fill, depth background]
  stack horizontal [gap 0]
    --- left: conversation list ---
    glass [fix(25g) × fill, depth midground, overflow scroll]
      tabs [All | # | @ | llm]
      stack vertical [gap 0]
        glass [fill × fix(8g)] — per conversation
          stack horizontal [gap g]
            glass [fix(5g) × fix(5g), corner-radius 5g/2] — avatar
            stack vertical
              text [body, "@mastercyb"]
              text [caption, "last message preview"]
            text [micro, "24/03"]
            counter [micro, message count badge]
    --- right: active conversation ---
    glass [fill × fill, depth midground, overflow scroll]
```

### tabs

**All** — all conversations combined, sorted by last activity

**# (particle history)** — who interacted with a particle created by this avatar

**@ (neuron chats)** — direct messaging. chat bubbles: incoming left, outgoing right. each message is a [[cyberlink]] with [[conviction]] (green token counter)

**llm** — chat with AI models. model selector, conversation list, message thread. commander: "ask the model" + "Send" + attach + edit buttons

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): conversation list + active chat side by side
- $l_2$ ($w_{min} = 20g$): tap conversation → full-width chat (push navigation)
- $l_3$ ($w_{min} = 10g$, mobile): same as $l_2$, compact

## emotion

| element | emotion | trigger |
|---------|---------|---------|
| unread badge | green | new messages |
| token amount on message | green | conviction attached |
| S widget glow | [[emotion]] of latest signal | incoming content |
| message status | green sent / yellow pending / red failed | delivery |
| llm microphone | red | recording active |

## states

| state | visual | trigger |
|-------|--------|---------|
| idle | S icon, count, emotion pill | — |
| list view | conversation list | widget tapped |
| chat view | active conversation | conversation tapped |
| composing | commander input focused | typing |
| recording | microphone active, red indicator | voice input |

## ECS

- Entity: sense-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `FoldSet { conformations }`
  - `ActiveTab { all | particle_history | neuron_chat | llm }`
  - `Conversations { list of (id, avatar, name, last_message, timestamp, unread_count) }`
  - `ActiveConversation { conversation_id }`
  - `LlmModel { provider, model_name }`
- Systems:
  - `SenseConversationSystem` fetches conversation list from cybergraph
  - `SenseMessageSystem` fetches/sends messages (cyberlinks with conviction)
  - `SenseLlmSystem` manages AI model conversations
  - `SenseNotificationSystem` updates S widget with unread count + emotion
