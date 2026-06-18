---
name: bug-debugging
description: Investigate reproducible software bugs and identify likely root causes. Includes API debugging. Use when asked to debug crashes, regressions, inconsistent outputs, logic errors, broken endpoints, auth failures, bad payloads, timeouts, or schema mismatches. Do not use for feature planning or code style cleanup.
---

# Bug Debugging

## Goal
Find the smallest evidence-backed explanation for a bug.

## When to use
- Crash or exception with stack trace
- Regression after recent change
- Inconsistent output between environments
- Logic error producing wrong results
- Flaky test or intermittent failure

## When not to use
- Feature planning or design
- Code style cleanup or formatting
- Performance optimization without a specific bug
- Architecture decisions
- Use debugging-and-error-recovery for broader recovery strategies and incident playbooks

## Inputs to collect
- Expected behavior
- Actual behavior
- Reproduction steps
- Logs, traces, stack traces
- Relevant files or commits

## Process
1. Restate expected vs actual behavior.
2. Reproduce if possible.
3. Narrow the failing layer.
4. Form 2 to 3 root-cause hypotheses.
5. Rank them by evidence.
6. Propose the safest smallest fix.
7. Define validation steps.

## Failure-mode taxonomy by stack

### Node.js
| Failure Mode | Symptoms | First Check |
|--------------|----------|-------------|
| Unhandled Promise Rejection | Process crashes with `UnhandledPromiseRejectionWarning` | Missing `.catch()` on async calls |
| Memory Leak | RSS grows over time, eventual OOM | `process.memoryUsage()`, heap snapshot |
| Event Loop Blocking | High latency, timeouts, unresponsive | Sync I/O in hot path, `perf_hooks.monitorEventLoopDelay()` |
| Module Resolution Failure | `MODULE_NOT_FOUND` | Check `node_modules`, symlinks, monorepo config |
| TypeScript Build Error | Type mismatch at compile time | `tsc --noEmit`, check tsconfig paths |

### Python
| Failure Mode | Symptoms | First Check |
|--------------|----------|-------------|
| GIL Contention | CPU-bound threads don't parallelize | `threading` + CPU work → use `multiprocessing` |
| Import Circular Dependency | `ImportError: cannot import name` | Check import order, use `TYPE_CHECKING` |
| NoneType Error | `AttributeError: 'NoneType'` has no attribute | Check return values, add None guards |
| Virtual Env Mismatch | Wrong package version installed | `which python`, `pip list`, check `.venv` |
| Encoding Error | `UnicodeDecodeError` | Check file encoding, use `errors='replace'` |
| Asyncio Never Awaits | Coroutine runs but doesn't execute | Check for missing `await`, event loop running |

### Go
| Failure Mode | Symptoms | First Check |
|--------------|----------|-------------|
| Goroutine Leak | Memory grows, goroutine count increases | `runtime.NumGoroutine()`, check channel blocking |
| Channel Deadlock | `fatal error: all goroutines are asleep` | Unbuffered channels, missing receivers |
| Nil Pointer Dereference | `panic: invalid memory address` | Check error returns, nil checks on interfaces |
| Race Condition | `go build -race` detects | Shared state without mutex, use channels |
| Import Cycle | `import cycle not allowed` | Restructure packages, use interfaces |

## Reproduction time budget

| Bug Type | Reproduction Strategy | Max Time |
|----------|----------------------|----------|
| UI bug | Screenshot + DOM inspection + CSS diff | 10 min |
| API bug | Request/response capture + wiremock | 15 min |
| Performance bug | Profile → flamegraph → hotspot | 20 min |
| Concurrency bug | Stress test + race detector | 30 min |
| Data bug | DB snapshot + query reproduction | 15 min |
| Environment bug | Docker compose + env diff | 20 min |

## Log triage order

1. **Error logs** — exact error message and stack trace
2. **Warning logs** — degraded state indicators
3. **Request logs** — input parameters and timing
4. **State logs** — before/after snapshots
5. **Metric logs** — CPU, memory, latency at time of failure

## Rollback rules

| Severity | Action | Time Limit |
|----------|--------|------------|
| Critical (production down) | Rollback immediately, investigate after | 5 min |
| High (feature broken) | Rollback if fix > 30 min | 30 min |
| Medium (degraded) | Hotfix if possible, rollback if not | 2 hours |
| Low (cosmetic) | Fix forward, no rollback | Next release |

## Bug reproduction from tickets

When reproducing from a bug report or ticket:

1. Parse signals: error messages, reproduction steps, affected area.
2. Route to appropriate test strategy based on affected area.
3. Locate source files and trace the code path.
4. Form a clear, testable hypothesis.
5. Write a failing test that reproduces the bug.
6. Run and classify the result.

### Rules
- Do not fix the bug — only reproduce it with a failing test
- Leave test files in place as evidence
- Maximum 3 attempts before declaring UNCONFIRMED
- Hard bailout: requires real API credentials, race conditions, manual UI interaction

### Confidence levels

| Level | Criteria |
|-------|----------|
| CONFIRMED | Test fails consistently, matches hypothesis |
| LIKELY | Test fails but failure mode differs slightly |
| UNCONFIRMED | Cannot trigger the failure |
| SKIPPED | Hard bailout trigger hit |
| ALREADY_FIXED | Bug no longer reproduces |

### Reproduction report format
- Ticket ID and title
- Confidence level: CONFIRMED / LIKELY / UNCONFIRMED / SKIPPED / ALREADY_FIXED
- Root cause description
- Location (file, lines, issue)
- Failing test path and description
- Fix hint (pseudocode or approach)

## API debugging

When debugging backend API failures:

1. Identify endpoint, caller, environment, and auth path.
2. Check request shape, headers, params, and payload.
3. Check response, logs, and traces.
4. Compare behavior with expected contract.
5. Determine failing layer.
6. Recommend fix and verification steps.

### API failure modes
| Failure Mode | Symptoms | First Check |
|--------------|----------|-------------|
| Auth failure | 401/403, token expired | Check token expiry, scopes, audience |
| Schema mismatch | 400/422, validation error | Check request/response schema vs contract |
| Timeout | Request hangs, 504 | Check upstream latency, connection pool |
| Rate limiting | 429, quota exceeded | Check rate limit headers, backoff strategy |
| Upstream failure | 502/503, dependency error | Check dependency health, circuit breaker |

## Output format
- Summary
- Reproduction
- Root cause
- Evidence
- Fix
- Validation
