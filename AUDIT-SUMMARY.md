# Batch Audit Summary

**Directory:** `C:\Users\shiva\.agents\skills\`
**Skills Audited:** 6
**Date:** 2026-06-16

---

## Individual Reports

### 1. agent-skills

**Path:** `C:\Users\shiva\.agents\skills\agent-skills\`
**Tier:** standalone (has subfolders: agents, commands, docs, hooks, references, scripts, skills)
**Entry Point:** AGENTS.md
**Overall Score:** 5%

| Component | Spec | Status | Issues |
|-----------|------|--------|--------|
| Entry point | entry-point.md | Non-compliant | 8 |
| tasks/ | — | N/A | 0 |
| templates/ | — | N/A | 0 |
| frameworks/ | — | N/A | 0 |
| context/ | — | N/A | 0 |
| checklists/ | — | N/A | 0 |
| rules/ | — | N/A | 0 |

**Violations:**
- No YAML frontmatter (missing name, type, version, category, description)
- No XML sections (uses markdown `##` headers instead of `<activation>`, `<persona>`, `<commands>`, `<routing>`, `<greeting>`)
- Entry point is 189 lines of mixed routing + process logic (should be thin)
- Filename `AGENTS.md` doesn't match directory name `agent-skills`
- No `<activation>` scope boundaries (no "Not For" section)
- No `<persona>` with role/style/expertise
- No `<routing>` with Always Load / Load on Command / Load on Demand
- No `<greeting>` with available actions

---

### 2. higgsfield-generate

**Path:** `C:\Users\shiva\.agents\skills\higgsfield-generate\`
**Tier:** standalone (has subfolder: references)
**Entry Point:** SKILL.md
**Overall Score:** 18%

| Component | Spec | Status | Issues |
|-----------|------|--------|--------|
| Entry point | entry-point.md | Non-compliant | 6 |
| references/ | — | N/A (no spec) | 0 |

**Violations:**
- Missing `type` field in frontmatter (has name, version, description, allowed-tools)
- No XML sections (uses markdown `##` headers)
- Entry point is 297 lines — heavy with workflow logic that belongs in tasks/
- Contains full Marketing Studio workflow, Virality Predictor workflow, error handling — all process logic
- No `<routing>` for lazy-loading references
- No `<greeting>` with available actions

**What's good:**
- Frontmatter exists with most required fields
- Description is detailed and specific
- Has `allowed-tools` field
- References folder exists for on-demand loading

---

### 3. higgsfield-marketplace-cards

