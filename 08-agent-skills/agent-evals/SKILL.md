---
name: agent-evals
description: Design evaluation cases and scoring criteria for an AI agent workflow. Includes benchmark analysis and tool-use auditing. Use when asked to create eval suites, benchmark tasks, pass/fail criteria, quality rubrics, interpret scores, analyze regressions, or audit agent tool usage. Do not use for end-user product analytics.
---

# Agent Evals

## Goal
Define measurable tests for agent quality and reliability.

## When to use
- Creating evaluation suites for agent workflows
- Defining pass/fail or scored criteria
- Measuring agent reliability over time
- Benchmarking against baseline performance
- Identifying failure modes and edge cases

## When not to use
- End-user product analytics
- A/B testing for UX features
- Infrastructure performance monitoring
- Model fine-tuning decisions
- Use benchmark-analysis for interpreting existing benchmark results

## Process
1. Identify agent responsibilities.
2. Break evaluation into task categories and failure modes.
3. Create representative test cases.
4. Define pass/fail or scored criteria.
5. Separate functional correctness from style and efficiency.
6. Recommend baseline and stretch metrics.

## Eval case template

```yaml
eval_id: "eval_001"
task: "Summarize this PR"
input:
  pr_url: "https://github.com/org/repo/pull/123"
  context: "User wants a 3-bullet summary"
expected_output:
  format: "bullet list, 3 items"
  content_requirements:
    - "Mentions the main change"
    - "Notes any breaking changes"
    - "References related issues"
scoring:
  format_compliance: 0-5
  content_accuracy: 0-5
  completeness: 0-5
  conciseness: 0-5
```

## Success metrics

| Metric | Definition | Target |
|--------|------------|--------|
| Task Completion | Did it complete the task? | >90% |
| Format Compliance | Did it follow output format? | >95% |
| Content Accuracy | Is the content correct? | >85% |
| Edge Case Handling | Does it handle edge cases? | >80% |
| Consistency | Same input → similar output | <10% variance |

## Failure-bucket schema

```yaml
failure_buckets:
  - bucket: "format_violation"
    description: "Output doesn't match expected format"
    examples:
      - "Expected JSON, got markdown"
      - "Expected 3 bullets, got 5"
    fix: "Add format enforcement to prompt"

  - bucket: "content_hallucination"
    description: "Output contains facts not in context"
    examples:
      - "Claims PR adds feature X when it doesn't"
      - "Cites issue #456 when PR references #789"
    fix: "Ground output in provided context"

  - bucket: "incomplete"
    description: "Output misses required elements"
    examples:
      - "Only 2 bullets when 3 required"
      - "Doesn't mention breaking changes"
    fix: "Add completeness checklist to prompt"
```

## Benchmark analysis

When analyzing benchmark or evaluation results:

1. Identify what was measured and why.
2. Compare baseline vs current results.
3. Separate signal from noise.
4. Identify regressions, improvements, and suspicious outliers.
5. Explain likely causes.
6. Recommend next experiments or fixes.

### Analysis checklist
- What was the measurement methodology?
- Is the sample size sufficient?
- Are the results statistically significant?
- What changed between baseline and current?
- Are there confounding variables?

## Tool-use auditing

When auditing agent tool usage:

1. List tools available to the agent.
2. Compare actual tool use with ideal tool use for the task.
3. Identify redundant, missing, or unsafe calls.
4. Check sequencing and fallback behavior.
5. Recommend better decision rules and guardrails.

### Audit checklist
- Are all tool calls necessary?
- Are there redundant calls?
- Is the sequencing optimal?
- Are fallbacks properly handled?
- Are there unsafe actions?

## Output format
- Scope
- Eval categories
- Test cases
- Scoring rubric
- Success thresholds
- Reporting format
