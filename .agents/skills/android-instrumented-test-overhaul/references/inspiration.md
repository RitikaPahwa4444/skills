# Guidance and examples

Use these as design references, not mandates to install frameworks or copy another app's architecture.

- [Android Skills: testing setup](https://github.com/android/skills/tree/main/testing/testing-setup) — inventory-first workflow, reuse the existing stack, create fakes where useful, and separate local UI tests from true instrumentation.
- [Android: instrumented test stability](https://developer.android.com/training/testing/instrumented-tests/stability) — synchronize on app work, avoid arbitrary sleeps, and diagnose flakiness.
- [Android: testing in Android Studio](https://developer.android.com/studio/test/test-in-android-studio) — use device tests for integration/UI behavior and Android-dependent behavior that test doubles cannot represent.
- [GitHub Copilot: agent skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) — portable `SKILL.md` structure and supported skill locations.
- [Android Testing Samples](https://github.com/android/testing-samples) — focused Espresso examples for idling resources, intents, RecyclerViews, fragments, and UI Automator.
- [Now in Android testing guidance](https://github.com/android/nowinandroid#testing) — variant-aware tests, hermetic demo data, fakes, and assertions on state rather than mock call choreography.
- [Android Architecture Samples test specification](https://github.com/android/architecture-samples/wiki/To-do-app-specification) — compare isolated mock-backed device tests with network-backed variants.
