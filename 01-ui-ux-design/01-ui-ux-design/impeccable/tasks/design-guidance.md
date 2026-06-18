<purpose>
Apply design guidance for production-grade frontend interfaces — color, typography, layout, motion, interaction, and anti-patterns.
</purpose>

<user-story>
As a frontend engineer, I want comprehensive design guidance so that I produce production-grade, visually excellent interfaces.
</user-story>

<when-to-use>
- Building or modifying any frontend interface
- Need design rules for color, typography, layout, motion
- Need to avoid common anti-patterns
</when-to-use>

<steps>

<step name="color" priority="first">
Color rules:

- **Verify contrast.** Body text ≥4.5:1 against background. Large text (≥18px or bold ≥14px) ≥3:1.
- Placeholder text needs the same 4.5:1, not muted-gray default.
- Gray text on colored background: use darker shade of background's own hue.
</step>

<step name="typography">
Typography rules:

- Cap body line length at 65–75ch.
- Don't pair similar fonts. Pair on contrast axis (serif + sans, geometric + humanist).
- Hero/display heading ceiling: clamp() max ≤ 6rem (~96px).
- Display heading letter-spacing floor: ≥ -0.04em.
- Use `text-wrap: balance` on h1–h3; `text-wrap: pretty` on long prose.
</step>

<step name="layout">
Layout rules:

- Vary spacing for rhythm.
- Cards are the lazy answer. Use only when truly best. Nested cards always wrong.
- Flexbox for 1D, Grid for 2D.
- Responsive grids: `repeat(auto-fit, minmax(280px, 1fr))`.
- Semantic z-index scale. Never arbitrary 999/9999.
</step>

<step name="motion">
Motion rules:

- Motion should be intentional, not an afterthought.
- Don't animate CSS layout properties unless truly needed.
- Ease out with exponential curves. No bounce, no elastic.
- Reduced motion not optional. Every animation needs `@media (prefers-reduced-motion: reduce)`.
- Reveal animations must enhance an already-visible default.
</step>

<step name="interaction">
Interaction rules:

- Dropdowns in `overflow: hidden` get clipped. Use `<dialog>` / popover API, `position: fixed`, or portal.
</step>

<step name="new_projects">
New project rules (when no prior work exists):

- Use OKLCH for color.
- Don't default to cream/sand/beige body bg.
- Pick a color strategy: Restrained, Committed, Full palette, or Drenched.
- Dark vs light: not a default. Write a scene sentence first.
</step>

<step name="absolute_bans">
Absolute bans — rewrite if you're about to use these:

- Side-stripe borders (`border-left/right` > 1px as accent)
- Gradient text (`background-clip: text` + gradient)
- Glassmorphism as default
- Hero-metric template
- Identical card grids
- Tiny uppercase tracked eyebrow above every section
- Numbered section markers as default scaffolding
- Text overflowing container
- `border: 1px solid X` + `box-shadow` with M ≥ 16px on same element
- `border-radius: 32px+` on cards/sections/inputs
- Hand-drawn/sketchy SVG illustrations
- Repeating stripe backgrounds
- Meta-criticism copy
</step>

<step name="ai_slop_test">
AI slop test: if someone could say "AI made that" without doubt, it's failed.

- **First-order:** if someone could guess theme + palette from category alone, it's the training-data reflex.
- **Second-order:** if someone could guess aesthetic family from category-plus-anti-references, it's the trap one tier deeper.
</step>

</steps>

<acceptance-criteria>
- [ ] Color contrast verified
- [ ] Typography follows rules
- [ ] Layout uses appropriate techniques
- [ ] Motion is intentional with reduced-motion support
- [ ] No absolute ban patterns used
- [ ] Passes AI slop test
</acceptance-criteria>
