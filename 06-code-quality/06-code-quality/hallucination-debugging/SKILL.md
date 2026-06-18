---
name: hallucination-debugging
description: Diagnose unsupported or fabricated model outputs and trace the likely cause. Use this when asked to analyze hallucinations in answers, agents, tool use, or summaries. Do not use for normal bug debugging unless the issue is specifically unsupported generation.
---

# Hallucination Debugging

## Goal
Treat hallucination as a systems problem, not only a prompt problem.

## When to use
- Model outputs contain fabricated facts or citations
- Agent makes claims not supported by context
- Tool use produces unverifiable results
- Summaries include information not in source documents
- Need to trace root cause of unsupported generation

## When not to use
- General code bugs without model involvement
- Prompt clarity improvements (use prompt-engineering)
- RAG retrieval quality assessment (use rag-evaluation)
- Model fine-tuning or training
- Performance optimization

## Process
1. Identify the unsupported claim precisely.
2. Check whether the evidence existed in context.
3. Determine whether failure came from retrieval, prompt, tool use, memory, synthesis, or missing guardrails.
4. Identify what should have blocked the claim.
5. Recommend prevention strategies and eval cases.

## Output format
- Unsupported claim
- Evidence availability
- Failure source
- Why guardrails failed
- Prevention plan
- Eval cases
