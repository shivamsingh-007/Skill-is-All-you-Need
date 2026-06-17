---
name: deployment-checklist
description: Verify release readiness for deployment. Includes incident triage and security threat modeling. Use when asked to review environment setup, secrets, CI/CD, health checks, migrations, rollout plans, production readiness, triage production issues, or review for security risks. Do not use for feature design.
---

# Deployment Checklist

## Goal
Confirm that the system is ready to release safely. Triage production incidents. Identify security risks.

## When to use
- Pre-deployment readiness checks
- Verifying environment and secret configuration
- Reviewing CI/CD pipeline status
- Checking migrations and backward compatibility
- Planning rollout and rollback strategies
- Production outage or service degradation
- Error spike or performance regression
- Reviewing system for attack surfaces
- Identifying abuse cases and threat paths
- Evaluating secret handling and privilege boundaries

## When not to use
- Feature design or architecture
- Bug fixing (use bug-debugging)
- Development workflow setup
- Formal penetration testing
- General code review (use code-review)

## Process

### Deployment Readiness
1. Verify environment and secret requirements.
2. Check build, test, and CI status.
3. Check migrations and backward compatibility.
4. Check health endpoints, logging, and alerts.
5. Review rollout and rollback plans.
6. Identify release blockers.

### Incident Triage
1. Define impact, severity, and affected users.
2. Identify current symptoms and timeline.
3. Gather logs, metrics, traces, and recent changes.
4. Form likely incident hypotheses.
5. Suggest immediate containment actions.
6. List deeper investigation next steps.

### Security Threat Model
1. Define assets, actors, and trust boundaries.
2. Identify entry points and sensitive flows.
3. List likely abuse cases and threat paths.
4. Assess privilege escalation, data exposure, injection, and secret leakage risks.
5. Recommend mitigations and verification steps.

## Output formats

### Deployment Readiness
- Readiness status
- Verified items
- Missing items
- Risks
- Blockers
- Rollout notes

### Incident Triage
- Severity
- Impact
- Symptoms
- Likely cause
- Immediate actions
- Next investigation steps

### Security Threat Model
- Assets
- Trust boundaries
- Threats
- Risk level
- Mitigations
- Verification steps
