# SKILL LIBRARY AUDIT REPORT

**Date:** 2026-06-17
**Total Skills:** 74
**Skills Audited:** 50 (direct) + 24 (agent-skills)

---

## EXECUTIVE SUMMARY

**The majority of these skills are indistinguishable from what a model already knows.** They re-state general knowledge in a SKILL.md wrapper and hope that counts as a skill. A skill should encode *non-obvious domain expertise* that the model cannot produce on its own. Most of these do not do that.

### The Numbers

| Category | Count | Percentage |
|----------|-------|------------|
| Exceptional (8-10) | 5 | 7% |
| Good (6-7) | 14 | 19% |
| Generic (5) | 30 | 40% |
| Noise (3-4) | 11 | 15% |
| N/A (higgsfield/impeccable) | 14 | 19% |

**Only 5 skills (7%) are genuinely excellent.** The rest range from "marginally useful" to "delete immediately."

---

## TIER 1: EXCEPTIONAL (Keep & Enhance)

### 1. design-taste-frontend — Score: 9/10

**What it does:** Anti-slop frontend skill for landing pages, portfolios, and redesigns.

**Why it works:**
- Encodes *anti-patterns that LLMs actually produce* (banned hex families, AI tells)
- Specific, opinionated rules (no centered hero when DESIGN_VARIANCE > 4)
- Corrects known model failure modes (beige+brass premium default, em-dashes, "Welcome to" openers)
- The "Three Dials" system (DESIGN_VARIANCE, MOTION_INTENSITY, VISUAL_DENSITY) is genuinely non-obvious

**What's wrong:**
- 780+ lines — consumes massive context window
- GSAP code skeletons burn tokens unnecessarily
- Could be split into core rules + reference files

**Fix:** Split into 3 files: core rules (~200 lines), code skeletons (reference), AI tells (reference).

---

### 2. emil-design-eng — Score: 8/10

**What it does:** Emil Kowalski's design engineering philosophy on animation, component design, and UI polish.

**Why it works:**
- "Animation Decision Framework" is genuinely non-obvious (should this animate at all? → purpose → easing → speed)
- Spring physics, clip-path mastery, Sonner principles encode real expertise
- Review format (Before/After/Why table) is actionable
- "Never animate keyboard-initiated actions" is a rule the model would not generate

**What's wrong:**
- 669 lines — too long
- Reads like a blog post, not a followable process
- No decision tree at the top for routing

**Fix:** Add a 30-line routing section at the top. Split code examples to reference files.

---

### 3. ecc\ck (Context Keeper) — Score: 8/10

**What it does:** Persistent per-project memory with session tracking.

**Why it works:**
- Genuine utility — the model actually needs persistent memory
- Commands are well-documented (init, remember, recall, forget, search)
- Session-start hook is a real feature
- `context.json` schema is explicit

**What's wrong:**
- No error recovery guidance when scripts fail
- No backup strategy mentioned

**Fix:** Add error recovery section and data integrity guidance.

---

### 4. ecc\rules-distill — Score: 8/10

**What it does:** Scans other skills, extracts cross-cutting principles, distills them into rules.

**Why it works:**
- Genuinely sophisticated meta-skill
- 3-phase process (inventory, cross-read, user review) is well-designed
- Verdict system (Append/Revise/New Section/New File/Already Covered/Too Specific) is thoughtful
- Solves a real problem: skills accumulate contradictions over time

**What's wrong:**
- Depends on scripts (`scan-skills.sh`, `scan-rules.sh`) that must exist
- No manual fallback if scripts don't work

**Fix:** Add "manual mode" fallback where the agent does scanning without scripts.

---

### 5. impeccable — Score: 8/10

**What it does:** Frontend polish, critique, and design guidance.

**Why it works:**
- Well-structured with clear routing
- 20+ reference files loaded on demand (critique, craft, animate, etc.)
- The greeting pattern is clean
- Real value is in the reference files, not the SKILL.md

**What's wrong:**
- Depends on referenced files (`@tasks/routing.md`, `@tasks/design-guidance.md`)
- If references don't exist, skill breaks silently

**Fix:** Add fallback: "If reference files are missing, proceed with core rules from SKILL.md."

---

