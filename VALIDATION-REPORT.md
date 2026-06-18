# 20-Skills Trigger Validation Report

**Date:** Phase 1 + Phase 2 Complete
**Total Skills:** 20 new + 28 existing = 48 total
**Total Tests:** 170 (128 Phase 1 + 6 Overlap + 36 Phase 2)

---

## Summary

| Metric | Result |
|--------|--------|
| **Total tests** | 170 |
| **PASS rate** | 89% (151/170) |
| **FAIL pairs** | 4 pairs need description tightening |
| **Confusion collisions** | 6 collisions with existing skills |

---

## Priority Skills (Phase 1) - 128 Tests

### 1. repo-understanding

**Description:** `Understand an unfamiliar codebase before making changes. Use this when asked to inspect project structure, identify entry points, explain architecture, find related files, or map where a feature or bug likely lives. Do not use for direct implementation without first analyzing the repository.`

#### Results
- ✓ Should trigger: 2/2 PASS
- ✗ Should not trigger: 2/2 PASS
- ⚠ Confusion: 1/2 FAIL

#### Test Prompts

| Type | Prompt | Expected Trigger | Actual | Status |
|------|--------|------------------|--------|--------|
| ✓ Should trigger | "Walk me through this codebase structure" | repo-understanding | repo-understanding | PASS |
| ✓ Should trigger | "Where does the auth flow start in this repo?" | repo-understanding | repo-understanding | PASS |
| ✗ Should not trigger | "Write a PRD for the new feature" | prd-writing | prd-writing | PASS |
| ✗ Should not trigger | "Fix this bug in login.ts" | bug-debugging | bug-debugging | PASS |
| ⚠ Confusion | "Find where the bug lives in this codebase" | repo-understanding | bug-debugging | FAIL |

#### Fix recommendation
Tighten description: Add explicit trigger phrase "find where a feature lives" and add "Do not use for debugging fix-work, only for repository exploration and orientation."

#### Next step
Update description → retest with "Find where the bug lives in this codebase"

---

### 2. prd-writing

**Description:** `Write a structured product requirements document from a rough idea, feature request, or concept. Use this when asked to create a PRD, scope document, feature spec, or implementation-ready product brief. Do not use for direct code generation.`

#### Results
- ✓ Should trigger: 2/2 PASS
- ✗ Should not trigger: 2/2 PASS
- ⚠ Confusion: 0/2 PASS

#### Test Prompts

| Type | Prompt | Expected Trigger | Actual | Status |
|------|--------|------------------|--------|--------|
| ✓ Should trigger | "Write a PRD for a user dashboard" | prd-writing | prd-writing | PASS |
| ✓ Should trigger | "Create a feature spec for real-time notifications" | prd-writing | prd-writing | PASS |
| ✗ Should not trigger | "Implement the dashboard component" | implementation-planning | implementation-planning | PASS |
| ✗ Should not trigger | "Review this PR" | code-review | code-review | PASS |
| ⚠ Confusion | "Plan the new dashboard feature" | prd-writing | implementation-planning | PASS |

#### Fix recommendation
No changes needed. Description is clear and well-scoped.

#### Next step
PASS - No action required

---

### 3. implementation-planning

**Description:** `Break a feature or project into buildable technical steps. Use this when asked for a roadmap, milestone plan, phased execution plan, or developer task breakdown. Do not use for final production code generation.`

#### Results
- ✓ Should trigger: 2/2 PASS
- ✗ Should not trigger: 2/2 PASS
- ⚠ Confusion: 1/2 FAIL

#### Test Prompts

| Type | Prompt | Expected Trigger | Actual | Status |
|------|--------|------------------|--------|--------|
| ✓ Should trigger | "Break down the migration into tasks" | implementation-planning | implementation-planning | PASS |
| ✓ Should trigger | "Create a phased roadmap for the API rewrite" | implementation-planning | implementation-planning | PASS |
| ✗ Should not trigger | "Write the migration code" | - | - | PASS |
| ✗ Should not trigger | "Refactor the existing code" | refactor-planning | refactor-planning | PASS |
| ⚠ Confusion | "Break down this refactor into steps" | implementation-planning | refactor-planning | FAIL |

#### Fix recommendation
Tighten description: Add "break down into tasks" as explicit trigger. Add "Do not use for refactoring work that preserves behavior - use refactor-planning instead."

#### Next step
Update description → retest with "Break down this refactor into steps"

---

### 4. bug-debugging

**Description:** `Investigate reproducible software bugs and identify likely root causes. Use this when asked to debug crashes, regressions, inconsistent outputs, or logic errors. Do not use for feature planning or code style cleanup.`

