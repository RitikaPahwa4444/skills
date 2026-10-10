# Contributing

Issues and pull requests are welcome. Keep each skill focused on a distinct Android workflow and usable across repositories, agent hosts, and project architectures.

For this skill repository:

1. Edit the canonical skill under `testing/<skill-name>/`.
2. Keep `.github/skills/<skill-name>/` and `.agents/skills/<skill-name>/` in sync for Copilot and other compatible agents.
3. Keep `name` in `SKILL.md` frontmatter identical to the skill directory name. Describe both what the skill does and when to use it.
4. Keep host-specific features optional and provide a useful fallback for agents that do not support them.
5. Run `bash scripts/check-skill-mirrors.sh` and validate changed skills against the [Agent Skills specification](https://agentskills.io/specification). Before publishing, use `gh skill publish --dry-run` with GitHub CLI 2.90.0 or later when available.

Do not include credentials, private project details, or machine-specific paths in skills or examples. Prefer short instructions in `SKILL.md` and focused references for details that are only needed sometimes.
