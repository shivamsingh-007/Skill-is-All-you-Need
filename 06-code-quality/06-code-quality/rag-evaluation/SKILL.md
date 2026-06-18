---
name: rag-evaluation
description: Evaluate retrieval-augmented generation quality and hallucination risk. Use this when asked to assess retrieval quality, grounding, chunking, citation behavior, or RAG answer faithfulness. Do not use for non-retrieval chatbot prompts. Do not use for diagnosing specific unsupported outputs - use hallucination-debugging instead.
---

# RAG Evaluation

## Goal
Determine whether the answer is truly grounded in retrieved evidence.

## When to use
- Assessing RAG pipeline output quality
- Checking if answers are grounded in sources
- Diagnosing retrieval vs synthesis failures
- Evaluating chunking and ranking effectiveness
- Measuring hallucination risk in grounded systems

## When not to use
- Non-retrieval chatbot prompts
- General prompt quality assessment
- Model fine-tuning decisions
- Infrastructure or deployment changes
- Use hallucination-debugging for diagnosing specific unsupported outputs

## Inputs to collect
- User query
- Retrieved chunks or documents
- Final answer
- Citation behavior
- Retriever and reranker settings

## Process
1. Check relevance of retrieved context.
2. Check for missing evidence.
3. Compare answer against retrieved evidence only.
4. Identify unsupported claims and overreach.
5. Diagnose likely failure source.
6. Recommend targeted fixes and eval cases.

## Retrieval quality metrics

| Metric | Definition | Target |
|--------|------------|--------|
| Precision@K | Relevant docs in top-K results | >0.7 |
| Recall@K | Relevant docs retrieved / total relevant | >0.8 |
| MRR | Mean Reciprocal Rank of first relevant result | >0.6 |
| NDCG | Normalized Discounted Cumulative Gain | >0.7 |
| Hit Rate | % of queries with at least 1 relevant result | >0.9 |

## Grounding failure taxonomy

| Failure Type | Description | Detection |
|--------------|-------------|-----------|
| Hallucination | Model generates fact not in context | Compare output to retrieved docs |
| Contradiction | Model says X, context says not-X | Semantic similarity check |
| Irrelevance | Model answers different question | Question-answer alignment |
| Insufficiency | Context doesn't contain answer | Check if context has required info |
| Staleness | Context is outdated | Timestamp comparison |

## Evaluation template

```yaml
query: "What is the refund policy?"
context:
  - doc1: "30-day refund policy for all products"
  - doc2: "No refunds after 30 days"
expected_answer: "30-day refund policy for all products"
expected_docs: ["doc1"]
metrics:
  precision@1: 1.0
  recall@1: 0.5
  faithfulness: 1.0
```

## Inspection checklist

- [ ] Query matches user intent (not just keywords)
- [ ] Retrieved docs are relevant (not just containing keywords)
- [ ] Answer is grounded in retrieved docs (not from memory)
- [ ] Answer doesn't contradict retrieved docs
- [ ] Answer addresses the full question (not partial)
- [ ] Citation is accurate (doc actually says what's claimed)

## Output format
- Retrieval quality
- Grounding quality
- Risks
- Likely failure source
- Fixes
- Eval suggestions