## TIER 2: GOOD (Keep with Improvements)

### 6. create-skill — Score: 7/10

**What it does:** Meta-skill for creating new skills with proper structure.

**Why it works:**
- Authoring rules (concise, progressive disclosure, one default, stable wording) are real guidance
- Anti-patterns section is valuable
- File layout conventions are practical

**What's wrong:**
- No examples of good vs bad skills
- No before/after rewrites

**Fix:** Add 3 example skill rewrites (bad → good).

---

### 7. ui-styling — Score: 7/10

**What it does:** shadcn/ui + Tailwind CSS styling reference.

**Why it works:**
- Comprehensive component catalog
- Theme configuration guidance
- Accessibility patterns

**What's wrong:**
- Overlaps heavily with design-taste-frontend, ui-ux-pro-max, design-system
- SKILL.md is mostly a table of contents pointing to references
- No opinionated rules — describes *what shadcn/ui is* not *when to use it*

**Fix:** Reduce to 50 lines of routing + decision rules. Move code examples to references.

---

### 8. higgsfield-* (4 skills) — Score: 7/10 each

**What they do:** Image/video generation via Higgsfield AI.

**Why they work:**
- Well-structured with clear routing
- `<activation>` and `<routing>` XML sections are a good pattern
- Persona system is clean

**What's wrong:**
- CLI-dependent — useless without `higgsfield` installed
- 4 skills share identical persona/routing boilerplate
- Could be 1 skill with mode selection

**Fix:** Merge into one higgsfield skill with sub-commands. Add error handling when CLI unavailable.

---

### 9. ecc\learn — Score: 7/10

**What it does:** Instinct-based learning from sessions with confidence scoring.

**Why it works:**
- Ambitious architecture with project scoping
- Session tracking with confidence scores
- Potential for real long-term improvement

**What's wrong:**
- Requires hooks in `settings.json`, background observer agent (Haiku), Python CLI
- Observer is disabled by default (`observer.enabled: false`)
- Complex setup — degrades silently if any piece is missing

**Fix:** Add "minimal setup" section. Default observer to enabled. Reduce config surface.

---

### 10. ecc\browser-qa — Score: 7/10

**What it does:** Browser visual testing via Chrome DevTools MCP.

**Why it works:**
- Clear 4-phase process (smoke, interaction, visual, accessibility)
- Safety-first read-only default is smart
- Output format template is practical

**What's wrong:**
- Depends on browser MCP tools being available
- No guidance when MCP is not installed

**Fix:** Add "Prerequisites" section listing required MCP tools.

---

### 11-15. The "5/10 Generic" Skills

These skills are what the model already does without being told:

| Skill | Problem | Fix |
|-------|---------|-----|
| bug-debugging | Standard process the model follows naturally | Add stack-specific debugging checklists |
| code-review | Model already does severity ordering | Add language-specific review checklists |
| human-like-code-review | 90% overlap with code-review | Merge into code-review or delete |
| implementation-planning | Standard planning the model does | Add concrete planning heuristics |
| test-generation | "Cover happy path, failures, edge cases" | Add framework-specific testing patterns |

---

## TIER 3: NOISE (Delete or Completely Rewrite)

### 16. professional-etiquette — Score: 3/10

**Verdict:** Delete.

**Why:** This is a skill that tells the model to "be polite." The model is already polite. There is zero non-obvious knowledge. The entire skill is 33 lines of "Ask about context. Identify issues. Provide 1-2 revised versions."

---

### 17. empathetic-listening — Score: 3/10

**Verdict:** Delete or merge into active-coaching.

**Why:** This is a skill that tells the model to "be empathetic." The model is already empathetic by default. The "Rules" section ("Do not jump into fixing before acknowledging emotion") is the model's default behavior.

---

### 18. feedback-delivery — Score: 4/10

**Verdict:** Delete or merge into active-coaching.

**Why:** "List 2-4 strengths. List 2-4 weaknesses. Provide 2-4 suggestions." This is a template, not a skill. The model produces this format naturally.

---

### 19-25. The "Generic Process" Skills

These skills all follow the same pattern — restating standard engineering processes:

