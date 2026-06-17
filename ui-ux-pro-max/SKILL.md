---
name: ui-ux-pro-max
description: "UI/UX design intelligence for web and mobile. 50+ styles, 161 color palettes, 57 font pairings, 161 product types, 99 UX guidelines, and 25 chart types across 10 stacks. Use when designing UI, choosing colors/typography, reviewing UX, implementing responsive layouts, or adding animations. Do not use for backend logic, API design, or infrastructure work."
---

# UI/UX Pro Max - Design Intelligence

Comprehensive design guide for web and mobile applications. Contains 50+ styles, 161 color palettes, 57 font pairings, 161 product types with reasoning rules, 99 UX guidelines, and 25 chart types across 10 technology stacks.

## When to Use

### Must Use
- Designing new pages (Landing Page, Dashboard, Admin, SaaS, Mobile App)
- Creating or refactoring UI components (buttons, modals, forms, tables, charts)
- Choosing color schemes, typography systems, spacing standards, or layout systems
- Reviewing UI code for user experience, accessibility, or visual consistency
- Implementing navigation structures, animations, or responsive behavior
- Making product-level design decisions (style, information hierarchy, brand expression)

### Skip
- Pure backend logic development
- API or database design
- Performance optimization unrelated to the interface
- Infrastructure or DevOps work

## Rule Categories by Priority

| Priority | Category | Impact | Key Checks |
|----------|----------|--------|------------|
| 1 | Accessibility | CRITICAL | Contrast 4.5:1, Alt text, Keyboard nav, Aria-labels |
| 2 | Touch & Interaction | CRITICAL | Min size 44×44px, 8px+ spacing, Loading feedback |
| 3 | Performance | HIGH | WebP/AVIF, Lazy loading, Reserve space (CLS < 0.1) |
| 4 | Style Selection | HIGH | Match product type, Consistency, SVG icons (no emoji) |
| 5 | Layout & Responsive | HIGH | Mobile-first breakpoints, Viewport meta, No horizontal scroll |
| 6 | Typography & Color | MEDIUM | Base 16px, Line-height 1.5, Semantic color tokens |
| 7 | Animation | MEDIUM | Duration 150–300ms, Motion conveys meaning, Spatial continuity |
| 8 | Forms & Feedback | MEDIUM | Visible labels, Error near field, Helper text, Progressive disclosure |
| 9 | Navigation Patterns | HIGH | Predictable back, Bottom nav ≤5, Deep linking |
| 10 | Charts & Data | LOW | Legends, Tooltips, Accessible colors |

## Quick Reference

### 1. Accessibility (CRITICAL)
- Contrast 4.5:1 for normal text (large text 3:1)
- Visible focus rings on interactive elements (2–4px)
- Descriptive alt text for meaningful images
- aria-label for icon-only buttons
- Tab order matches visual order; full keyboard support
- Use label with for attribute
- Skip to main content for keyboard users
- Sequential h1→h6, no level skip
- Don't convey info by color alone (add icon/text)
- Respect prefers-reduced-motion
- Provide cancel/back in modals and multi-step flows

### 2. Touch & Interaction (CRITICAL)
- Min 44×44pt (iOS) / 48×48dp (Android)
- Minimum 8px gap between touch targets
- Use click/tap for primary interactions; don't rely on hover
- Disable button during async operations; show spinner
- Clear error messages near problem
- Add cursor-pointer to clickable elements
- Use touch-action: manipulation to reduce 300ms delay
- Visual feedback on press (ripple/highlight)
- Use haptic for confirmations; avoid overuse
- Don't rely on gesture-only interactions; provide visible controls
- Keep primary touch targets away from notch, Dynamic Island, gesture bar

### 3. Performance (HIGH)
- Use WebP/AVIF, responsive images (srcset/sizes), lazy load
- Declare width/height or use aspect-ratio to prevent layout shift
- Use font-display: swap/optional to avoid invisible text (FOIT)
- Prioritize above-the-fold CSS
- Lazy load non-hero components via dynamic import
- Split code by route/feature
- Load third-party scripts async/defer
- Avoid frequent layout reads/writes; batch DOM reads then writes
- Reserve space for async content to avoid layout jumps
- Virtualize lists with 50+ items
- Keep per-frame work under ~16ms for 60fps
- Use skeleton screens for >1s operations
- Keep input latency under ~100ms
- Provide visual feedback within 100ms of tap
- Use debounce/throttle for high-frequency events
- Provide offline state messaging and basic fallback
- Offer degraded modes for slow networks

