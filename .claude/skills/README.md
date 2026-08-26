# Marketing Skills

Agent skills installed from [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills)
by Corey Haines, MIT licensed (see `LICENSE`).

- Upstream version: `2.11.0`
- Upstream commit: `becd60ee9df07f7d595c26e092253ba49f7a9ffc` (2026-08-24)
- 50 skills, each in its own directory with a `SKILL.md` and supporting `references/`

Upstream `evals/` fixtures were omitted — they are test data for skill development,
not used at runtime.

Claude Code picks these up automatically from `.claude/skills/`. Start with
`product-marketing`, which the other skills read first for product and audience context.

## Updating

```bash
git clone --depth 1 https://github.com/coreyhaines31/marketingskills.git /tmp/ms
rm -rf .claude/skills/*/ && cp -r /tmp/ms/skills/* .claude/skills/
find .claude/skills -type d -name evals -prune -exec rm -rf {} +
```