**Path:** `C:\Users\shiva\.agents\skills\higgsfield-marketplace-cards\`
**Tier:** task-only (no subfolders)
**Entry Point:** SKILL.md
**Overall Score:** 22%

| Component | Spec | Status | Issues |
|-----------|------|--------|--------|
| Entry point | entry-point.md | Non-compliant | 5 |

**Violations:**
- Missing `type` field in frontmatter
- No XML sections
- Entry point is 88 lines — closer to thin but still contains workflow logic
- No `<routing>` section
- No `<greeting>` with available actions

**What's good:**
- Frontmatter exists with most required fields
- Relatively thin entry point compared to others
- Clear scope boundaries (NOT for product photoshoot, video gen, Soul training)
- Good UX rules section

---

### 4. higgsfield-product-photoshoot

**Path:** `C:\Users\shiva\.agents\skills\higgsfield-product-photoshoot\`
**Tier:** task-only (no subfolders)
**Entry Point:** SKILL.md
**Overall Score:** 18%

| Component | Spec | Status | Issues |
|-----------|------|--------|--------|
| Entry point | entry-point.md | Non-compliant | 6 |

**Violations:**
- Missing `type` field in frontmatter
- No XML sections
- Entry point is 215 lines — heavy with interview logic, mode selection, generation workflow
- No `<routing>` section
- No `<greeting>` with available actions
- Contains full pre-generation interview (Types A-F) — should be in tasks/

**What's good:**
- Frontmatter exists with most required fields
- Clear mode selection table
- Good "What this skill does NOT do" section
- Good "Common mistakes to avoid" section

---

### 5. higgsfield-soul-id

**Path:** `C:\Users\shiva\.agents\skills\higgsfield-soul-id\`
**Tier:** standalone (has subfolder: references)
**Entry Point:** SKILL.md
**Overall Score:** 25%

| Component | Spec | Status | Issues |
|-----------|------|--------|--------|
| Entry point | entry-point.md | Non-compliant | 4 |
| references/ | — | N/A (no spec) | 0 |

**Violations:**
- Missing `type` field in frontmatter
- No XML sections
- Entry point is 83 lines — closest to thin among all skills
- No `<routing>` for references

**What's good:**
- Frontmatter exists with most required fields
- Thinnest entry point — 83 lines
- Clear workflow steps (1-6)
- Has bootstrap, UX rules, error handling
- References folder exists

---

### 6. impeccable

**Path:** `C:\Users\shiva\.agents\skills\impeccable\`
**Tier:** standalone (has subfolders: agents, reference, scripts)
**Entry Point:** SKILL.md
**Overall Score:** 20%

| Component | Spec | Status | Issues |
|-----------|------|--------|--------|
| Entry point | entry-point.md | Non-compliant | 5 |
| reference/ | frameworks? | N/A (no spec match) | 0 |
| scripts/ | — | N/A (no spec) | 0 |

**Violations:**
- Missing `version`, `type`, `category` fields in frontmatter (only has name, description)
- No XML sections
- Entry point is 173 lines — heavy with design guidance and routing rules
- No `<routing>` with Always Load / Load on Command / Load on Demand
- No `<greeting>` with available actions

**What's good:**
- Frontmatter exists (partial)
- Comprehensive command table (22 commands)
- Has "Absolute bans" and "AI slop test" sections — unique quality gates
- Good routing rules section
- Has pin/hooks management

---

## Cross-Cutting Issues

| Pattern | Skills Affected | Impact |
|---------|----------------|--------|
| No YAML frontmatter | 1 (agent-skills) | Can't be auto-discovered or registered |
| Missing `type` field | 5 (all except agent-skills which has none) | Skill tier unknown |
| No XML sections | 6 (all) | No semantic structure, can't be parsed |
| Entry point too heavy | 4 (agent-skills, higgsfield-generate, higgsfield-product-photoshoot, impeccable) | Loads unnecessary context |
| No `<routing>` section | 6 (all) | Can't lazy-load frameworks/references |
| No `<greeting>` section | 6 (all) | User gets no orientation |
| Process logic in entry point | 5 (all except higgsfield-marketplace-cards) | Violates thin entry point principle |

---

## Remediation Priorities

Priority order (fix these first):

1. **agent-skills** — Most non-compliant. Needs complete restructure: add frontmatter, convert to XML sections, extract process logic to tasks/.
2. **higgsfield-generate** — 297-line entry point with full workflows. Extract Marketing Studio, Virality Predictor, and error handling to tasks/.
3. **higgsfield-product-photoshoot** — 215 lines with interview logic. Extract Types A-F interview to tasks/.
4. **impeccable** — Partial frontmatter, heavy entry. Add missing fields, extract routing to proper `<routing>` section.
5. **higgsfield-soul-id** — Closest to spec. Add `type` field, add `<routing>` for references.
6. **higgsfield-marketplace-cards** — Already thin. Add `type` field, wrap existing sections in XML tags.

---

## Summary

**Overall:** 0/6 skills are Skillsmith-compliant. All skills predate the Skillsmith standards and use markdown headers instead of semantic XML sections.

**Best positioned:** higgsfield-soul-id (83 lines, thinnest entry point, has references folder)
**Worst positioned:** agent-skills (189 lines, no frontmatter, mixed routing + logic)

**Common pattern:** All skills use `SKILL.md` as entry point (good convention), have frontmatter with name/description (good start), but lack the XML section structure that Skillsmith defines.

---

*Generated by /skillsmith audit*