### 4. Style Selection (HIGH)
- Match style to product type
- Use same style across all pages
- Use SVG icons (Heroicons, Lucide), not emojis
- Choose palette from product/industry
- Shadows, blur, radius aligned with chosen style
- Respect platform idioms (iOS HIG vs Material)
- Make hover/pressed/disabled states visually distinct
- Use consistent elevation/shadow scale
- Design light/dark variants together
- Use one icon set/visual language across the product
- Prefer native/system controls; customize only when branding requires
- Use blur to indicate background dismissal, not as decoration
- Each screen: one primary CTA; secondary actions visually subordinate

### 5. Layout & Responsive (HIGH)
- width=device-width initial-scale=1 (never disable zoom)
- Design mobile-first, then scale up
- Use systematic breakpoints (375 / 768 / 1024 / 1440)
- Minimum 16px body text on mobile
- Mobile 35–60 chars per line; desktop 60–75 chars
- No horizontal scroll on mobile
- Use 4pt/8dp incremental spacing system
- Keep component spacing comfortable for touch
- Consistent max-width on desktop (max-w-6xl / 7xl)
- Define layered z-index scale
- Fixed navbar must reserve safe padding for underlying content
- Avoid nested scroll regions
- Prefer min-h-dvh over 100vh on mobile
- Keep layout readable in landscape mode
- Show core content first on mobile
- Establish hierarchy via size, spacing, contrast

### 6. Typography & Color (MEDIUM)
- Use 1.5-1.75 for body text
- Limit to 65-75 characters per line
- Match heading/body font personalities
- Consistent type scale (12 14 16 18 24 32)
- Darker text on light backgrounds
- Use font-weight to reinforce hierarchy
- Define semantic color tokens (primary, secondary, error, surface)
- Dark mode: desaturated/lighter tonal variants, not inverted colors
- Foreground/background pairs must meet 4.5:1
- Functional color must include icon/text
- Prefer wrapping over truncation
- Respect default letter-spacing per platform
- Use tabular figures for data columns, prices, timers
- Use whitespace intentionally to group related items

### 7. Animation (MEDIUM)
- 150–300ms for micro-interactions; complex transitions ≤400ms
- Use transform/opacity only; avoid width/height/top/left
- Show skeleton or progress when loading exceeds 300ms
- Animate 1-2 key elements per view max
- Use ease-out for entering, ease-in for exiting
- Every animation must express a cause-effect relationship
- State changes should animate smoothly, not snap
- Page transitions should maintain spatial continuity
- Use parallax sparingly; respect reduced-motion
- Prefer spring/physics-based curves
- Exit animations shorter than enter (~60–70%)
- Stagger list/grid item entrance by 30–50ms
- Use shared element transitions for visual continuity
- Animations must be interruptible
- Never block user input during animation
- Use crossfade for content replacement
- Subtle scale (0.95–1.05) on press
- Drag/swipe/pinch must provide real-time visual response
- Forward navigation animates left/up; backward right/down
- Animations must not cause layout reflow or CLS

### 8. Forms & Feedback (MEDIUM)
- Visible label per input (not placeholder-only)
- Show error below the related field
- Loading then success/error state on submit
- Mark required fields
- Helpful message and action when no content
- Auto-dismiss toasts in 3-5s
- Confirm before destructive actions
- Provide persistent helper text below complex inputs
- Disabled elements: reduced opacity + cursor change
- Reveal complex options progressively
- Validate on blur (not keystroke)
- Use semantic input types (email, tel, number)
- Provide show/hide toggle for password fields
- Use autocomplete attributes for system autofill
- Allow undo for destructive or bulk actions
- Confirm completed actions with brief visual feedback
- Error messages: state cause + how to fix
- Group related fields logically
- After submit error, auto-focus first invalid field
- For multiple errors, show summary at top with anchor links
- Mobile input height ≥44px
- Destructive actions: semantic danger color, visually separated
- Toasts: aria-live="polite" for screen readers
- Form errors: aria-live region or role="alert"
- Error/success colors must meet 4.5:1 contrast
- Request timeout: show clear feedback with retry option

### 9. Navigation Patterns (HIGH)
- Bottom navigation max 5 items; use labels with icons
- Use drawer/sidebar for secondary navigation
- Back navigation must be predictable; preserve scroll/state
- All key screens reachable via deep link
- iOS: bottom Tab Bar for top-level navigation
- Android: Top App Bar with navigation icon
- Navigation items: icon + text label
- Current location visually highlighted
- Primary vs secondary nav clearly separated
- Modals/sheets: clear close/dismiss affordance
- Search easily reachable with recent/suggested queries
- Breadcrumbs for 3+ level deep hierarchies
- Navigating back restores scroll position, filter state, input
- Support system gesture navigation without conflict
- Badges on nav items sparingly; clear after user visits
- Overflow/more menu when actions exceed space
- Bottom nav for top-level screens only
- Large screens: sidebar; small screens: bottom/top nav
- Never silently reset navigation stack
- Navigation placement same across all pages
- Don't mix Tab + Sidebar + Bottom Nav at same hierarchy
- Modals not for primary navigation flows
- After page transition, move focus to main content
- Core navigation remains reachable from deep pages
- Destructive actions visually separated from normal nav
- When nav destination unavailable, explain why

