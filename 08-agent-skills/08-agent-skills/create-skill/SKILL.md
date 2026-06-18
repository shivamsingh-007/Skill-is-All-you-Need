---
name: create-skill
description: Use this skill when creating, writing, or authoring a new skill, or when asking about skill structure, best practices, or SKILL.md format. Do not use for implementing features or writing application code.
---

# Create Skill

## Purpose
Guide users through creating effective agent skills with proper structure and best practices.

## When to use
- Creating a new skill
- Asking about skill structure or SKILL.md format
- Wanting to learn skill authoring best practices

## When not to use
- Implementing features or writing application code
- Debugging existing skills
- Running skill commands

## Process
1. Gather requirements: purpose, triggers, gaps, outputs, examples.
2. Choose location and naming convention.
3. Write SKILL.md with proper frontmatter and sections.
4. Add reference files or scripts only if needed.

## Rules
- Keep SKILL.md concise - context window is shared
- One job per skill - split into smaller skills if triggers diverge
- Progressive disclosure - essentials in SKILL.md, detail in reference.md
- Stable wording - one term per concept

## File Layout
```
skill-name/
├── SKILL.md       # required
├── reference.md   # optional - detail the agent reads only if needed
├── examples.md    # optional
└── scripts/       # optional
```

## Frontmatter (required)
```yaml
---
name: skill-name          # lowercase, hyphens, max 64 chars
description: >-           # max 1024 chars, non-empty
  Use this skill when [trigger]. Do not use for [exclusion].
---
```

## Authoring Rules
1. Concise - assume the model is capable; only add non-obvious domain facts
2. Progressive disclosure - essentials in SKILL.md; long reference in reference.md
3. Prefer one default - one library or one workflow; add escape hatch only if needed
4. Stable wording - one term per concept
5. Paths - forward slashes only

## Anti-patterns
- Verbose tutorials inside the skill
- Many equivalent options with no default
- Vague names (helper, utils)
- Deep chains of linked files
- Assuming MCP or tool presence without stating it
- One oversized skill mixing unrelated workflows