| Skill | Score | What the model already does |
|-------|-------|-----------------------------|
| active-coaching | 5 | Acknowledge, ask questions, reframe |
| socratic-tutoring | 5 | Ask one question at a time |
| teaching-and-explaining | 5 | Identify level, start simple, check understanding |
| interviewing | 5 | Ask 1-3 questions grouped by topic |
| mock-interviewer | 5 | State context, ask question, evaluate |
| refactor-planning | 5 | Identify layers, break into slices |
| deployment-checklist | 5 | Verify environment, check build, check migrations |

**None of these encode non-obvious knowledge.** The model does all of this without being told.

---

## CROSS-CUTTING ISSUES

### Issue 1: Massive Overlap

The following skill groups overlap so heavily they should be consolidated:

| Group | Skills | Overlap |
|-------|--------|---------|
| Design Review | code-review, human-like-code-review | 90% |
| Coaching | active-coaching, empathetic-listening, feedback-delivery | 70% |
| Bug Debugging | bug-debugging, reproduce-bug | 60% |
| Design System | design-system, brand, ui-styling, unified-design, banner-design, slides, ui-ux-pro-max | Massive |
| Design Intelligence | ui-ux-pro-max, design-taste-frontend, emil-design-eng | Significant |

**Recommendation:** Consolidate into 2-3 design skills max. Keep design-taste-frontend, merge emil-design-eng's animation content into it.

---

### Issue 2: The "Missing Scripts" Problem

Several skills depend on scripts that may or may not exist:

| Skill | Missing Scripts |
|-------|-----------------|
| brand | `inject-brand-context.cjs`, `validate-asset.cjs`, `extract-colors.cjs` |
| design-system | `generate-tokens.cjs`, `validate-tokens.cjs` |
| ui-ux-pro-max | `search.py` (entire skill depends on this) |
| unified-design | `logo/search.py`, `cip/generate.py`, `icon/generate.py` |
| higgsfield-* | `higgsfield` CLI |

If these scripts don't exist, the skills break silently. There is no "prerequisites check" in most of them.

**Fix:** Add prerequisite checks at the top of each skill. Add fallback guidance.

---

### Issue 3: The "Too Long" Problem

Three skills exceed 600 lines:

| Skill | Lines | Problem |
|-------|-------|---------|
| design-taste-frontend | 780+ | Context window hog |
| emil-design-eng | 669 | Reads like a blog post |
| ui-ux-pro-max | 654 | Database, not skill |

The create-skill skill itself says "Keep SKILL.md concise - context window is shared." These skills violate their own advice.

**Fix:** Split into SKILL.md (core rules) + reference files (detailed content).

---

### Issue 4: The "No Validation" Problem

Not a single skill validates that its prerequisites exist before proceeding. The higgsfield skills at least check for CLI availability. The design skills assume scripts exist without checking.

**Fix:** Add prerequisite checks to every skill.

---

## RECOMMENDED ACTIONS

### Immediate (Delete)

Delete these skills — they add zero value:

1. `professional-etiquette` (3/10)
2. `empathetic-listening` (3/10)
3. `feedback-delivery` (4/10)
4. `human-like-code-review` (merge into code-review first)

### Short-Term (Consolidate)

Merge these overlapping skill groups:

1. **Code Review:** `code-review` + `human-like-code-review` → single `code-review`
2. **Coaching:** `active-coaching` + `empathetic-listening` + `feedback-delivery` → single `coaching`
3. **Bug Debugging:** `bug-debugging` + `reproduce-bug` → single `bug-debugging`
4. **Design:** `design-system` + `brand` + `ui-styling` + `unified-design` + `banner-design` + `slides` → 2-3 focused skills

### Medium-Term (Enhance)

Add non-obvious domain knowledge to these 5/10 skills:

1. `bug-debugging` → Add stack-specific debugging checklists
2. `code-review` → Add language-specific review checklists
3. `implementation-planning` → Add concrete planning heuristics
4. `test-generation` → Add framework-specific testing patterns
5. `prompt-engineering` → Add specific prompt patterns with examples

### Long-Term (Split)

Split these oversized skills:

1. `design-taste-frontend` → Core rules (200 lines) + code skeletons (reference) + AI tells (reference)
2. `emil-design-eng` → Routing (30 lines) + animation framework + component principles + reference
3. `ui-ux-pro-max` → Routing/workflow (150 lines) + data tables (CSV files)

