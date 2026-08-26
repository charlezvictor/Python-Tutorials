# Installed Agent Skills

**907 skills installed** across four sources. See each section below.

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

## vercel-labs/agent-skills — 1 skill

`web-design-guidelines` from
[vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills)
(commit `dd089a8`, 2026-08-21). Reviews UI code against the Web Interface
Guidelines. The upstream repo ships no LICENSE file.

## microsoft/playwright-cli — 1 skill

`playwright-cli` from
[microsoft/playwright-cli](https://github.com/microsoft/playwright-cli)
(commit `60cb176`, 2026-08-25). Apache-2.0 — see `LICENSE-playwright-cli`.
Includes its `references/` (tracing, request mocking, session state, test
generation, and more). Declares `allowed-tools` for `playwright-cli`, `npx`,
and `npm`.

## ComposioHQ/awesome-claude-skills — 842 skills

From [ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills)
(commit `be2a406`, 2026-07-24). Apache-2.0 per the repo README; upstream ships
no LICENSE file.

28 curated skills (artifacts-builder, canvas-design, mcp-builder, theme-factory,
webapp-testing, file-organizer, and more) plus 814 `*-automation` skills.

### Three things to know

**The `*-automation` skills need Rube MCP.** All 832 upstream automation skills
declare `requires: mcp: [rube]` (Composio). Without a Rube MCP connection they
load and describe themselves but cannot execute. Connect Rube MCP to use them.

**22 upstream duplicates were deduped.** Upstream ships pairs like
`google_admin-automation` and `google-admin-automation` covering the same
toolkit. Both sanitize to one name, so the larger (more fully written) SKILL.md
was kept in each pair. That is why 864 upstream files became 842 installed
skills.

**80 names were sanitized.** Claude Code requires skill names to be lowercase
alphanumeric with hyphens. Upstream names like `Cloudinary Automation` and
`zoho_books-automation` would not load, so both the directory name and the
frontmatter `name:` field were normalized (`cloudinary-automation`,
`zoho-books-automation`). Only the name line was rewritten; skill bodies are
untouched.

### Five of these shadow built-in Claude Code skills

`docx`, `pdf`, `pptx`, `xlsx` (from upstream `document-skills/`) and
`skill-creator` have the same names as skills that ship with Claude Code.
A project skill wins over a built-in of the same name, so these snapshots now
take precedence over the maintained versions.

To restore the built-ins, delete the copies:

```bash
rm -rf .claude/skills/{docx,pdf,pptx,xlsx,skill-creator}
```
