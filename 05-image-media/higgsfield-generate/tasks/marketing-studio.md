<purpose>
Generate branded ad content using Marketing Studio — avatars, products, hooks, settings, and ad-style modes.
</purpose>

<user-story>
As a user, I want to create marketing videos and images with avatars, products, and brand elements so that I have professional ad content.
</user-story>

<when-to-use>
- User wants ads, UGC, product demos, unboxing, TV spots, presenter videos
- User mentions Marketing Studio
- User wants branded video or image content
</when-to-use>

<steps>

<step name="concepts" priority="first">
Understand Marketing Studio concepts:

- **Avatar** — presenter face. Curated `preset` or `custom` (uploaded photos).
- **Product** — brand item with title + reference images. Imported from URL or created from uploads.
- **Hook** — reusable opening angle / ad hook.
- **Setting** — reusable environment / scene context.
- **Ad reference** — reusable inspiration video.
- **Brand kit** — captures brand identity for reuse.
- **Ad format** — presets for visual structure of generated images.
</step>

<step name="discovery">
Discover existing assets:

```bash
higgsfield marketing-studio avatars list --json
higgsfield marketing-studio products list --json
higgsfield marketing-studio hooks list --json
higgsfield marketing-studio settings list --json
higgsfield marketing-studio ad-references list --json
higgsfield marketing-studio brand-kits list --json
higgsfield marketing-studio ad-formats list --json
```
</step>

<step name="workflow_video">
Quick ad video workflow:

1. **Get product** — list existing, fetch from URL, or create from uploads
2. **Pick avatar** — browse presets or create custom
3. **Optionally pick setup items** — hook, setting (video only)
4. **Pick mode** — default `ugc`. Other: `ugc_how_to`, `ugc_unboxing`, `product_showcase`, `product_review`, `tv_spot`, `wild_card`, `ugc_virtual_tryon`, `virtual_try_on`
5. **Generate**:
```bash
higgsfield generate create marketing_studio_video \
  --prompt "..." \
  --avatars @"$AVATARS_JSON" \
  --product_ids @"$PRODUCT_IDS_JSON" \
  --mode ugc \
  --duration 15 \
  --resolution 720p \
  --aspect_ratio 9:16 \
  --wait
```
6. **Deliver** — URL + one-line summary (mode, duration)
</step>

<step name="workflow_image">
Marketing image workflow:

Same as video but use `marketing_studio_image` model:
```bash
higgsfield generate create marketing_studio_image \
  --prompt "..." \
  --aspect_ratio 1:1 \
  --resolution 2k \
  --wait
```
</step>

<step name="click_to_ad">
Click-to-Ad shortcut (URL-driven):

```bash
higgsfield marketing-studio products fetch --url https://shop.example.com/sneakers --wait
higgsfield generate create marketing_studio_video \
  --url https://shop.example.com/sneakers \
  --mode ugc \
  --duration 15 \
  --aspect_ratio 9:16 \
  --wait
```
</step>

<step name="ux_rules">
Marketing Studio UX rules:

- One question per phase. Don't ask product+avatar+mode upfront.
- Two ad approaches are mutually exclusive: reference-driven OR composed-from-blocks, never both.
- `dtc-ads` ad format is mandatory. Always ask user to pick from `ad-formats list`.
- Hook/setting valid only for `ugc`, `ugc_how_to`, `ugc_unboxing`, `product_review`, `ugc_virtual_tryon`.
</step>

</steps>

<acceptance-criteria>
- [ ] Product obtained (existing, URL, or uploaded)
- [ ] Avatar selected if needed
- [ ] Setup items picked if applicable
- [ ] Mode selected
- [ ] Generation command executed
- [ ] URL delivered with summary
</acceptance-criteria>
