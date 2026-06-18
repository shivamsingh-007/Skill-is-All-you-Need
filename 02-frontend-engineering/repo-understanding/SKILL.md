---
name: repo-understanding
description: Understand an unfamiliar codebase before making changes. Use this when asked to inspect project structure, identify entry points, explain architecture, find related files, or map where a feature or bug likely lives. Do not use for direct implementation without first analyzing the repository. Do not use for debugging fix-work, only for repository exploration and orientation.
---

# Repo Understanding

## Goal
Build a reliable working model of the repository before editing code.

## When to use
- New to a codebase and need orientation
- Finding where a feature or bug likely lives
- Mapping architecture before making changes
- Identifying entry points and module boundaries
- Understanding tech stack and dependencies

## When not to use
- Direct code implementation without analysis
- Simple single-file edits with clear context
- Bug fixing when the failing file is already known
- Feature work in a well-understood codebase

## Process
1. Identify entry points, dependency files, configs, tests, and docs.
2. Map top-level directories by responsibility.
3. Detect frameworks, runtime flow, and boundaries.
4. Find files most relevant to the task.
5. Summarize architecture and likely change surface.
6. State assumptions and unknowns clearly.

## Output format
- Repo purpose
- Stack
- Entry points
- Important modules
- Likely files to inspect next
- Risks and unknowns
