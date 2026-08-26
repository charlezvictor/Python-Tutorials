# Installed Agent Skills

Claude Code loads every skill in this directory automatically. Each skill lives in
its own folder containing a `SKILL.md` (plus supporting files where applicable).

## marketingskills — 50 skills

From [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills)
by Corey Haines. MIT licensed — see `LICENSE`.

- Upstream version: `2.11.0`
- Upstream commit: `becd60ee9df07f7d595c26e092253ba49f7a9ffc` (2026-08-24)

Covers CRO, copywriting, SEO/AI-SEO, paid ads, email, social, pricing, attribution,
and more. Start with `product-marketing` — the other skills read it first for product
and audience context.

Upstream `evals/` fixtures were omitted; they are test data for skill development,
not used at runtime.

### Updating

```bash
git clone --depth 1 https://github.com/coreyhaines31/marketingskills.git /tmp/ms
cp -r /tmp/ms/skills/* .claude/skills/
find .claude/skills -type d -name evals -prune -exec rm -rf {} +
```

## taste-skill — 13 skills

From [leonxlnx/taste-skill](https://github.com/leonxlnx/taste-skill) by Leonxlnx.
MIT licensed — see `LICENSE-taste-skill`.

- Upstream version: `1.0.0`
- Upstream commit: `ccbc15639c97057cbfcf32ecebc38ef716e4bb37` (2026-08-24)

Frontend design taste skills. Upstream folder names differ from the skill's own
`name:` field; these are installed under the `name:` value (the repo's documented
"install name") so Claude Code resolves them correctly:

| Upstream folder | Installed as |
| --- | --- |
| `taste-skill` | `design-taste-frontend` |
| `taste-skill-v1` | `design-taste-frontend-v1` |
| `gpt-tasteskill` | `gpt-taste` |
| `image-to-code-skill` | `image-to-code` |
| `redesign-skill` | `redesign-existing-projects` |
| `soft-skill` | `high-end-visual-design` |
| `output-skill` | `full-output-enforcement` |
| `minimalist-skill` | `minimalist-ui` |
| `brutalist-skill` | `industrial-brutalist-ui` |
| `stitch-skill` | `stitch-design-taste` |
| `brandkit`, `imagegen-frontend-web`, `imagegen-frontend-mobile` | unchanged |

`design-taste-frontend` is the general default. `design-taste-frontend-v1` and
`gpt-taste` are variants of the same job — remove them if overlapping triggers get
noisy. `brandkit` and the two `imagegen-*` skills produce reference images only,
not code.

### Updating

```bash
git clone --depth 1 https://github.com/leonxlnx/taste-skill.git /tmp/ts
# re-run the name-mapped copy: each skills/*/SKILL.md goes to the dir named by its `name:` field
```
