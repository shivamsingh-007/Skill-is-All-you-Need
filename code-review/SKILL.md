---
name: code-review
description: Review existing code changes for correctness, maintainability, risk, and test coverage. Use this when asked to review a diff, pull request, or implementation before merge. Do not use for greenfield planning without code.
---

# Code Review

## Goal
Identify must-fix issues and meaningful improvements.

## When to use
- Reviewing a diff or pull request
- Checking implementation before merge
- Assessing correctness and edge cases
- Evaluating test coverage adequacy
- Identifying security or performance risks

## When not to use
- Greenfield planning without existing code
- Writing new code or features
- Architecture design from scratch
- Use code-review-and-quality for multi-axis quality assessments

## Process
1. Understand the intended change.
2. Review behavior changes, not just style.
3. Check correctness, edge cases, and regressions.
4. Check tests, docs, config, and operational impact.
5. Separate must-fix issues from optional improvements.

## Language-specific checklists

### TypeScript / JavaScript
| Category | Check | Why |
|----------|-------|-----|
| Type Safety | No `any` types | Bypasses type checking |
| Type Safety | Prefer `satisfies` over `as` assertions | `as` can lie, `satisfies` validates |
| Null Safety | No empty `catch` blocks | Swallows errors silently |
| Null Safety | Check `error instanceof Error` before `.message` | Unknown throws may not be Error |
| Performance | No `Array.includes()` on arrays >100 items | O(n), use Set |
| Security | No `eval()` or `Function()` constructor | Code injection |
| Patterns | Use `readonly` for immutable data | Prevents accidental mutation |

### Python
| Category | Check | Why |
|----------|-------|-----|
| Type Safety | Run `mypy --strict` | Catches type errors |
| Null Safety | No bare `except:` | Catches SystemExit, KeyboardInterrupt |
| Null Safety | `is not None` not `!= None` | PEP 8, handles `__eq__` override |
| Performance | No `+` in loops | String concat is O(n²), use `"".join()` |
| Security | No `pickle.loads()` on untrusted data | Arbitrary code execution |
| Patterns | Use `pathlib` not `os.path` | More readable, less error-prone |

### Go
| Category | Check | Why |
|----------|-------|-----|
| Error Handling | Check ALL error returns | Unchecked errors → silent failures |
| Error Handling | Use `errors.Is()` / `errors.As()` | Wrapped errors won't match string compare |
| Concurrency | No shared state without sync | Race conditions |
| Concurrency | Use `defer` for cleanup | Prevents resource leaks |
| Performance | No `fmt.Sprintf()` in hot paths | Allocates on every call |

## Security traps

| Trap | Description | Fix |
|------|-------------|-----|
| SQL Injection | String concatenation in queries | Parameterized queries |
| XSS | Unescaped user input in HTML | Template escaping |
| Path Traversal | User input in file paths | Validate against whitelist |
| SSRF | User-controlled URLs in requests | Validate against allowlist |
| Secrets in Code | Hardcoded API keys | Use env vars or vault |

## Performance traps

| Trap | Description | Fix |
|------|-------------|-----|
| N+1 Queries | Loop makes DB call per item | JOIN or batch query |
| Unbounded Queries | No LIMIT on DB query | Add pagination |
| Missing Index | Full table scan on large table | Add index on filter columns |
| Memory Bloat | Loading large dataset into memory | Stream or paginate |

## Severity ordering

Prioritize findings in this order:
1. **Bugs** — logic errors, off-by-one, null handling, incorrect conditions
2. **Behavioral regressions** — changes that break existing behavior
3. **Security issues** — injection, auth gaps, unsafe input handling
4. **Missing tests** — untested changes or edge cases
5. **Style/naming** — only if they genuinely matter

## Output style

- Structured markdown: Summary, Findings, Suggestions
- Line-specific comments with file and line numbers
- Severity labels: Critical, Important, Minor
- Propose actual code fixes, not vague hints
- Check backward compatibility for API/behavior changes
- Validate consistency with existing patterns

## Output format
- Summary
- Must-fix issues
- Important improvements
- Gaps in validation
- Merge recommendation
