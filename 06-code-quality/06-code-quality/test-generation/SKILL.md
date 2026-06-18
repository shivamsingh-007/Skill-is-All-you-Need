---
name: test-generation
description: Create tests for existing code or planned behavior. Use this when asked to write unit, integration, regression, or end-to-end tests. Do not use for performance benchmarking or observability setup.
---

# Test Generation

## Goal
Produce high-signal tests that verify behavior and catch regressions.

## When to use
- Writing unit, integration, or E2E tests
- Adding regression tests for known bugs
- Covering edge cases and failure paths
- Creating test plans for new features
- Improving test coverage

## When not to use
- Performance benchmarking or load testing
- Observability or monitoring setup
- TDD methodology guidance (use test-driven-development)
- Production incident response

## Process
1. Identify behavior under test.
2. Choose the right test level.
3. Cover happy path, failures, and edge cases.
4. Prefer deterministic inputs and assertions.
5. Add regression cases for known bugs.
6. Note required fixtures or mocks.

## Framework-specific patterns

### Jest / Vitest
```typescript
beforeEach(() => {
  jest.resetModules()
  jest.clearAllMocks()
})

jest.useFakeTimers()
jest.advanceTimersByTime(1000)

expect(component).toMatchInlineSnapshot(`
  <div>
    <h1>Hello</h1>
  </div>
`)
```

### pytest
```python
@pytest.fixture
def db():
    conn = create_connection()
    yield conn
    conn.close()

@pytest.mark.parametrize("input,expected", [
    ("hello", "HELLO"),
    ("", ""),
    ("123", "123"),
])
def test_uppercase(input, expected):
    assert uppercase(input) == expected

def test_api_call(monkeypatch):
    monkeypatch.setattr("requests.get", mock_get)
    result = fetch_data()
    assert result == expected
```

### Go
```go
func TestAdd(t *testing.T) {
    tests := []struct {
        name     string
        a, b     int
        expected int
    }{
        {"positive", 1, 2, 3},
        {"zero", 0, 0, 0},
        {"negative", -1, -2, -3},
    }
    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            if got := Add(tt.a, tt.b); got != tt.expected {
                t.Errorf("Add(%d, %d) = %d, want %d", tt.a, tt.b, got, tt.expected)
            }
        })
    }
}
```

## Fixture strategy

| Fixture Type | When to Use | Example |
|--------------|-------------|---------|
| Inline | Simple, self-contained | `{ name: "test" }` |
| Factory | Multiple similar objects | `createUser(overrides)` |
| Snapshot | Complex output verification | `toMatchSnapshot()` |
| Database | Stateful tests | `setUpTestData()` |
| External service | API integration | Wiremock, VCR |

## Flaky test anti-patterns

| Anti-Pattern | Why It's Flaky | Fix |
|--------------|----------------|-----|
| `sleep()` for timing | Race conditions | Event-based waits |
| Shared mutable state | Test order dependency | Isolate state per test |
| Real network calls | External dependency | Mock or use VCR |
| System time dependency | Time zone, DST issues | Mock `Date.now()` |
| Random data | Non-deterministic | Seed random generators |
| Parallel test interference | File/DB conflicts | Unique resources per test |

## Output format
- Test target
- Level
- Cases
- Missing setup
- Proposed tests
