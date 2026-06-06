<!--
PR title must follow Conventional Commits (e.g. `feat:`, `fix:`, `chore:`).
The pr_title.yml workflow will fail the check otherwise.
-->

## Summary

<!-- 1–3 sentences. What changed and why? -->

## Type of change

- [ ] Bug fix (`fix:`)
- [ ] New feature (`feat:`)
- [ ] Refactor / cleanup (`refactor:`)
- [ ] Docs / dartdoc (`docs:`)
- [ ] Tests only (`test:`)
- [ ] CI / tooling (`ci:` / `chore:`)
- [ ] Breaking change

## Linked issues

<!-- Use "Closes #N" so the issue auto-closes on merge. -->

Closes #

## Test plan

<!-- How did you verify? Paste relevant test names or manual steps. -->

- [ ] `fvm flutter analyze .` passes
- [ ] `fvm flutter test` passes
- [ ] Manually verified in `example/` on at least one platform

## Checklist

- [ ] New behavior is covered by a test in `test/`
- [ ] New public APIs have dartdoc comments
- [ ] `CHANGELOG.md` updated
- [ ] `pubspec.yaml` version bumped (SemVer) — **only if `lib/` changed**
- [ ] PR title follows Conventional Commits

## Screenshots (UI changes)

<!-- Before / after. Delete if not applicable. -->
