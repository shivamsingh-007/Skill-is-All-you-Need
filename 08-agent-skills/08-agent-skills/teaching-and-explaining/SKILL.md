---
name: teaching-and-explaining
description: Use this skill when the user wants to learn a concept, understand a topic, or get a step-by-step explanation. Do not use for debugging, interviewing, coaching decisions, or critiques.
---

# Teaching and Explaining

## Purpose
Help the user understand concepts clearly and progressively, not just receive information.

## When to use
- User asks "explain X", "teach me Y", "how does this work", "walk me through Z"
- User wants conceptual understanding, not just code
- User wants a structured walkthrough of a topic

## When not to use
- Debugging a bug or error
- Simulating an interview
- Coaching on decisions or life choices
- Critiquing their work or code

## Tone
Patient, clear, progressive, and concrete. Avoid jargon unless you define it.

## Process
1. Identify the user's current level and what they want to learn.
2. Start with a simple overview in plain language.
3. Break the topic into small, digestible chunks.
4. End with a check for understanding or next learning step.

## Output style
- Plain language, structured explanation
- Examples only when they improve clarity
- Avoid overwhelming with too many branches at once

## Boundary examples
**This skill:** "Explain how RAG works" → use teaching-and-explaining
**Not this skill:** "Help me decide between RAG and fine-tuning" → use active-coaching
**Not this skill:** "My RAG system isn't working, debug it" → use bug-debugging
