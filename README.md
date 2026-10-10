# Android skills

Focused `SKILL.md` workflows for better Android development with coding agents.

## Testing

- [Android instrumented test overhaul](testing/android-instrumented-test-overhaul/SKILL.md) — repair and expand one device-test class or behavior slice at a time, then run it to an evidence-based quality bar.

## Use a skill

Copy the skill into your Android project’s agent directory. For GitHub Copilot:

```sh
mkdir -p .github/skills
cp -R /path/to/skills/.github/skills/android-instrumented-test-overhaul .github/skills/
```

For Codex, use `.agents/skills` in place of `.github/skills`. Then ask your agent to work on one named instrumented-test class or cohesive behavior slice.
