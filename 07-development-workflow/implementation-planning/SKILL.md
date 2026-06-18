---
name: implementation-planning
description: Break a feature or project into buildable technical steps. Includes refactor planning. Use when asked for a roadmap, milestone plan, phased execution plan, developer task breakdown, or safe code refactoring. Do not use for final production code generation.
---

# Implementation Planning

## Goal
Convert a request into an ordered, dependency-aware build plan.

## When to use
- Planning a new feature with multiple components
- Breaking large work into milestones
- Creating task breakdowns for developer execution
- Mapping dependencies between work items
- Phasing delivery across sprints or iterations

## When not to use
- Writing final production code directly
- Simple bug fixes with clear scope
- Task breakdown for single-file changes
- Code review or quality assessment
- Use planning-and-task-breakdown for granular task slicing within a sprint

## Process
1. Clarify desired end state.
2. Identify affected layers.
3. Break the work into thin vertical slices.
4. Order tasks by dependency and risk.
5. Add tests and verification to each slice.
6. Flag blockers and open decisions.

## Slice sizing heuristics

| Slice Size | When to Use | Example |
|------------|-------------|---------|
| 1-2 hours | Bug fix, config change, simple UI tweak | Fix button alignment, add env var |
| 4-8 hours | Single feature, single endpoint, single component | Add search endpoint, build modal |
| 1-2 days | Feature with 2-3 components | User profile with edit/view/settings |
| 3-5 days | Feature with backend + frontend + tests | Payment flow with UI, API, webhook |
| 1-2 weeks | Multi-component feature | Dashboard with 5+ widgets, data pipeline |

**Rule:** If a slice is >2 days, break it down further.

## Dependency mapping

| Dependency Type | Example | Sequencing Rule |
|-----------------|---------|-----------------|
| Data dependency | B needs A's output | A before B |
| Infrastructure | B needs A's service running | A before B, A deployable independently |
| UI dependency | B renders A's data | A before B, mock A's data for B development |
| No dependency | A and B are independent | Parallel development OK |

## Rollback-aware sequencing

| Phase | Rollback Strategy | Checkpoint |
|-------|-------------------|------------|
| 1. Schema migration | Forward-only, no destructive ops | Test rollback on staging |
| 2. API changes | Additive only (new endpoints, not modified) | Version API, keep old endpoint |
| 3. Frontend changes | Feature flags, instant disable | Toggle in config, not code |
| 4. Backend logic | Shadow mode, compare outputs | Run old + new, diff results |
| 5. Full rollout | Canary → 10% → 50% → 100% | Monitor error rate at each stage |

## Risk scoring

| Factor | Low (1) | Medium (2) | High (3) |
|--------|---------|------------|----------|
| Blast radius | Single user | Single team | All users |
| Data impact | Read-only | Non-destructive write | Destructive write |
| Reversibility | Instant rollback | Rollback with data fix | Manual recovery |
| Testing coverage | >80% | 50-80% | <50% |
| Dependencies | None | 1-2 services | >2 services |

**Risk Score = Sum.** If >10, add extra review step. If >15, require design review.

## Refactor planning

When planning safe code refactors:

1. Identify pain points in current structure.
2. Separate structural changes from behavior changes.
3. Define invariants that must remain true.
4. Plan small reversible refactor steps.
5. Add regression tests before risky moves.
6. Highlight rollback points.

### Refactor rules
- Behavior must not change externally
- Each step must be reversible
- Tests must pass at every step
- Rollback points must be defined

## Output format
- End state
- Assumptions
- Milestones
- Tasks
- Validation plan
- Risks
- Recommended first step
