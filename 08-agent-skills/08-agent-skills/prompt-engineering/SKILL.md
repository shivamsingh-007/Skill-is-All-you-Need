---
name: prompt-engineering
description: >
  Use this skill when rewriting prompts, reducing hallucinations, improving instruction clarity, or enforcing output format.
  Do not use for model training or dataset creation.
triggers:
  - "improve this prompt"
  - "reduce hallucinations"
  - "prompt optimization", structure, tool use, and output control. Use this when asked to rewrite prompts, reduce hallucinations, improve instruction clarity, or enforce output format. Do not use for model training or dataset creation. Do not use for diagnosing unsupported model outputs - use hallucination-debugging instead.
---

# Prompt Engineering

## Goal
Make prompts easier for a model to follow reliably.

## When to use
- Prompt produces inconsistent or unwanted outputs
- Need to enforce structured output format
- Reducing hallucination or off-topic responses
- Optimizing prompts for agent tool use
- Improving instruction clarity and reducing ambiguity

## When not to use
- Model fine-tuning or training
- Dataset creation or curation
- Infrastructure or deployment changes
- Performance optimization at inference level
- Use hallucination-debugging for diagnosing unsupported model outputs

## Process
1. Identify task objective.
2. Find ambiguity or conflicting instructions.
3. Add role, task, constraints, input format, and output schema.
4. Remove unnecessary verbosity.
5. Add examples only when they improve consistency.
6. Present the improved prompt and rationale.

## Output format
- Weaknesses
- Revised prompt
- Improvements
- Trade-offs
