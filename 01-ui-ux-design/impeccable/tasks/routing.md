<purpose>
Route user intent to the correct impeccable command based on context and signals.
</purpose>

<user-story>
As a user, I want intelligent command recommendations so that I take the highest-value next action without guessing.
</user-story>

<when-to-use>
- User invokes impeccable without a specific command
- Need to determine which command to recommend
- After setup, need to suggest next steps
</when-to-use>

<steps>

<step name="no_argument" priority="first">
When the user provides no argument:

1. Run `node .agents/skills/impeccable/scripts/context-signals.mjs` and read its JSON
2. Lead with 2-3 highest-value next commands, each with a one-line reason from signals
3. Then show the full command menu

Signal reasoning:
- `setup.hasDesign` false while `setup.hasCode` true → `document`
- `critique.latest` is null → `critique` (project never critiqued)
- `critique.latest` with low score or non-zero p0/p1 → `polish`
- `git.changedFiles` pointing at one surface → scope `audit` or `polish` to those files
- `devServer.running` true → `live` available

If `scan.targets` is non-empty, run `node .agents/skills/impeccable/scripts/detect.mjs --json <targets>` and fold hits into recommendations.
</step>

<step name="command_match">
When the first word matches a command from the table:

1. Load the command's reference file: `reference/<command>.md`
2. Follow its instructions
3. Everything after the command name is the target
</step>

<step name="intent_match">
When the first word doesn't match but intent clearly maps:

- "fix the spacing" → `layout`
- "rewrite this error message" → `clarify`
- "the colors feel flat" → `colorize`

Load that command's reference and proceed as if invoked.
If two commands could fit, ask once which.
</step>

<step name="general_invocation">
When no clear command match:

General design invocation. Apply setup steps, General rules, and loaded register reference, using the full argument as context.
</step>

</steps>

<acceptance-criteria>
- [ ] User intent detected (no argument, command match, intent match, or general)
- [ ] Correct reference file loaded
- [ ] Signal-based recommendations provided when no argument
</acceptance-criteria>