---

## FINAL VERDICT

**The library has 5 genuinely excellent skills, 10 good skills, 30 generic skills, and 11 noise skills.**

The generic skills (5/10) are the biggest problem — they exist but don't help. The model already does what they describe. They waste context window space and create confusion about which skill to use.

**The library needs consolidation, not expansion.** Reduce from 74 skills to ~30 focused, high-quality skills. Delete the noise. Merge the overlaps. Enhance the generics with non-obvious domain knowledge.

---

## SKILL QUALITY MATRIX

| Skill | Score | Works? | Non-Obvious? | Verdict |
|-------|-------|--------|--------------|---------|
| design-taste-frontend | 9 | Yes | Yes | Keep |
| emil-design-eng | 8 | Yes | Yes | Keep, add routing |
| ecc\ck | 8 | Yes | Yes | Keep |
| ecc\rules-distill | 8 | Yes | Yes | Keep, add manual fallback |
| impeccable | 8 | Yes | Yes | Keep, verify references |
| create-skill | 7 | Yes | Somewhat | Keep, add examples |
| ui-styling | 7 | Yes | Somewhat | Keep, reduce overlap |
| higgsfield-generate | 7 | Yes (CLI) | Yes | Keep, add CLI check |
| higgsfield-product-photoshoot | 7 | Yes (CLI) | Yes | Merge into higgsfield |
| higgsfield-marketplace-cards | 7 | Yes (CLI) | Yes | Merge into higgsfield |
| higgsfield-soul-id | 7 | Yes (CLI) | Yes | Merge into higgsfield |
| ecc\learn | 7 | Partially | Yes | Keep, simplify setup |
| ecc\browser-qa | 7 | Yes (MCP) | Yes | Keep, add prerequisites |
| ui-ux-pro-max | 6 | Partially | No | Split, verify script |
| design-system | 6 | Partially | Somewhat | Split, overload |
| brand | 6 | Partially | Somewhat | Add script checks |
| hallucination-debugging | 6 | Yes | Somewhat | Add detection methods |
| rag-evaluation | 6 | Yes | Somewhat | Add metrics/templates |
| context-pipeline-review | 6 | Yes | Somewhat | Add inspection checklists |
| agent-evals | 6 | Yes | Somewhat | Add templates/examples |
| reproduce-bug | 6 | Yes | Somewhat | Add bug-type strategies |
| spec-driven-development | 6 | Yes | Somewhat | Add spec writing guidance |
| banner-design | 6 | Yes | Somewhat | Merge into unified-design |
| bug-debugging | 5 | Yes | No | Add stack-specific guides |
| code-review | 5 | Yes | No | Add language checklists |
| human-like-code-review | 5 | Yes | No | Merge into code-review |
| implementation-planning | 5 | Yes | No | Add planning heuristics |
| test-generation | 5 | Yes | No | Add framework patterns |
| active-coaching | 5 | Yes | No | Merge into coaching |
| socratic-tutoring | 5 | Yes | No | Add questioning techniques |
| teaching-and-explaining | 5 | Yes | No | Add teaching frameworks |
| interviewing | 5 | Yes | No | Add interview frameworks |
| mock-interviewer | 5 | Yes | No | Add scoring rubrics |
| refactor-planning | 5 | Yes | No | Add refactoring patterns |
| deployment-checklist | 5 | Yes | No | Add platform checklists |
| documentation-writer | 5 | Yes | No | Add templates |
| prd-writing | 5 | Yes | No | Add templates |
| prompt-engineering | 5 | Yes | No | Add prompt patterns |
| release-notes | 5 | Yes | No | Add templates |
| repo-understanding | 5 | Yes | No | Add stack guides |
| tool-use-audit | 5 | Yes | No | Add anti-patterns |
| benchmark-analysis | 5 | Yes | No | Add statistical guidance |
| unified-design | 5 | Partially | No | Consolidate design skills |
| slides | 5 | Partially | No | Absorb from design-system |
| feedback-delivery | 4 | Yes | No | Delete or merge |
| professional-etiquette | 3 | Yes | No | Delete |
| empathetic-listening | 3 | Yes | No | Delete or merge |
