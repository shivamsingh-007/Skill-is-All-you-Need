---
name: context-pipeline-review
description: Review how context is assembled before model invocation. Use this when asked to inspect prompt assembly, memory injection, retrieval fusion, chunk ordering, context trimming, or token budget strategy. Do not use for model fine-tuning decisions.
---

# Context Pipeline Review

## Goal
Evaluate whether the model receives the right information in the right order.

## When to use
- Diagnosing context-related quality issues
- Reviewing prompt assembly and ordering
- Checking token budget allocation
- Auditing memory injection or retrieval fusion
- Investigating context truncation or loss

## When not to use
- Model fine-tuning or training decisions
- Prompt rewriting for clarity
- RAG retrieval quality assessment (use rag-evaluation)
- Infrastructure or deployment changes
- Use context-engineering for designing new context systems

## Process
1. Identify all context sources.
2. Inspect ordering, truncation, and deduplication.
3. Check whether critical context arrives too late or not at all.
4. Check token budget allocation.
5. Identify noisy or conflicting context.
6. Recommend improvements to composition and prioritization.

## Pipeline inspection checklist

| Stage | Check | What to Look For |
|-------|-------|------------------|
| Query Processing | Query rewriting | Did it preserve intent? Add context? |
| Query Processing | Query expansion | Did it add relevant synonyms? Too many? |
| Retrieval | Retrieval method | BM25, vector, hybrid? Right for this query? |
| Retrieval | Top-K selection | Is K too small (missing docs) or too large (noise)? |
| Reranking | Reranker applied? | Cross-encoder reranking improves precision |
| Reranking | Score threshold | Are low-relevance docs filtered? |
| Context Assembly | Token budget | Is context within model's window? |
| Context Assembly | Deduplication | Are duplicate/near-duplicate docs removed? |
| Context Assembly | Ordering | Are most relevant docs first? |
| Generation | Prompt template | Does it instruct the model to use context? |
| Generation | Citation requirement | Does it ask for citations? |

## Common failure patterns

| Pattern | Symptom | Fix |
|---------|---------|-----|
| Keyword mismatch | User asks "refund" but docs say "return" | Add query expansion |
| Over-retrieval | Too many irrelevant docs in context | Lower top-K or raise threshold |
| Under-retrieval | Missing critical context | Increase top-K, add hybrid search |
| Stale context | Docs are outdated | Add freshness filter |
| Bias in ranking | Recent docs always ranked higher | Use balanced scoring |

## Optimization strategies

| Strategy | When to Use | Tradeoff |
|----------|-------------|----------|
| Increase top-K | Missing relevant docs | More tokens, more noise |
| Lower threshold | Too many irrelevant docs | May miss marginal docs |
| Add reranker | Precision matters | +100-200ms latency |
| Query expansion | Vocabulary mismatch | More recall, less precision |
| HyDE | Complex queries | Generate hypothetical doc first |
| Multi-query | Ambiguous queries | Multiple query variants |

## Output format
- Current pipeline
- Failure points
- Token budget risks
- Context quality issues
- Recommended changes
