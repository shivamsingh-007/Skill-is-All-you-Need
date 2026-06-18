<div align="center">

# Skill is All you Need

## Command Reference

*Every skill, every command, every use case — one file.*

[![Skills](https://img.shields.io/badge/SKILLS-221-9B59B6?style=for-the-badge&labelColor=0a0a0a)](#-skill-library)
[![Categories](https://img.shields.io/badge/CATEGORIES-13-FF6B6B?style=for-the-badge&labelColor=0a0a0a)](#-categories)
[![Auto-Invoke](https://img.shields.io/badge/AUTO--INVOKE-READY-00D4AA?style=for-the-badge&labelColor=0a0a0a)](#-auto-invoke-system)

---

## Auto-Invoke System

**Skills trigger automatically from natural language.** No slash commands needed.

Every skill has a standardized description that tells the agent exactly when to activate:

```yaml
description: >
  Use this skill when the user wants to [goal 1], [goal 2], or [goal 3].
  Do not use for [exclusion 1], [exclusion 2], or [exclusion 3].
triggers:
  - "example phrase 1"
  - "example phrase 2"
```

### How It Works

```
You say: "Build a landing page that doesn't look AI-generated"
Agent matches: design-taste-frontend (auto-invoked)
Result: Anti-slop frontend with premium aesthetics

You say: "Review this PR for security issues"
Agent matches: code-review + security-and-hardening (auto-invoked)
Result: Security-focused code review with OWASP checks
```

### The Pattern

| Instead of... | Say... | What happens |
|:--------------|:-------|:-------------|
| `/design-taste-frontend build a landing page` | "Build a landing page" | Auto-invokes design-taste-frontend |
| `/code-review review this PR` | "Review this PR for issues" | Auto-invokes code-review |
| `/bug-debugging debug this test` | "Debug why this test fails" | Auto-invokes bug-debugging |
| `/hyperframes make a video` | "Create a product launch video" | Auto-invokes product-launch-video |
| `/fal-generate generate an image` | "Generate a hero image" | Auto-invokes fal-generate |

### Why Auto-Invoke Works Better

1. **Natural language** — No need to remember skill names
2. **Context-aware** — Agent picks the right skill based on your intent
3. **Multi-skill routing** — Complex requests can trigger multiple skills
4. **Less cognitive load** — Focus on what you want, not how to get it

---

## Quick Start

```bash
# 1. Clone
git clone https://github.com/shivamsingh-007/Skill-is-All-you-Need.git

# 2. Copy to your agent
cp -r */ ~/.claude/skills/       # Claude Code
cp -r */ ~/.agents/skills/       # OpenCode

# 3. Just ask naturally — skills auto-invoke
"Build a landing page"
"Review this PR for security issues"
"Debug why the API returns 500"
"Create a product launch video"
"Generate a hero image with AI"
```

---

## Categories

| # | Category | Skills | Jump To |
|:--|:---------|:------:|:--------|
| 01 | **UI/UX Design** | 47 | [Go →](#01--uiux-design) |
| 02 | **Frontend Engineering** | 18 | [Go →](#02--frontend-engineering) |
| 03 | **Animation & Motion** | 11 | [Go →](#03--animation--motion) |
| 04 | **Video Production** | 22 | [Go →](#04--video-production) |
| 05 | **Image & Media** | 20 | [Go →](#05--image--media) |
| 06 | **Code Quality** | 15 | [Go →](#06--code-quality) |
| 07 | **Development Workflow** | 14 | [Go →](#07--development-workflow) |
| 08 | **Agent & Skills** | 30 | [Go →](#08--agent--skills) |
| 09 | **Research & Analysis** | 9 | [Go →](#09--research--analysis) |
| 10 | **Document & Content** | 11 | [Go →](#10--document--content) |
| 11 | **Brand & Marketing** | 13 | [Go →](#11--brand--marketing) |
| 12 | **Business & Productivity** | 5 | [Go →](#12--business--productivity) |
| 13 | **Reference & Tools** | 6 | [Go →](#13--reference--tools) |

---

## 01 — UI/UX Design

> *47 skills for interfaces, design systems, and visual excellence.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **brand** | "Define our brand voice" | Brand identity, voice, messaging frameworks, asset management |
| **brand-design-systems** | "Reference Apple's design system" | 74 brand DESIGN.md reference files |
| **brandkit** | "Create a brand deck" | Premium brand-kit boards, logo systems, identity decks |
| **brutalist-skill** | "Design a brutalist website" | Raw mechanical interfaces, Swiss typography, military terminal aesthetics |
| **canvas-design** | "Create a poster" | Beautiful visual art in PNG/PDF with design philosophy |
| **color-expert** | "Generate a color palette" | OKLCH/OKLAB, palette generation, accessibility, contrast checking |
| **creative-director** | "Direct a creative campaign" | 20+ methodologies, recursive self-assessment |
| **design-brief** | "Create a design brief" | Parse I-Lang protocol structured briefs |
| **design-consultation** | "Build a design system from scratch" | Complete design systems with realistic product mockups |
| **design-system** | "Define design tokens" | Token architecture, CSS variables, component specs |
| **design-taste-frontend** | "Build a landing page" | Anti-slop frontends that don't look AI-generated |
| **emil-design-eng** | "Polish this UI" | Emil Kowalski's UI polish philosophy, invisible details |
| **faq-page** | "Create an FAQ page" | FAQ with accordion, search, category filtering |
| **figma-code-connect-components** | "Sync Figma to code" | Connect Figma design components to code |
| **figma-create-design-system-rules** | "Create Figma rules" | Project-specific Figma design system rules |
| **figma-create-new-file** | "Create a Figma file" | Create blank Figma/FigJam files |
| **figma-generate-design** | "Generate Figma screens" | Build screens in Figma from code or description |
| **figma-generate-library** | "Create Figma library" | Build professional design system library in Figma |
| **figma-implement-design** | "Implement this Figma design" | Translate Figma to production code |
| **figma-use** | "Run Figma script" | Run Figma Plugin API scripts |
| **frame-data-chart-nyt** | "Create an editorial chart" | NYT-style typography, editorial-grade charts |
| **frame-flowchart-sticky** | "Create a flowchart" | SVG curve connectors, sticky-note nodes |
| **frame-glitch-title** | "Create glitch title" | Digital glitch, chromatic offset title frames |
| **frame-light-leak-cinema** | "Create cinematic opening" | Film light leaks, grain, 16:9 letterbox |
| **frame-liquid-bg-hero** | "Create fluid hero section" | WebGL fluid displacement background |
| **frame-logo-outro** | "Create logo outro" | Segmented logo assembly, glow bloom |
| **frame-macos-notification** | "Create notification overlay" | Realistic macOS notification banners |
| **gpt-tasteskill** | "Build elite UI with motion" | Elite UX/UI & GSAP Motion Engineer |
| **huashu-design** | "Design with anti-slop principles" | 40-style library, anti-AI-slop, 3-logic parallel workflow |
| **impeccable** | "Polish this interface" | UI polish, visual excellence, anti-patterns |
| **login-flow** | "Create login flow" | Mobile login and authentication screens |
| **minimalist-skill** | "Design minimalist UI" | Clean editorial interfaces, warm monochrome |
| **mockup-device-3d** | "Create device mockup" | 3D iPhone/MacBook showcases with real HTML |
| **paywall-upgrade-cro** | "Design upgrade screen" | Upgrade screens, paywalls, upsell modals |
| **platform-design** | "Design for iOS and Android" | 300+ rules from Apple HIG, Material 3, WCAG 2.2 |
| **reference-design-contract** | "Turn this into a design spec" | Turn vague taste into grounded DESIGN.md |
| **redesign-skill** | "Redesign this website" | Upgrade existing websites to premium quality |
| **shadcn-ui** | "Create shadcn component" | Build UI components with shadcn/ui |
| **soft-skill** | "Design like a high-end agency" | High-end agency design philosophy |
| **stitch-loop** | "Tighten visual fidelity" | Iterative design-to-code feedback loop |
| **stitch-skill** | "Generate DESIGN.md" | Semantic Design System for Google Stitch |
| **taste-skill** | "Evaluate this design" | Design taste and aesthetic judgment |
| **taste-skill-v1** | "Rate this design" | Earlier version of taste evaluation |
| **ui-styling** | "Style this component" | shadcn/ui + Tailwind CSS mastery |
| **ui-ux-pro-max** | "Review UX" | 50+ styles, 161 palettes, 99 UX guidelines |
| **unified-design** | "Design a logo" | Logo, CIP, slides, banners, icons, social photos |

---

## 02 — Frontend Engineering

> *18 skills for production-grade frontend development.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **api-and-interface-design** | "Design this API" | Stable API and interface boundaries |
| **browser-testing-with-devtools** | "Test in real browser" | Real browser testing via Chrome DevTools |
| **canvas-design** | "Create visual art" | Beautiful visual art in PNG/PDF |
| **d3-visualization** | "Create D3 chart" | D3.js charts and interactive data visualizations |
| **doc-kami-parchment** | "Create parchment document" | Warm parchment canvas, monochrome ink-blue |
| **export-download-debugging** | "Debug image export" | Fix browser export/download failures |
| **frontend-ui-engineering** | "Build production UI" | Production-quality UIs |
| **image-to-code-skill** | "Turn this design into code" | Convert images to production code |
| **imagegen-frontend-mobile** | "Generate mobile UI" | Generate mobile frontend from images |
| **imagegen-frontend-web** | "Generate web UI" | Generate web frontend from images |
| **output-skill** | "Generate complete code" | Override LLM truncation, enforce complete output |
| **performance-optimization** | "Optimize performance" | Core Web Vitals, load times, profiling |
| **pptx-html-fidelity-audit** | "Audit PPTX fidelity" | Audit PPTX export against HTML source |
| **repo-understanding** | "Understand this repo" | Explore unfamiliar codebases |
| **shader-dev** | "Create GLSL shader" | GLSL shaders, ray marching, fluid simulation |
| **threejs** | "Create 3D scene" | Three.js scenes, materials, controls |
| **webapp-testing** | "Test this web app" | Playwright browser automation testing |

---

## 03 — Animation & Motion

> *11 skills for GSAP, scroll animations, and micro-interactions.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **design-motion-principles** | "Audit this animation" | Motion design audit and creation |
| **emilkowalski-motion** | "Add micro-interactions" | Micro-interactions, state transitions, page motion |
| **gsap-core** | "Animate with GSAP" | gsap.to(), from(), fromTo(), easing, stagger |
| **gsap-frameworks** | "GSAP in Vue" | GSAP in Vue, Svelte, non-React frameworks |
| **gsap-performance** | "Optimize GSAP animation" | Prefer transforms, avoid layout thrashing |
| **gsap-plugins** | "Use GSAP Flip" | ScrollToPlugin, Flip, Draggable, Inertia, Observer |
| **gsap-react** | "GSAP in React" | useGSAP hook, refs, gsap.context() |
| **gsap-scrolltrigger** | "Create scroll animation" | Scroll-linked animations, pinning, scrub |
| **gsap-timeline** | "Sequence these animations" | Sequencing, choreographing keyframes |
| **gsap-utils** | "Use gsap.utils" | clamp, mapRange, normalize, interpolate, random |

---

## 04 — Video Production

> *22 skills for video creation, editing, and publishing.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **embedded-captions** | "Add captions to video" | Cinematic captions for talking-head videos |
| **faceless-explainer** | "Turn article into video" | Text-to-typography/abstract-graphics video |
| **general-video** | "Create a video" | Multi-scene compositions, brand reels, montages |
| **graphic-overlays** | "Add graphic overlays" | Layer timed graphic overlay cards onto video |
| **hyperframes** | "Make me a video" | HTML composition video authoring (entry point) |
| **hyperframes-animation** | "Create animation" | Atomic motion rules, scene blueprints, 7 adapters |
| **hyperframes-cli** | "Run hyperframes" | Dev loop: init, add, capture, render, publish |
| **hyperframes-core** | "Validate composition" | Composition contract, clips, tracks, validation |
| **hyperframes-creative** | "Plan video creative" | Design spec, palettes, typography, narration |
| **hyperframes-media** | "Add narration" | TTS, BGM, transcription, background removal |
| **hyperframes-registry** | "Install video component" | Install and wire registry blocks/components |
| **motion-graphics** | "Create motion graphic" | Short design-led motion graphics |
| **pr-to-video** | "Turn this PR into video" | GitHub PR → code explainer video |
| **product-launch-video** | "Create launch video" | Product launch, SaaS promo, feature reveal |
| **remotion** | "Create Remotion video" | Programmatic video creation with React |
| **remotion-to-hyperframes** | "Port my Remotion" | Port Remotion to HyperFrames HTML |
| **sora** | "Generate video clip" | Generate clips via OpenAI Sora API |
| **venice-video** | "Generate video via Venice" | Video generation via Venice.ai |
| **video-downloader** | "Download this YouTube video" | Download YouTube with quality options |
| **video-perception** | "Analyze this video" | Analyze video content, extract insights |
| **website-to-video** | "Turn website into video" | Capture website → showcase video |

---

## 05 — Image & Media

> *20 skills for AI image generation, editing, and media processing.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **ecommerce-image-workflow** | "Create product images" | Reference-product ecommerce image pipeline |
| **fal-3d** | "Create 3D model" | Generate 3D models from text/images |
| **fal-generate** | "Generate image" | Image/video generation (Flux, SDXL, ideogram) |
| **fal-image-edit** | "Edit this image" | Style transfer, background removal, inpainting |
| **fal-kling-o3** | "Generate with Kling" | Kling O3 image/video generation |
| **fal-lip-sync** | "Create talking head" | Talking head videos, lip sync audio |
| **fal-realtime** | "Generate images in real-time" | Real-time streaming AI image generation |
| **fal-restore** | "Restore this image" | Deblur, denoise, fix faces, restore old docs |
| **fal-train** | "Train custom model" | Train custom LoRA models |
| **fal-tryon** | "Try on these clothes" | Virtual clothing try-on |
| **fal-upscale** | "Upscale this image" | AI super-resolution upscaling |
| **fal-video-edit** | "Edit this video" | AI video editing, style remix, upscale |
| **fal-vision** | "Analyze this image" | Image segmentation, OCR, visual Q&A |
| **higgsfield-generate** | "Generate image" | Images, videos, ads, marketplace cards, Soul training |
| **image-enhancer** | "Enhance this image" | Enhance screenshots, resolution, sharpness |
| **pixelbin-media** | "Generate with Pixelbin" | 85+ API portfolio, website page generation |
| **replicate** | "Run model on Replicate" | Discover, compare, run AI models |
| **venice-image-edit** | "Edit image via Venice" | Image edits, upscaling, background removal |
| **venice-image-generate** | "Generate image via Venice" | Image generation via Venice.ai |

---

## 06 — Code Quality

> *15 skills for debugging, review, testing, and verification.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **autofix** | "Auto-fix this" | Auto-fix code issues via CI |
| **bug-debugging** | "Debug this failing test" | Systematic debugging with failure taxonomies |
| **code-review** | "Review this PR" | Language-specific checklists, security traps |
| **code-review-and-quality** | "Review code quality" | Multi-axis code review before merge |
| **code-simplification** | "Simplify this code" | Simplify code for clarity |
| **debugging-and-error-recovery** | "Find root cause" | Systematic root-cause debugging |
| **doubt-driven-development** | "Verify this decision" | Adversarial review before every decision |
| **hallucination-debugging** | "Find hallucination source" | Trace hallucinations in AI output |
| **pr-feedback-quality-gate** | "Handle PR feedback" | Track PR feedback, resolve comments |
| **rag-evaluation** | "Check RAG grounding" | RAG quality metrics, hallucination risk |
| **systematic-debugging** | "Systematic debug this" | Condition-based waiting, root-cause tracing |
| **test-driven-development** | "TDD this feature" | Drive development with tests |
| **test-generation** | "Write tests for this" | Framework-specific test patterns |
| **verification-before-completion** | "Verify completion" | Verify work before marking done |

---

## 07 — Development Workflow

> *14 skills for git, CI/CD, deployment, and shipping.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **backend-architect** | "Design system architecture" | Backend architecture and system design |
| **ci-cd-and-automation** | "Set up CI/CD" | Automate CI/CD pipeline setup |
| **commit** | "Commit these changes" | Smart commit with conventional commits |
| **create-pr** | "Create a PR" | Create well-structured pull requests |
| **deployment-checklist** | "Check deployment readiness" | Pre-deploy + incident triage + security |
| **deprecation-and-migration** | "Deprecate this API" | Manage deprecation and user migration |
| **finishing-a-development-branch** | "Finish this branch" | Clean branch completion workflow |
| **git-workflow-and-versioning** | "Set up git workflow" | Git workflow practices, branching |
| **implementation-planning** | "Plan this feature" | Feature planning, refactoring plans |
| **incremental-implementation** | "Implement incrementally" | Deliver changes incrementally |
| **observability-and-instrumentation** | "Add observability" | Logging, metrics, tracing, alerting |
| **perf** | "Profile this code" | Performance profiling and optimization |
| **planning-and-task-breakdown** | "Break this into tasks" | Break work into ordered tasks |
| **security-and-hardening** | "Harden this code" | Security best practices, auth, data storage |
| **ship** | "Ship this feature" | End-to-end shipping workflow |
| **shipping-and-launch** | "Prepare for launch" | Pre-launch checklist, monitoring, rollback |
| **source-driven-development** | "Check official docs" | Ground decisions in official documentation |
| **spec-driven-development** | "Write spec for this" | Write specs before code |

---

## 08 — Agent & Skills

> *30 skills for managing, creating, and optimizing AI agent workflows.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **active-coaching** | "Help me decide" | Decision support, Socratic discovery |
| **agent-browser** | "Automate browser" | Browser automation for AI agents |
| **agent-evals** | "Create eval suite" | Eval suites, benchmark analysis, tool-use auditing |
| **agent-sdk-dev** | "Create SDK app" | Agent SDK development and verification |
| **agent-skills** | "Which skill should I use?" | Discover and invoke other skills |
| **artifacts-builder** | "Build an artifact" | Create structured artifacts |
| **brainstorming** | "Brainstorm ideas" | Visual brainstorming with spec documents |
| **connect-apps** | "Connect to Gmail" | Connect Claude to external apps |
| **context-engineering** | "Configure agent context" | Optimize agent context setup |
| **context-pipeline-review** | "Review context pipeline" | Inspect prompt assembly, memory injection |
| **create-skill** | "Create a skill for X" | Create new agent skills |
| **dispatching-parallel-agents** | "Run parallel agents" | Run multiple agents concurrently |
| **ecc** | "Set up project memory" | Persistent per-project memory |
| **executing-plans** | "Execute this plan" | Execute structured plans |
| **idea-refine** | "Refine this idea" | Refine raw ideas through structured thinking |
| **interview-me** | "Interview me" | Extract true requirements through interview |
| **interviewing** | "Gather requirements" | Structured, goal-oriented questioning |
| **kie-ai** | "Manage AI skills" | AI skill management CLI |
| **langsmith-fetch** | "Fetch LangSmith traces" | Debug LangChain/LangGraph agents |
| **mcp-builder** | "Build MCP server" | Create MCP servers for LLM interaction |
| **prompt-engineering** | "Improve this prompt" | Improve prompts for reliability and control |
| **promptfoo** | "Evaluate prompts" | Eval framework for LLM testing |
| **receiving-code-review** | "Handle review feedback" | Process incoming code reviews |
| **requesting-code-review** | "Request code review" | Request and structure code reviews |
| **skill-bus** | "List available skills" | Skill bus for managing sub-skills |
| **skill-creator** | "Create effective skill" | Guide for creating effective skills |
| **skill-share** | "Share skill on Slack" | Create and share skills on Slack |
| **subagent-driven-development** | "Use subagent for this" | Use subagents for parallel development |
| **teaching-and-explaining** | "Explain X" | Progressive concept explanations |
| **using-agent-skills** | "Discover available skills" | Meta-skill for skill discovery |
| **using-git-worktrees** | "Use git worktree" | Git worktree workflows |
| **using-superpowers** | "Reference tools" | Multi-platform tool references |
| **writing-plans** | "Write execution plan" | Write structured execution plans |
| **writing-skills** | "Write a new skill" | Create, test, and refine skills |

---

## 09 — Research & Analysis

> *9 skills for deep research, content analysis, and audio generation.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **content-research-writer** | "Write research-backed article" | Research-backed content with citations |
| **deep-research** | "Deep research this topic" | Multi-agent deep research pipeline |
| **last30days** | "What's trending about X?" | Research what people say in last 30 days |
| **lead-research-assistant** | "Find leads for our product" | Identify high-quality leads |
| **meeting-insights-analyzer** | "Analyze this meeting" | Analyze meeting transcripts for patterns |
| **research-decision-room** | "Turn research into decisions" | Turn notes into evidence-backed decisions |
| **venice-audio-music** | "Generate music" | Music generation via Venice.ai |
| **venice-audio-speech** | "Generate speech" | Text-to-speech via Venice.ai |

---

## 10 — Document & Content

> *11 skills for document creation, editing, and management.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **changelog-generator** | "Generate changelog" | Auto-create changelogs from git commits |
| **documentation-and-adrs** | "Write ADR" | Record architectural decisions |
| **documentation-writer** | "Write README" | Technical docs, READMEs, quickstarts |
| **document-skills** | "Edit DOCX" | DOCX, PDF, PPTX, XLSX manipulation |
| **documentation-generator** | "Generate docs" | Auto-generate documentation from code |
| **internal-comms** | "Write status report" | Internal communications, status reports |
| **minimax-docx** | "Create branded DOCX" | Professional DOCX with OpenXML SDK |
| **minimax-pdf** | "Generate branded PDF" | PDF generation with 15 cover styles |
| **pptx-generator** | "Create presentation" | Create/edit PowerPoint with PptxGenJS |
| **release-notes-one-pager** | "Create release notes page" | One-page HTML release notes |
| **supadata** | "Fetch YouTube data" | YouTube/web data API |

---

## 11 — Brand & Marketing

> *13 skills for social media, marketing, and brand assets.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **card-twitter** | "Create Twitter card" | Twitter quote/data card design |
| **card-xiaohongshu** | "Create Xiaohongshu card" | Xiaohongshu-style knowledge cards |
| **competitive-ads-extractor** | "Extract competitor ads" | Extract and analyze competitor ads |
| **domain-name-brainstormer** | "Brainstorm domain names" | Creative domain names + availability check |
| **marketing-psychology** | "Apply marketing psychology" | Psychological principles for copy and design |
| **raffle-winner-picker** | "Pick a raffle winner" | Random winner selection from lists |
| **slack-gif-creator** | "Create Slack GIF" | Animated GIFs optimized for Slack |
| **social-reddit-card** | "Create Reddit card" | Realistic Reddit post cards |
| **social-spotify-card** | "Create Spotify card" | Spotify Now Playing-style cards |
| **social-x-post-card** | "Create X post card" | X post cards with engagement metrics |
| **tailored-resume-generator** | "Create tailored resume" | Tailored resumes from job descriptions |
| **twitter-algorithm-optimizer** | "Optimize this tweet" | Optimize tweets for maximum reach |

---

## 12 — Business & Productivity

> *5 skills for file management, invoicing, and developer growth.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **connect** | "Send email" | Send emails, create issues across 1000+ services |
| **developer-growth-analysis** | "Analyze my coding patterns" | Analyze coding patterns, curate learning resources |
| **file-organizer** | "Organize my files" | Intelligently organize files and folders |
| **invoice-organizer** | "Organize invoices" | Organize invoices for tax preparation |

---

## 13 — Reference & Tools

> *6 skills for configuration files and tooling references.*

| Skill | Command | What It Does |
|:------|:--------|:-------------|
| **CL4R1T4S** | "Reference Claude configs" | Claude system prompts from 15+ platforms |
| **mantishack** | "Use MantisHub tools" | MantisHub-specific tooling |
| **multica** | "Reference Multica" | Multica-ai ecosystem |
| **project_mantis** | "Configure MantisHub" | MantisHub project configuration |
| **shannon** | "Use Shannon tools" | Shannon tooling and workspace management |

---

## Quick Reference by Task

### "I need to build a UI"

| Task | Skill | Command |
|:-----|:------|:--------|
| Landing page | design-taste-frontend | "Build a landing page" |
| Dashboard | ui-ux-pro-max | "Design a dashboard" |
| Component library | shadcn-ui | "Create component library" |
| Design system | design-system | "Define design tokens" |
| Mobile app | platform-design | "Design for iOS and Android" |
| Redesign | redesign-skill | "Redesign this website" |
| Brand identity | brand | "Define our brand" |

### "I need to fix code"

| Task | Skill | Command |
|:-----|:------|:--------|
| Bug | bug-debugging | "Debug this failing test" |
| Review | code-review | "Review this PR" |
| Performance | performance-optimization | "Optimize performance" |
| Security | security-and-hardening | "Harden this code" |
| Tests | test-generation | "Write tests for this" |
| Simplify | code-simplification | "Simplify this code" |

### "I need to create content"

| Task | Skill | Command |
|:-----|:------|:--------|
| Video | hyperframes | "Make me a video" |
| Images | fal-generate | "Generate image" |
| Presentation | pptx-generator | "Create presentation" |
| Documentation | documentation-writer | "Write README" |
| Changelog | changelog-generator | "Generate changelog" |
| Social media | card-twitter | "Create Twitter card" |

### "I need to research"

| Task | Skill | Command |
|:-----|:------|:--------|
| Deep research | deep-research | "Deep research this topic" |
| Trending topics | last30days | "What's trending about X?" |
| Lead generation | lead-research-assistant | "Find leads" |
| Meeting analysis | meeting-insights-analyzer | "Analyze this meeting" |

---

## Stats

<div align="center">

```
┌─────────────────────────────────────────────────────┐
│                                                     │
│   TOTAL SKILLS           221                        │
│   CATEGORIES             13                         │
│   COMMANDS              500+                        │
│   TRIGGER PATTERNS      1000+                       │
│                                                     │
│   SOURCES               25 open-source repos        │
│   LINES OF CODE         60,000+                     │
│                                                     │
└─────────────────────────────────────────────────────┘
```

</div>

---

<div align="center">

**Made with focus for AI agents everywhere.**

*"The right skill at the right time changes everything."*

[⬆ Back to Top](#skill-is-all-you-need)

</div>