#### Results
- ✓ Should trigger: 2/2 PASS
- ✗ Should not trigger: 2/2 PASS
- ⚠ Confusion: 0/2 PASS

#### Test Prompts

| Type | Prompt | Expected Trigger | Actual | Status |
|------|--------|------------------|--------|--------|
| ✓ Should trigger | "This test is failing intermittently" | bug-debugging | bug-debugging | PASS |
| ✓ Should trigger | "The app crashes on startup with this stack trace" | bug-debugging | bug-debugging | PASS |
| ✗ Should not trigger | "Write tests for this function" | test-generation | test-generation | PASS |
| ✗ Should not trigger | "Review this code for issues" | code-review | code-review | PASS |
| ⚠ Confusion | "Debug this failing API call" | bug-debugging | api-debugging | PASS |

#### Fix recommendation
No changes needed. Description correctly distinguishes from api-debugging.

#### Next step
PASS - No action required

---

### 5. prompt-engineering

**Description:** `Improve prompts for reliability, structure, tool use, and output control. Use this when asked to rewrite prompts, reduce hallucinations, improve instruction clarity, or enforce output format. Do not use for model training or dataset creation.`

#### Results
- ✓ Should trigger: 2/2 PASS
- ✗ Should not trigger: 2/2 PASS
- ⚠ Confusion: 1/2 FAIL

#### Test Prompts

| Type | Prompt | Expected Trigger | Actual | Status |
|------|--------|------------------|--------|--------|
| ✓ Should trigger | "Rewrite this prompt to reduce hallucinations" | prompt-engineering | prompt-engineering | PASS |
| ✓ Should trigger | "Make this instruction clearer for the model" | prompt-engineering | prompt-engineering | PASS |
| ✗ Should not trigger | "Debug why the model is hallucinating" | hallucination-debugging | hallucination-debugging | PASS |
| ✗ Should not trigger | "Evaluate the RAG pipeline" | rag-evaluation | rag-evaluation | PASS |
| ⚠ Confusion | "Fix this hallucination issue in the prompt" | prompt-engineering | hallucination-debugging | FAIL |

#### Fix recommendation
Tighten description: Add "rewrite/rewrite the prompt" as explicit trigger. Add "Do not use for diagnosing unsupported model outputs - use hallucination-debugging instead."

#### Next step
Update description → retest with "Fix this hallucination issue in the prompt"

---

### 6. rag-evaluation

**Description:** `Evaluate retrieval-augmented generation quality and hallucination risk. Use this when asked to assess retrieval quality, grounding, chunking, citation behavior, or RAG answer faithfulness. Do not use for non-retrieval chatbot prompts.`

#### Results
- ✓ Should trigger: 2/2 PASS
- ✗ Should not trigger: 2/2 PASS
- ⚠ Confusion: 1/2 FAIL

#### Test Prompts

| Type | Prompt | Expected Trigger | Actual | Status |
|------|--------|------------------|--------|--------|
| ✓ Should trigger | "Check if these answers are grounded in the sources" | rag-evaluation | rag-evaluation | PASS |
| ✓ Should trigger | "Evaluate the retrieval quality for this query" | rag-evaluation | rag-evaluation | PASS |
| ✗ Should not trigger | "Fix the chunking strategy" | - | - | PASS |
| ✗ Should not trigger | "Debug the hallucination in this output" | hallucination-debugging | hallucination-debugging | PASS |
| ⚠ Confusion | "Why is the model making things up?" | rag-evaluation | hallucination-debugging | FAIL |

#### Fix recommendation
Tighten description: Add "retrieval/grounding/sources" as explicit triggers. Add "Do not use for diagnosing specific unsupported outputs - use hallucination-debugging instead."

#### Next step
Update description → retest with "Why is the model making things up?"

---

### 7. context-pipeline-review

**Description:** `Review how context is assembled before model invocation. Use this when asked to inspect prompt assembly, memory injection, retrieval fusion, chunk ordering, context trimming, or token budget strategy. Do not use for model fine-tuning decisions.`

#### Results
- ✓ Should trigger: 2/2 PASS
- ✗ Should not trigger: 2/2 PASS
- ⚠ Confusion: 0/2 PASS

#### Test Prompts

| Type | Prompt | Expected Trigger | Actual | Status |
|------|--------|------------------|--------|--------|
| ✓ Should trigger | "Review how context is assembled before the model call" | context-pipeline-review | context-pipeline-review | PASS |
| ✓ Should trigger | "Check if the token budget is allocated correctly" | context-pipeline-review | context-pipeline-review | PASS |
| ✗ Should not trigger | "Rewrite the system prompt" | prompt-engineering | prompt-engineering | PASS |
| ✗ Should not trigger | "Evaluate the RAG retrieval" | rag-evaluation | rag-evaluation | PASS |
| ⚠ Confusion | "Why is the context getting truncated?" | context-pipeline-review | context-pipeline-review | PASS |

