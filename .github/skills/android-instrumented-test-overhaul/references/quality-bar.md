# Quality bar

## Evidence for one selected slice

- Record the target test class or cohesive behavior, the relevant test inventory, and the build variant.
- Every changed or added test has a meaningful behavior-facing assertion and deterministic setup and cleanup.
- No changed test depends on arbitrary sleeps, swallowed failures, a production service, or a live write side effect.
- Repair stale tests in scope. For each test that must remain ignored, state the reason and next action; ignored tests do not count as passing coverage.
- Compile the target test APK and pass each changed test on a selected emulator or device. Use Android CLI to list/start/stop the emulator when available; record the commands and device/API level. Run a broader suite only when the change or risk warrants it. Without device execution, report the blocker and keep the goal open.
- Fix relevant failures at their cause. A pass only after retries is not sufficient.
- Report exact commands, variant, device/API level, result counts when available, and remaining risks. Do not imply that untouched tests were verified.

## Test design checks

For each case ask:

1. What user-visible or platform behavior does this prove?
2. Would it fail if that behavior regressed?
3. Is it deterministic from clean app state and on repeat runs?
4. Are network, storage, preferences, permissions, locale, orientation, and test order controlled where they matter?
5. Is this the least expensive test layer that still exercises the behavior?