### 10. Charts & Data (LOW)
- Match chart type to data type (trend → line, comparison → bar, proportion → pie/donut)
- Use accessible color palettes; avoid red/green only
- Provide table alternative for charts
- Supplement color with patterns/textures/shapes
- Always show legend near the chart
- Tooltips/data labels on hover/tap showing exact values
- Label axes with units and readable scale
- Charts reflow on small screens
- Meaningful empty state when no data
- Skeleton placeholder while chart data loads
- Chart entrance animations respect reduced-motion
- For 1000+ data points, aggregate or sample
- Locale-aware formatting for numbers, dates, currencies
- Interactive chart elements ≥44pt tap area
- Avoid pie/donut for >5 categories
- Data lines/bars vs background ≥3:1
- Legends clickable to toggle series
- Label values directly on small datasets
- Tooltip content keyboard-reachable
- Data tables support sorting with aria-sort
- Axis ticks not cramped; auto-skip on small screens
- Limit information density per chart
- Emphasize trends over decoration
- Grid lines low-contrast
- Interactive chart elements keyboard-navigable
- Text summary describing chart's key insight
- Data load failure: error message with retry
- Offer CSV/image export
- Drill-down: clear back-path and hierarchy breadcrumb
- Time series: clearly label time granularity

## Common Rules for Professional UI

### Icons & Visual Elements
- No emoji as structural icons — use vector-based icons
- SVG or platform vector icons that scale cleanly
- Stable interaction states without layout shifts
- Correct brand assets with proper usage
- Consistent icon sizing as design tokens
- Consistent stroke width within same visual layer
- One icon style per hierarchy level
- Minimum 44×44pt interactive area
- Icons aligned to text baseline with consistent padding
- Follow WCAG contrast standards for icons

### Interaction
- Clear pressed feedback within 80-150ms
- Micro-interactions 150-300ms with native easing
- Screen reader focus order matches visual order
- Disabled states visually clear and non-interactive
- Touch areas >=44x44pt (iOS) or >=48x48dp (Android)
- One primary gesture per region
- Prefer native interactive primitives with accessibility roles

### Light/Dark Mode
- Cards/surfaces clearly separated from background
- Body text contrast >=4.5:1 in both modes
- Secondary text contrast >=3:1 in both modes
- Separators visible in both themes
- Interaction states equally distinguishable in both themes
- Semantic color tokens mapped per theme
- Modal scrim strong enough (40-60% black)

### Layout & Spacing
- Respect top/bottom safe areas for fixed headers
- Add spacing for status/navigation bars
- Predictable content width per device class
- Consistent 4/8dp spacing system
- Long-form text readable on large devices
- Clear vertical rhythm tiers (16/24/32/48)
- Horizontal insets adapt by device size
- Bottom/top insets so lists not hidden behind fixed bars

## Pre-Delivery Checklist

### Visual Quality
- [ ] No emojis as icons (use SVG)
- [ ] Consistent icon family and style
- [ ] Official brand assets with correct proportions
- [ ] Pressed-state visuals don't shift layout
- [ ] Semantic theme tokens used consistently

### Interaction
- [ ] All tappable elements provide pressed feedback
- [ ] Touch targets >=44x44pt (iOS), >=48x48dp (Android)
- [ ] Micro-interaction timing 150-300ms
- [ ] Disabled states visually clear
- [ ] Screen reader focus order matches visual order
- [ ] Gesture regions avoid conflicts

### Light/Dark Mode
- [ ] Primary text contrast >=4.5:1 in both modes
- [ ] Secondary text contrast >=3:1 in both modes
- [ ] Dividers/borders visible in both modes
- [ ] Modal scrim opacity preserves legibility
- [ ] Both themes tested before delivery

### Layout
- [ ] Safe areas respected for headers, tab bars, bottom CTAs
- [ ] Scroll content not hidden behind fixed bars
- [ ] Verified on small phone, large phone, tablet (portrait + landscape)
- [ ] Horizontal insets adapt by device size
- [ ] 4/8dp spacing rhythm maintained
- [ ] Long-form text readable on larger devices

### Accessibility
- [ ] All meaningful images/icons have accessibility labels
- [ ] Form fields have labels, hints, error messages
- [ ] Color is not the only indicator
- [ ] Reduced motion and dynamic text size supported
- [ ] Accessibility traits/roles/states announced correctly
