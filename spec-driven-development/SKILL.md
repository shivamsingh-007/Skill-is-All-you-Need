---
name: spec-driven-development
description: Use this skill when working on a feature that has a spec, when the user says "spec", or when starting implementation of a documented feature. Also use when verifying implementation against a spec or updating a spec after changes. Do not use for ad-hoc bug fixes or exploratory coding.
---

# Spec-Driven Development

## Purpose
Keep implementation and specs in sync. Neither leads exclusively.

## When to use
- Working on a feature with an existing spec
- Starting implementation of a documented feature
- Verifying implementation matches spec
- Updating spec after implementation changes

## When not to use
- Ad-hoc bug fixes without specs
- Exploratory coding or prototyping
- Simple changes that don't need specs

## Process
1. Find and read the spec before writing code.
2. Implement with spec decisions as reference.
3. When you diverge from the spec, update it immediately.
4. After completing work, verify spec and code are aligned.

## Rules
- Don't re-decide what the spec already settled.
- Update spec immediately when you diverge.
- Flag unresolved gaps to the user.

## Output style
- Structured comparison: Aligned / Drift / Gaps
- Updated spec files when drift is found
- Clear summary of what was implemented vs what was planned

## Spec File Conventions
- One or more markdown files per feature
- Keep specs concise - use tables for mappings, code blocks for shapes
- Use checkboxes (`- [ ]` / `- [x]`) to track progress
- Split into multiple files when it helps
