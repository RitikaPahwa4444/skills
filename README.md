# Android agent skills

Focused Android workflows in the open [Agent Skills](https://agentskills.io) format. Each skill has one canonical copy under a topic directory and mirrors for in-repository agent discovery.

## Available skills

- [Android instrumented test overhaul](testing/android-instrumented-test-overhaul/SKILL.md) — incrementally repair or expand one instrumented-test class or behavior slice, then run it against a defensible quality bar.

## Install

With GitHub CLI 2.90.0 or later, install the skill into the current project:

```sh
gh skill install RitikaPahwa4444/skills android-instrumented-test-overhaul
```

Or copy it manually to the project's supported skill directory:

```sh
# GitHub Copilot
mkdir -p .github/skills
cp -R /path/to/skills/.github/skills/android-instrumented-test-overhaul .github/skills/

# Codex and other compatible agents
mkdir -p .agents/skills
cp -R /path/to/skills/.agents/skills/android-instrumented-test-overhaul .agents/skills/
```

Then ask your agent to work on one named test class or cohesive behavior slice. This skill is Android-specific, but repository-agnostic: it inspects the target project's own modules, variants, test frameworks, architecture, and CI before choosing commands or changing tests.

## Contribute

Update the canonical skill under `testing/`, copy it to both discovery mirrors, then run:

```sh
bash scripts/check-skill-mirrors.sh
```

See [CONTRIBUTING.md](CONTRIBUTING.md). Licensed under [Apache-2.0](LICENSE).
