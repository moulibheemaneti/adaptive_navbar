# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