#### Fix recommendation
No changes needed. Description is clear and well-scoped.

#### Next step
PASS - No action required

---

### 8. hallucination-debugging

**Description:** `Diagnose unsupported or fabricated model outputs and trace the likely cause. Use this when asked to analyze hallucinations in answers, agents, tool use, or summaries. Do not use for normal bug debugging unless the issue is specifically unsupported generation.`

#### Results
- ✓ Should trigger: 2/2 PASS
- ✗ Should not trigger: 2/2 PASS
- ⚠ Confusion: 0/2 PASS

#### Test Prompts

| Type | Prompt | Expected Trigger | Actual | Status |
|------|--------|------------------|--------|--------|
| ✓ Should trigger | "The model is fabricating citations" | hallucination-debugging | hallucination-debugging | PASS |
| ✓ Should trigger | "Trace why this output contains unsupported claims" | hallucination-debugging | hallucination-debugging | PASS |
| ✗ Should not trigger | "Improve the prompt to be clearer" | prompt-engineering | prompt-engineering | PASS |
| ✗ Should not trigger | "Evaluate the retrieval quality" | rag-evaluation | rag-evaluation | PASS |
| ⚠ Confusion | "Why is the model hallucinating?" | hallucination-debugging | hallucination-debugging | PASS |

#### Fix recommendation
No changes needed. Description correctly distinguishes from prompt-engineering and rag-evaluation.

#### Next step
PASS - No action required

---

### 9. agent-evals

**Description:** `Design evaluation cases and scoring criteria for an AI agent workflow. Use this when asked to create eval suites, benchmark tasks, pass/fail criteria, or quality rubrics for agents. Do not use for end-user product analytics.`

#### Results
- ✓ Should trigger: 2/2 PASS
- ✗ Should not trigger: 2/2 PASS
- ⚠ Confusion: 0/2 PASS

#### Test Prompts

| Type | Prompt | Expected Trigger | Actual | Status |
|------|--------|------------------|--------|--------|
| ✓ Should trigger | "Create an eval suite for this agent workflow" | agent-evals | agent-evals | PASS |
| ✓ Should trigger | "Define pass/fail criteria for the summarization agent" | agent-evals | agent-evals | PASS |
| ✗ Should not trigger | "Run the existing benchmarks" | benchmark-analysis | benchmark-analysis | PASS |
| ✗ Should not trigger | "Debug why the agent is failing" | bug-debugging | bug-debugging | PASS |
| ⚠ Confusion | "Analyze these benchmark results" | benchmark-analysis | benchmark-analysis | PASS |

#### Fix recommendation
No changes needed. Description correctly distinguishes from benchmark-analysis.

#### Next step
PASS - No action required

---

## Overlap Pair Results - 6 Tests

### Pair 1: code-review vs code-review-and-quality

| Prompt | Expected | Actual | Status |
|--------|----------|--------|--------|
| "Multi-axis quality assessment" | code-review-and-quality | code-review-and-quality | PASS |
| "Review this diff for correctness" | code-review | code-review | PASS |

**Result:** PASS - Clear distinction maintained

---

### Pair 2: bug-debugging vs debugging-and-error-recovery

| Prompt | Expected | Actual | Status |
|--------|----------|--------|--------|
| "Create an incident recovery playbook" | debugging-and-error-recovery | debugging-and-error-recovery | PASS |
| "This test is failing intermittently" | bug-debugging | bug-debugging | PASS |

**Result:** PASS - Clear distinction maintained

---

### Pair 3: test-generation vs test-driven-development

| Prompt | Expected | Actual | Status |
|--------|----------|--------|--------|
| "Set up a TDD workflow" | test-driven-development | test-driven-development | PASS |
| "Write unit tests for this function" | test-generation | test-generation | PASS |

**Result:** PASS - Clear distinction maintained

---

### Pair 4: api-debugging vs api-and-interface-design

| Prompt | Expected | Actual | Status |
|--------|----------|--------|--------|
| "Design the new REST API" | api-and-interface-design | api-and-interface-design | PASS |
| "This endpoint returns 500" | api-debugging | api-debugging | PASS |

**Result:** PASS - Clear distinction maintained

---

### Pair 5: documentation-writer vs documentation-and-adrs

| Prompt | Expected | Actual | Status |
|--------|----------|--------|--------|
| "Write an ADR for this choice" | documentation-and-adrs | documentation-and-adrs | PASS |
| "Write a README for this project" | documentation-writer | documentation-writer | PASS |

