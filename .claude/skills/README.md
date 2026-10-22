# Installed Agent Skills

**933 skills installed** across eight sources, plus **31 plugins** from two
marketplaces (see `.claude/settings.json`). See each section below.

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

### 12 of these were replaced by their upstream originals

This repo vendors copies of Anthropic's own skills. Where they overlapped with
`anthropics/skills` (see below), the authoritative upstream version won.

## anthropics/skills — 19 skills

From [anthropics/skills](https://github.com/anthropics/skills) (commit
`3b3fad9`, 2026-08-21). No LICENSE file upstream; see its
`THIRD_PARTY_NOTICES.md`.

Anthropic's own skill library: `docx`, `pdf`, `pptx`, `xlsx`, `skill-creator`,
`canvas-design`, `brand-guidelines`, `mcp-builder`, `theme-factory`,
`webapp-testing`, `internal-comms`, `slack-gif-creator`, plus `academy-guide`,
`algorithmic-art`, `claude-api`, `discernment-nudge`, `doc-coauthoring`,
`frontend-design`, and `web-artifacts-builder`.

**This is the authoritative source for 12 skills that awesome-claude-skills
also vendors.** Those copies had drifted (7 differed materially — `skill-creator`
upstream is 33KB against the fork's 11KB), so the upstream versions replaced
them on install.

### Six skills shadow built-in Claude Code skills

`docx`, `pdf`, `pptx`, `xlsx`, `skill-creator`, and `claude-api` share names
with skills that ship with Claude Code. A project skill wins, so these now take
precedence. They are the genuine Anthropic versions, just pinned to commit
`3b3fad9` rather than tracking the bundled build. To fall back to the built-ins:

```bash
rm -rf .claude/skills/{docx,pdf,pptx,xlsx,skill-creator,claude-api}
```

## charlie947/social-media-skills — 17 skills

From [charlie947/social-media-skills](https://github.com/charlie947/social-media-skills)
(commit `69d9488`, 2026-08-12). See `LICENSE-social-media-skills`.

LinkedIn and short-form content skills: `voice-builder`, `post-writer`,
`post-scorer`, `content-matrix`, `hook-generator`, `profile-optimizer`,
`analytics-dashboard`, `reels-scripting`, `youtube-thumbnail`, and more.

Several need external credentials or tooling: `reels-scripting` wants
`APIFY_API_TOKEN` and `GOOGLE_AI_API_KEY`, `post-scorer` uses Apify, and
`niche-research` needs the Claude for Chrome extension.

## Plugin marketplaces — 31 plugins

`anthropics/claude-for-legal` and `anthropics/financial-services` are **plugin
marketplaces**, not flat skill libraries. Each plugin bundles skills together
with agents, slash commands, hooks, and an `.mcp.json`. They are installed as
plugins rather than copied into this directory, which keeps 20 agents and 47
slash commands working and avoids a name collision that a flat copy would hit:
`claude-for-legal` ships 12 genuinely different, plugin-scoped `customize`
skills (and 5 other repeated names) that would collapse into one.

Both marketplaces and all 31 plugins are declared in `.claude/settings.json` at
project scope, so they travel with the repo.

- **claude-for-legal** (commit `4a6c651`) — 12 plugins: `commercial-legal`,
  `corporate-legal`, `privacy-legal`, `ip-legal`, `litigation-legal`,
  `employment-legal`, `regulatory-legal`, `product-legal`,
  `ai-governance-legal`, `law-student`, `legal-clinic`, `legal-builder-hub`.
- **financial-services** (commit `69cbc81`) — 19 plugins: `model-builder`,
  `pitch-agent`, `earnings-reviewer`, `kyc-screener`, `equity-research`,
  `investment-banking`, `private-equity`, `wealth-management`, `fund-admin`,
  and more.

### These declare 32 third-party MCP endpoints

Between them the plugins declare MCP servers for CourtListener, Slack, Google
Drive, Solve Intelligence, Descrybe, FactSet, Moody's, PitchBook, S&P Global,
Morningstar, LSEG, Daloopa, and others. Declaring is not connecting — each
still needs its own authentication before it will do anything. Review
`.claude/settings.json` and disable any plugin you do not want:

```bash
claude plugin disable <plugin>@<marketplace>
```

### Known upstream bug

`financial-analysis`'s `.mcp.json` is invalid JSON at commit `69cbc81` — a
missing comma after the `egnyte` entry and an unclosed `box` object. Its MCP
servers will not parse. The plugin's skills and its 7 slash commands are
unaffected. This is a bug in `anthropics/financial-services`, not in this
install; it needs a fix upstream.

Most legal plugins expect a one-time setup pass before use:

```
/<plugin>:cold-start-interview
```

## wheresryan22/anatomy — 1 skill

From [wheresryan22/anatomy](https://github.com/wheresryan22/anatomy) (commit
`1482e84`, 2026-10-18). MIT — see `anatomy/LICENSE`.

Builds interactive isometric SVG figures that explain a technical idea as a
physical object — a test rig, a dial gauge, an arcade cabinet. Also prints a
figure to A4 PDF and can publish to the project's community gallery.

Unlike every other entry here, this is a **toolkit, not a single file**. Its
`SKILL.md` references `kit/`, `scripts/`, `references/` and all eight
`examples/` by relative path, so the directory is installed whole.

- **Prerequisites**: Node.js 20.10+ and Chrome or Chromium for the verification
  and PDF steps. Nothing to `npm install` — the kit uses only Node built-ins.
  If Chrome is not found automatically, set `CHROME_PATH`.
- **Verified**: `node examples/dial-indicator/build.mjs` runs clean on
  Node 22 and reproduces the committed HTML byte for byte.

### It is 27MB, and 24MB of that is regenerable

The eight examples ship their built output: 14MB of A4 PDFs and 10MB of
standalone HTML. Every one is regenerated by the example's own
`build.mjs`/`sheet.mjs`. To keep the repository lean you can drop them:

```bash
rm -f .claude/skills/anatomy/examples/*/*.pdf
rm -f .claude/skills/anatomy/examples/*/*.html
```

The skill still works — the sources are only ~700KB. Keep them if you want the
reference output on hand without a build.

### What it runs

The scripts launch headless Chrome over the DevTools protocol on `127.0.0.1`
to capture, verify and print figures, and read `CHROME_PATH` to locate the
binary. `scripts/publish.mjs` is the one outward-facing piece: on explicit
request it uses `gh` to open a pull request against the public gallery repo.
Nothing runs on its own.

The skill's own `.gitignore` and `.gitattributes` are kept — they stop
generated scratch output (`shots/`, `audit.txt`, `*-a4.html`) from being
committed when you use the skill.

Upstream `evals/` and the repo's CI workflows and issue templates were omitted;
the README's images were kept so it renders locally.

## Jakeschincariol/arena-skill — 1 skill

From [Jakeschincariol/arena-skill](https://github.com/Jakeschincariol/arena-skill)
(commit `df07b8e`, 2026-09-26). MIT — see `arena/LICENSE`.

`arena` runs a tournament when an answer is not good enough: N sub-agents get
the identical task, each with a different strategy card, then attack, defend and
revise each other's solutions through a single-elimination bracket until one
survives. Claude orchestrates and never competes or judges.

Installed as a folder copy rather than a plugin, which is what upstream
documents for project-local use and what gives plain `/arena`. Installed as a
plugin it would instead be `/arena-skill:arena`.

- **Prerequisites**: Python 3.8+ (3.11 here) and Claude Code, since it spawns
  sub-agents with the Agent tool. Nothing to `pip install` — `bracket.py` is
  standard library only.
- **Verified**: `init --quick --seed 7` deals cards, writes state and reports
  the next step correctly on Python 3.11.

### It is expensive — check `plan` before you run it

`bracket.py` does the bookkeeping; the cost is in the sub-agents it tells
Claude to launch. Five calls per match, and:

| Mode | Agents | Sub-agent calls |
| --- | --- | --- |
| `--quick` | 16 | 91 |
| default | 100 | 495 |

`python3 .claude/skills/arena/bracket.py plan` prints the full table for any N
without starting a run. Prefer `--quick` unless the task genuinely warrants
495 calls.

### Run state

`bracket.py` writes `.arena/` into the **current working directory**, not into
the skill folder. The repository root `.gitignore` carries a `.arena/` rule so
those runs stay out of git. If you invoke `/arena` from a subdirectory, that
directory gets its own `.arena/`.

Upstream `tests/` and `.claude-plugin/` manifests were omitted; neither is used
by a folder install.
