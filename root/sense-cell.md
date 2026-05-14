---
tags: prysm, cyb
crystal-type: pattern
crystal-domain: cyber
---

messenger cell in [[prysm]]

the communication interface of [[cyb/sense]]. conversations with neurons, particle history, and LLM chat. split-pane: conversation list on the left, active conversation on the right

## protocol role

cell in the element tree $\mathcal{T}$. renders inside space zone of [[prysm/grid]]. accessible from robot menu or S widget

## sizing

fill × fill (occupies entire space zone)

## structure

```
glass [fill × fill, depth background]
  stack horizontal [gap 0]
    --- left: conversation list ---
    glass [fix(25g) × fill, depth midground, overflow scroll]
      tabs [All | # | @ | llm]
      stack vertical [gap 0]
        --- conversation items ---
        glass [fill × fix(8g), depth midground] — per conversation
          stack horizontal [gap g]
            glass [fix(5g) × fix(5g), corner-radius 5g/2] — avatar circle
            stack vertical
              text [body, "@mastercyb"]
              text [caption, "unsupported type"]
              counter [micro, "42", green]
            text [micro, "24/03"]
            counter [micro, message count badge]
    --- right: active conversation ---
    glass [fill × fill, depth midground, overflow scroll]
      --- depends on active tab ---
```

## tabs

### All

all conversations combined — neurons + particles + LLM. sorted by last activity

### # (particle history)

history of a [[particle]] created by the avatar. shows who interacted with it:

```
--- header ---
stack horizontal
  counter [h3, interaction count, green]
  text [caption, "years ago"]
  text [body, neuron name]
  pill [red, "56 B"] — tokens attached
--- timeline ---
stack vertical [gap g]
  text [caption, date separator "Apr 30"]
  stack horizontal — per message
    text [micro, "13:09"]
    ion [avatar]
    text [body, "resolving particle ..."]
    counter [micro, "60", green]
```

### @ (neuron chats)

direct messaging with other neurons. chat bubbles:

```
--- header ---
stack horizontal
  ion [avatar]
  text [h3, "mastercyb"]
  counter [body, "101", green]
  ion × 4 [mini avatars of other participants]
--- messages ---
stack vertical [gap g]
  text [caption, date separator "Mar 21"]
  --- incoming (left-aligned) ---
  stack horizontal
    text [micro, "13:40"]
    glass [auto × auto, corner-radius g, depth midground]
      text [body, particle or message content]
    counter [micro, "60", green]
  --- outgoing (right-aligned) ---
  stack horizontal [align right]
    glass [auto × auto, corner-radius g, depth midground]
      text [body, message content]
    text [micro, "12:50"]
```

messages carry token amounts (green counter) — each message is a [[cyberlink]] with [[conviction]]

### llm (AI models)

chat with language models:

```
--- left: conversation list ---
glass [fill × auto]
  button ["+", "new conversation", "click here to start"]
  glass — per conversation
    ion [avatar]
    text [body, "Conversation 1"]
    text [micro, "02:34"]
--- right: model chat ---
stack vertical
  stack horizontal
    ion [microphone, red]
    text [body, "openai/gpt-4o-mini"]
    button [×, close]
    button [settings]
  --- messages ---
  glass [fill × fill, overflow scroll]
    chat messages
```

commander shows "ask the model" + "Send" + attach + edit buttons

## fold

$\mathcal{F}$:
- $l_1$ ($w_{min} = 40g$): conversation list + active chat side by side
- $l_2$ ($w_{min} = 20g$): conversation list only, tap opens chat full-width (push navigation)
- $l_3$ ($w_{min} = 10g$, mobile): same as $l_2$, compact

## emotion

| element | emotion | trigger |
|---------|---------|---------|
| unread badge counter | green | new messages |
| token amount on message | green | conviction attached |
| message status | green (sent), yellow (pending), red (failed) | delivery state |
| llm model indicator | red (microphone active) | recording |
| S widget glow | [[emotion]] of latest incoming message | incoming content emotion |

## states

| state | visual | trigger |
|-------|--------|---------|
| list view | conversation list, "Select chat to start messaging" | no chat selected |
| chat view | active conversation with messages | tap on conversation |
| composing | commander input focused, "send message" | typing |
| recording | microphone active, red indicator | voice input |

## interaction

- tap conversation → open chat (right pane)
- tap tab (All/#/@/llm) → filter conversations
- type in commander → compose message
- tap send → send message (creates [[cyberlink]])
- tap attach → attach particle
- messages with green counter = token amount sent with message

## where in [[prysm/grid]]

space zone. commander adapts: "send message" for @, "ask the model" for llm. S widget on left edge shows unread count

## 3D

renders at ambient $p_z$. in 3D, conversations could orbit around neuron as message streams

## ECS

- Entity: sense-cell organelle
- Components:
  - `Sizing { width: Fill, height: Fill }`
  - `Overflow { scroll }`
  - `FoldSet { conformations }`
  - `ActiveTab { all | particle_history | neuron_chat | llm }`
  - `Conversations { list of (id, avatar, name, last_message, timestamp, unread_count) }`
  - `ActiveConversation { conversation_id }`
  - `Messages { list of (sender, content, timestamp, tokens, direction) }`
  - `LlmModel { provider, model_name }` — for llm tab
- Systems:
  - `SenseConversationSystem` fetches conversation list from cybergraph
  - `SenseMessageSystem` fetches/sends messages (cyberlinks with conviction)
  - `SenseLlmSystem` manages AI model conversations
  - `SenseNotificationSystem` updates S widget with unread count + emotion