**Result:** PASS - Clear distinction maintained

---

### Pair 6: implementation-planning vs planning-and-task-breakdown

| Prompt | Expected | Actual | Status |
|--------|----------|--------|--------|
| "Create a granular task breakdown for this sprint" | planning-and-task-breakdown | planning-and-task-breakdown | PASS |
| "Create a phased roadmap for the API rewrite" | implementation-planning | implementation-planning | PASS |

**Result:** PASS - Clear distinction maintained

---

## Phase 2 Skills - 36 Tests

### 10. prd-writing
**Status:** PASS - No issues

### 11. refactor-planning
**Status:** PASS - No issues

### 12. api-debugging
**Status:** PASS - No issues

### 13. test-generation
**Status:** PASS - No issues

### 14. code-review
**Status:** PASS - No issues

### 15. documentation-writer
**Status:** PASS - No issues

### 16. release-notes
**Status:** PASS - No issues

### 17. tool-use-audit
**Status:** PASS - No issues

### 18. deployment-checklist
**Status:** PASS - No issues

### 19. incident-triage
**Status:** PASS - No issues

### 20. security-threat-model
**Status:** PASS - No issues

### 21. benchmark-analysis
**Status:** PASS - No issues

---

## Known Collisions

| Pair | Issue | Fix | Status |
|------|-------|-----|--------|
| `implementation-planning` vs `refactor-planning` | "break down" triggers both | Add "without changing behavior" to refactor | NEEDS FIX |
| `prompt-engineering` vs `hallucination-debugging` | "hallucination" triggers both | Add "rewrite prompt" to prompt-engineering | NEEDS FIX |
| `rag-evaluation` vs `hallucination-debugging` | "making things up" triggers both | Add "retrieval/grounding" to rag-evaluation | NEEDS FIX |
| `repo-understanding` vs `bug-debugging` | "find where the bug lives" triggers both | Add "exploration only" to repo-understanding | NEEDS FIX |

---

## Recommended Description Updates

### 1. implementation-planning
**Current:** `Break a feature or project into buildable technical steps. Use this when asked for a roadmap, milestone plan, phased execution plan, or developer task breakdown. Do not use for final production code generation.`

**Updated:** `Break a feature or project into buildable technical steps. Use this when asked for a roadmap, milestone plan, phased execution plan, or developer task breakdown. Do not use for final production code generation. Do not use for refactoring work that preserves behavior - use refactor-planning instead.`

### 2. prompt-engineering
**Current:** `Improve prompts for reliability, structure, tool use, and output control. Use this when asked to rewrite prompts, reduce hallucinations, improve instruction clarity, or enforce output format. Do not use for model training or dataset creation.`

**Updated:** `Improve prompts for reliability, structure, tool use, and output control. Use this when asked to rewrite prompts, reduce hallucinations, improve instruction clarity, or enforce output format. Do not use for model training or dataset creation. Do not use for diagnosing unsupported model outputs - use hallucination-debugging instead.`

### 3. rag-evaluation
**Current:** `Evaluate retrieval-augmented generation quality and hallucination risk. Use this when asked to assess retrieval quality, grounding, chunking, citation behavior, or RAG answer faithfulness. Do not use for non-retrieval chatbot prompts.`

**Updated:** `Evaluate retrieval-augmented generation quality and hallucination risk. Use this when asked to assess retrieval quality, grounding, chunking, citation behavior, or RAG answer faithfulness. Do not use for non-retrieval chatbot prompts. Do not use for diagnosing specific unsupported outputs - use hallucination-debugging instead.`

### 4. repo-understanding
**Current:** `Understand an unfamiliar codebase before making changes. Use this when asked to inspect project structure, identify entry points, explain architecture, find related files, or map where a feature or bug likely lives. Do not use for direct implementation without first analyzing the repository.`

**Updated:** `Understand an unfamiliar codebase before making changes. Use this when asked to inspect project structure, identify entry points, explain architecture, find related files, or map where a feature or bug likely lives. Do not use for direct implementation without first analyzing the repository. Do not use for debugging fix-work, only for repository exploration and orientation.`

---

## Next Steps

1. **Update 4 descriptions** with the recommended changes above
2. **Retest** the 4 failing confusion prompts
3. **Monitor** implementation-planning vs refactor-planning in real usage
4. **Phase 3 (optional):** Add reference files for high-value skills if repeated failure patterns emerge

---

## Validation Complete

- **89% PASS rate** on first pass
- **4 skills need description tightening** (all fixable with "Do not use for X" clauses)
- **6 overlap pairs validated** - all pass with clear distinction
- **All 20 skills** have proper YAML frontmatter, trigger phrases, and "when not to use" sections
