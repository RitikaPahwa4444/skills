---
name: android-instrumented-test-overhaul
description: Repair, stabilize, or expand Android instrumented tests one class or cohesive behavior slice at a time. Use when tests have drifted, are flaky or disabled, or important Android-dependent behavior lacks coverage. Inspect the target repository, make focused changes, and run device tests to a measurable quality bar.
license: Apache-2.0
compatibility: Agent Skills-compatible host; Android SDK, Gradle project, and emulator or connected Android device are needed for instrumented test execution.
---

# Android Instrumented Test Overhaul

Own the selected slice through completion. Work incrementally: one existing test class or one cohesive behavior slice per invocation. Do not expand to unrelated classes or attempt a repository-wide sweep unless the user explicitly asks. Make each invocation a goal, even when the selected slice is small. Create or continue the goal at the start, keep making concrete progress, and mark it complete only after the quality bar below is satisfied. Do not merely give the user a plan for doing the work.

## 1. Establish scope and protect the checkout

1. Read repository guidance (`AGENTS.md`, contribution docs, test docs), inspect `git status`, and preserve unrelated user changes. Never revert or overwrite pre-existing work.
2. Map modules, variants/flavors, test source sets, instrumentation runner, test libraries, app architecture, DI, API clients, persistence, and CI test commands. Inspect the relevant production behavior before changing a test.
3. Inventory every target `androidTest` class and test. Record its behavior contract, setup, external dependencies, current status, ignored tests, fixed waits, broad exception catches, weak assertions, and required device/API level.
4. If the request names a broad area, select the first bounded test class or cohesive behavior slice that best matches the user's priority. State the selected slice and leave unrelated tests for later invocations.

## 2. Start the persistent goal

Always start or continue a goal for the selected slice:

1. Check for an existing active goal and continue it rather than creating a duplicate. If none exists, create a goal scoped to the named class or behavior slice, with measurable criteria such as: "Repair stale tests and add any missing assertions for [selected behavior], run its focused instrumentation task on a connected emulator, and report evidence and limitations."
2. Treat this goal as the working contract. Each work cycle must make a code, test, diagnosis, or execution improvement; do not stop at assessment or a green compile.
3. Run the narrowest relevant instrumented task, inspect full failure output and device logs, identify the cause, fix the cause, and rerun. Run the broader variant suite only when needed to validate interactions or explicitly requested.
4. Keep the goal active while useful work remains. Mark it complete only when all criteria for the selected slice are evidenced. Do not expand the goal to unrelated tests. Mark it blocked only after the same external blocker has persisted for at least three consecutive goal turns and meaningful progress requires an external-state change or user input. Report a single failed run as a blocker diagnosis, not goal completion.
5. If a device, SDK, permissions, or approval is missing, continue independent work within the selected slice and provide the exact command/setup needed. Never claim device verification that did not happen.

If the agent host provides a native persistent-goal feature, create or continue a goal for this slice and keep pursuing it until the completion criteria are met or a real blocker is established. Otherwise, state the goal and criteria in the conversation, continue through implementation and verification, and keep a concise progress checklist when handing work back between turns. Do not claim native goal integration in hosts that do not provide it.

## 3. Repair and expand tests

- Preserve the project's current frameworks and supported Android/Gradle versions. Do not add a testing dependency, replace the DI framework, or redesign the app solely to follow a sample project.
- Test observable user behavior and stable public UI contracts. Prefer Espresso/Compose semantics and resource IDs; use UI Automator only for system UI or cross-app behavior. Keep end-to-end journeys few and reserve component/data behavior for faster appropriate test layers.
- Make tests hermetic where feasible: use fakes, in-memory storage, controlled dispatchers, deterministic fixtures, and MockWebServer. Keep state isolated/reset between tests and variants.
- Never point a routine test run at a live production service or perform real uploads, edits, purchases, or account changes. Replace external effects with a fake or controlled server. If this needs a production seam, implement the narrowest safe seam and test it.
- Replace arbitrary `sleep`/`Thread.sleep` with Espresso synchronization, idling resources, deterministic callbacks, or condition-based polling with a bounded timeout. Don't catch broad exceptions to make a test appear optional.
- Assertions must fail when the behavior is broken. Remove unconditional assertions and assert the resulting screen/state/navigation/persistence/intent. Guard variant-specific expectations with assumptions or separate tests rather than passing vacuously.
- Do not delete, ignore, weaken, or loosen assertions to get a green build. Restore ignored tests where the behavior can be made deterministic; otherwise document why they remain quarantined and what evidence is needed.
- Add tests based on uncovered high-risk behavior, meaningful branches, regressions, and recently changed workflows—not a target test count. Avoid duplicating existing coverage.
- Keep fixtures small, named for their purpose, and independent from private credentials or personal machine data.

## 4. Run and diagnose

1. Determine exact task names from project variant configuration and test reports; do not guess that every flavor is supported. Use the repository's CI task when appropriate.
2. Check `adb devices` or the project's managed-device configuration before claiming device execution. Run the focused class/method first; run the full target suite only when appropriate to this slice or requested by the user.
3. On failure, classify it as compile/configuration, assertion/behavior, synchronization/flakiness, device/environment, or external dependency. Read XML/HTML test reports and relevant logcat. Fix application/test defects; don't mask environmental failures as success.
4. If a failure appears flaky, reproduce it and remove the race. Retries are diagnostic only; repeated pass-on-retry is not a quality fix.
5. After test changes, run the smallest relevant build/lint/format checks that the repository requires. Don't add unrelated tests or dependency upgrades.

## 5. Close the goal with evidence

Use the criteria in [quality-bar.md](references/quality-bar.md). Summarize files changed, behaviors repaired/added, exact commands and variants/devices run, counts/results, remaining ignored/quarantined cases in this slice, and any environment limitation. Update the persistent goal status based on actual evidence. Never claim a whole suite is healthy from one completed slice.

Consult [inspiration.md](references/inspiration.md) for source guidance. Adapt examples to the repository; do not copy their architecture or test setup wholesale.
