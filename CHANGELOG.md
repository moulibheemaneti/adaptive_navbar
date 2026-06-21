# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
