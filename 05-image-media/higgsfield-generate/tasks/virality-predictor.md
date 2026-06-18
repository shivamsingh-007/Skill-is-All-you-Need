<purpose>
Analyze a finished video's virality potential using Virality Predictor (brain_activity).
</purpose>

<user-story>
As a user, I want to score my video's hook strength, attention, and retention so that I can optimize it for better performance.
</user-story>

<when-to-use>
- User wants to analyze a video's virality
- User says "analyze this video", "score this ad", "evaluate the hook"
- User wants hook strength, attention, retention analysis
</when-to-use>

<steps>

<step name="submit" priority="first">
Run Virality Predictor:

```bash
higgsfield generate create brain_activity --video ./creative.mp4 --wait
```

This is video-in/text-out analysis, not a text/chat generation model.
</step>

<step name="interpret">
Interpret the results:

- **Overall score** — 0-100, higher is better
- **Peak hook** — percentage and timing of strongest hook moment
- **Sustain** — how well attention holds throughout
- **Strongest region** — which brain region scored highest
- **Risk** — Default Mode being high indicates mind-wandering risk

Higher Visual/Auditory/Language/Attention scores = stronger stimulus and focus.
Lower Default Mode = less mind-wandering = better.
</step>

<step name="deliver">
Report the scores in this format:

```text
Overall score: 44/100
Peak hook: 49% at 1s
Sustain: 89%
Strongest region: Visual Cortex
Risk: Default Mode is high, which can indicate mind-wandering.

Open report: <report_url>
```

The CLI prints an Open report URL. Send that URL for the visual report.
Do not surface raw artifact URLs unless the user asks for raw data.
</step>

</steps>

<output>
## Artifact
Text report with scores and interpretation.

## Format
Structured scores with business interpretation and report URL.
</output>

<acceptance-criteria>
- [ ] Video submitted to brain_activity
- [ ] Results interpreted with business context
- [ ] Scores delivered in standard format
- [ ] Report URL included
</acceptance-criteria>
