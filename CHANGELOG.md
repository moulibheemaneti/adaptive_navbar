# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.5](https://github.com/moulibheemaneti/adaptive_navbar/compare/adaptive_navbar-v1.1.4...adaptive_navbar-v1.1.5) (2026-06-21)


### Miscellaneous

* bump version to 1.1.4 ([41f49dc](https://github.com/moulibheemaneti/adaptive_navbar/commit/41f49dca6bc8a0b48745a9ad740b31854772fe58))
* update flutter version to 3.44.2 ([397db97](https://github.com/moulibheemaneti/adaptive_navbar/commit/397db97673ca11c9654769ae7283b2446ec1e6ee))
* update flutter version to 3.44.2 ([23c54bb](https://github.com/moulibheemaneti/adaptive_navbar/commit/23c54bb3acae528ddaa99b48e9b077a86933698a))
* update pubspec.lock ([a3cdc59](https://github.com/moulibheemaneti/adaptive_navbar/commit/a3cdc5987854eebdc046f5089e4f6e1004600d99))

## [1.1.4](https://github.com/moulibheemaneti/adaptive_navbar/compare/adaptive_navbar-v1.1.3...adaptive_navbar-v1.1.4) (2026-06-21)


### CI

* fix publish workflow not triggering after release-please ([e1f1fc1](https://github.com/moulibheemaneti/adaptive_navbar/commit/e1f1fc1a073858b7cab9a582a83ae64453dd3ba9))

## [1.1.3](https://github.com/moulibheemaneti/adaptive_navbar/compare/adaptive_navbar-v1.1.2...adaptive_navbar-v1.1.3) (2026-06-21)


### Miscellaneous

* show chore, docs, and ci commits in changelog ([94b3cb8](https://github.com/moulibheemaneti/adaptive_navbar/commit/94b3cb82e309b9a5cf7872a9fe570e5b168e0e2a))
* update packages and changelog config ([0557e5b](https://github.com/moulibheemaneti/adaptive_navbar/commit/0557e5b0cd65d826143f3b2d0ebc4512e6a86e7b))
* upgrade dart_husky to 1.2.2 ([6900292](https://github.com/moulibheemaneti/adaptive_navbar/commit/690029262243fe143178381ba7d9c08f96c59d3a))


### CI

* add workflow_dispatch to publish workflow ([25b1621](https://github.com/moulibheemaneti/adaptive_navbar/commit/25b1621812344819bc2e52a88bb873636026a9a1))
* use dart pub publish for oidc compatibility ([51b5576](https://github.com/moulibheemaneti/adaptive_navbar/commit/51b557695dbc690b3f335e48f9fe48d4608ef7b4))
* use dart-lang reusable publish workflow for oidc ([b163c76](https://github.com/moulibheemaneti/adaptive_navbar/commit/b163c765d8479d40a163de6e11f2e6e1f556ecb9))

## [1.1.2](https://github.com/moulibheemaneti/adaptive_navbar/compare/adaptive_navbar-v1.1.1...adaptive_navbar-v1.1.2) (2026-06-21)


### Bug Fixes

* match publish trigger to release-please tag format ([c5d18a6](https://github.com/moulibheemaneti/adaptive_navbar/commit/c5d18a6abb907149bcb63fd2a466ebff55f46bcc))
* use simple version tag format without component prefix ([bdb7c7a](https://github.com/moulibheemaneti/adaptive_navbar/commit/bdb7c7aa3446f7cd4c34260414db4255b872fbb0))

## [1.1.1](https://github.com/moulibheemaneti/adaptive_navbar/compare/adaptive_navbar-v1.1.0...adaptive_navbar-v1.1.1) (2026-06-21)


### Bug Fixes

* add pub.dev publish workflow ([a06b592](https://github.com/moulibheemaneti/adaptive_navbar/commit/a06b592bad08323b74a31e920deb5b040da49794))

## [1.1.0](https://github.com/moulibheemaneti/adaptive_navbar/compare/adaptive_navbar-v1.0.3...adaptive_navbar-v1.1.0) (2026-06-21)


### Features

* add optional width, alignment, and title parameters ([b50cf39](https://github.com/moulibheemaneti/adaptive_navbar/commit/b50cf39ba32c1a57eb0d23a1bdf376964f1d4eeb))
* optional title, width & alignment params + release automation ([3f769d5](https://github.com/moulibheemaneti/adaptive_navbar/commit/3f769d53fb9e84649f12e3a809d16537ed228c9d))

## [1.0.3] - 2026-06-06

### Added
- **Community Health Files** for GitHub Community Standards compliance:
  - `CODE_OF_CONDUCT.md` (Contributor Covenant 2.1).
  - `CONTRIBUTING.md` with setup, test, and conventional-commit guidance.
  - `SECURITY.md` with private vulnerability reporting via GitHub Security Advisories.
  - `.github/ISSUE_TEMPLATE/bug_report.yml` and `feature_request.yml` (YAML forms).
  - `.github/ISSUE_TEMPLATE/config.yml` for issue-creation routing.
  - `.github/pull_request_template.md` PR checklist.

## [1.0.2] - 2026-06-06

### Added
- **Widget Test Suite**: 23 widget tests across `AdaptiveNavBar`, `NavBarItem`, `NavBarSmall`, and `NavBarWide` covering adaptive breakpoint switching, title behavior, tap handlers, layout, and `AppBar` pass-through.
- **Package Metadata for pub.dev SEO**:
  - `topics:` field (`navigation`, `navbar`, `responsive`, `adaptive`, `widget`).
  - `screenshots:` entry pointing at `screenshots/adaptive_navbar.png`.
  - `issue_tracker` URL.
- **CI & Tooling**:
  - GitHub Actions workflow (`pr_title.yml`) enforcing conventional commits on PR titles.
  - Dependabot config for daily dependency upgrades.
  - `dart_husky` pre-commit hooks: `dart format --set-exit-if-changed`, `flutter analyze`, `flutter test`.
  - Conventional commit-msg hook (allows `wip` and `release` types).

### Changed
- Rewrote `description` field for better pub.dev SEO (60–180 char sweet spot).
- Loosened SDK constraint from `^3.12.1` to `>=3.0.0 <4.0.0`.

### Removed
- `pub_login.sh` and the legacy `publish.yml` token-based publishing flow (will be replaced by pub.dev OIDC-based automated publishing).
- Redundant `test` dev dependency that conflicted with the Flutter SDK's `test_api` pin (`flutter_test` re-exports it).

## [1.0.1]
- Upgrade flutter version to 3.44.0

## [1.0.0]
- Initial stable release with adaptive navigation bar (menu on narrow screens, full navbar on wide).

## [0.0.3]
- Updated documentation.

## [0.0.2]
- Properly documented.

## [0.0.1]
- Added support for adaptiveness of the default Flutter AppBar.
