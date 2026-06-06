# Contributing to `adaptive_navbar`

Thanks for taking the time to contribute! This document covers everything you need to know to submit a change that lands cleanly.

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](./CODE_OF_CONDUCT.md). By participating, you agree to uphold it.

## Reporting bugs / requesting features

Use the [issue templates](https://github.com/moulibheemaneti/adaptive_navbar/issues/new/choose). Bug reports without a Flutter version, repro steps, and expected vs. actual behavior will be slow to triage.

## Development setup

```bash
# Clone
git clone https://github.com/moulibheemaneti/adaptive_navbar.git
cd adaptive_navbar

# This repo uses FVM to pin the Flutter version (see .fvmrc)
fvm install
fvm flutter pub get

# Run tests
fvm flutter test

# Run the example app
cd example && fvm flutter run
```

If you don't use FVM, plain `flutter` works too — just make sure your version satisfies the SDK constraint in `pubspec.yaml`.

## Project structure

```
lib/
  adaptive_navbar.dart   # public barrel
  src/
    navbar.dart          # AdaptiveNavBar (extends AppBar)
    navbar_item.dart     # NavBarItem (extends InkWell)
    navbar_small.dart    # collapsed menu view (< 800 px)
    navbar_wide.dart     # full navbar view (>= 800 px)
test/                    # widget tests, one file per public class
example/                 # runnable demo app
```

## Pre-commit hooks

This repo uses [`dart_husky`](https://pub.dev/packages/dart_husky). On every commit the following run automatically:

| Hook | Command |
|---|---|
| `format` | `dart format --set-exit-if-changed .` |
| `analyze` | `flutter analyze .` |
| `test` | `flutter test` |

If any hook fails, the commit is blocked. Fix the issue and re-stage — don't `--no-verify`.

## Commit messages

We follow [Conventional Commits](https://www.conventionalcommits.org/). The PR title is linted in CI by `pr_title.yml`.

Accepted types:

- `feat:` — new user-facing feature
- `fix:` — bug fix
- `docs:` — README / dartdoc / CHANGELOG only
- `style:` — formatting (no logic change)
- `refactor:` — code change that is neither a fix nor a feature
- `test:` — adding or fixing tests
- `chore:` — tooling, deps, build (no `lib/` change)
- `ci:` — workflow files
- `wip:` — work-in-progress (allowed locally; do not merge to `master`)
- `release:` — version bump / changelog cut

Examples:

```
feat(navbar): expose breakpoint as a parameter
fix(item): null-safe onTap when popup dismissed mid-tap
chore(deps): bump flutter_lints to 6.1.0
```

## Pull request checklist

Before opening a PR, make sure:

- [ ] `fvm flutter analyze .` is clean
- [ ] `fvm flutter test` passes locally (all 23+ tests)
- [ ] New public APIs have dartdoc comments
- [ ] New behavior has a widget test in `test/`
- [ ] `CHANGELOG.md` is updated under `## [Unreleased]` (or the active version section)
- [ ] `pubspec.yaml` version is bumped following [SemVer](https://semver.org/) **if you changed anything in `lib/`**
  - Patch (`1.0.x`) — bug fixes, internal cleanup
  - Minor (`1.x.0`) — backwards-compatible new API surface
  - Major (`x.0.0`) — breaking changes
- [ ] PR title follows Conventional Commits

## Releasing (maintainers)

1. Bump `version:` in `pubspec.yaml`.
2. Move `## [Unreleased]` content under a new version heading with today's date.
3. Merge to `master`.
4. Tag `vX.Y.Z` — the publish workflow handles pub.dev.

## Questions?

Open a [discussion](https://github.com/moulibheemaneti/adaptive_navbar/discussions) or ping `@moulibheemaneti` on an existing issue.
