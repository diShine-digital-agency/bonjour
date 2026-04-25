# Changelog

All notable changes to **Bonjour** will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.2] — 2026-04-25

### Changed

- **README** — fixed an empty-href Location badge, replaced it with a Go version badge, normalised headings to sentence case, removed a duplicated "Docker Compose" block that had been pasted twice, and rewrote the "About diShine" / credits section so the fork relationship to Glance is stated up front.
- **README — CLI reference** — added the `sensors:print` and `mountpoint:info` commands that exist in the binary but were missing from the documented list, and matched the syntax shown by `bonjour --help`.
- **GUIDE — Releases section** — replaced the hard-coded `1.0.1` archive names with version-agnostic placeholders and listed every published platform (darwin amd64/arm64, linux amd64/arm64, windows amd64) instead of only the two Mac builds.
- **GUIDE / CONTRIBUTING — attribution** — rephrased "Bonjour builds upon the foundation of Glance" to "Bonjour is a fork of Glance, licensed under AGPL-3.0", which is both clearer and accurate to the licence relationship.
- **SECURITY contact harmonisation** — the root `SECURITY.md` directed reports to `kevin@dishine.it` while `.github/SECURITY.md` and `.github/CODE_OF_CONDUCT.md` used `security@dishine.it`. Standardised on `security@dishine.it` everywhere so that vulnerability reports land in the right inbox regardless of which file a reporter reads first.
- **`docs/configuration.md`** — added an explanatory note at the top of the file about the inline preview images that were inherited from the upstream Glance documentation and are not reproduced here, with a pointer to the theme gallery (which is fully illustrated) and the upstream reference.

### Verified

- `go build ./...`, `go vet ./...`, and `go test ./...` all pass cleanly on Go 1.26.
- `bonjour --version`, `bonjour --help`, and every documented `command:action` are present in the compiled binary and match the README.

## [1.0.1] — 2026-04-07

### Fixed

- GoReleaser configuration corrected so that release binaries are produced for every advertised platform.

## [1.0.0] — 2026-04-07

### Initial release

Bonjour is a self-hosted, YAML-driven dashboard built by **diShine Digital Agency**. A single Go binary under 20MB delivers a mobile-first, themeable hub for feeds, weather, markets, server health, and more.

### Features

- **Feeds & News**
  - RSS / Atom feed aggregation with customizable limits and collapsing
  - Hacker News, Lobsters, and Reddit widgets with sorting and filtering
  - YouTube channel video feeds
  - Twitch live streams and top games
- **Productivity**
  - Search widget with Google, DuckDuckGo, Startpage, Bing, or custom engines
  - Bookmarks with grouped links and automatic favicons
  - Calendar with configurable first day of week
  - Clock with multiple timezone support
  - Todo lists
  - Change detection for monitored pages
- **Finance & Data**
  - Real-time stock, crypto, and forex market tracking
  - GitHub release and repository widgets
  - DNS stats integration
- **Weather**
  - Multi-location weather with hourly forecasts
  - Metric and imperial unit support
- **Infrastructure**
  - Docker container status monitoring
  - Server stats (CPU, memory, disk) for local and remote servers
  - Service uptime monitor with configurable check intervals
- **Extensibility**
  - Custom API widget with Go template rendering
  - Extension system for third-party widgets via HTTP
  - iFrame and raw HTML embedding
  - Include directives for splitting configuration across files
- **Theming & Appearance**
  - Built-in theme picker with community presets
  - HSL-based color system with contrast multiplier
  - Custom CSS file support
  - diShine color palette — Deep Purple `#6C5CE7`, Teal `#00CEC9`, Dark `#2D3436`
  - Inter variable font for UI, JetBrains Mono for code
- **Deployment & Configuration**
  - Single `bonjour.yml` configuration file
  - Auto-reload on config file changes
  - Environment variable substitution in config
  - Auto-refresh with configurable interval (`document.auto-refresh-minutes`)
  - Docker and Docker Compose ready with multi-arch images (amd64, arm64)
  - Systemd service support
  - Reverse proxy support with configurable base URL
- **Security**
  - Password-protected dashboards with bcrypt hashing
  - Secret key generation via CLI
- **CLI Tools**
  - `bonjour config:validate` — validate configuration
  - `bonjour config:print` — print parsed configuration
  - `bonjour secret:make` — generate authentication secret
  - `bonjour password:hash` — hash passwords for auth config
  - `bonjour diagnose` — run diagnostic checks
- **Documentation**
  - Full configuration reference
  - User guide for non-technical users
  - Theme gallery with copy-paste presets
  - Extension development guide
  - Security policy and contribution guidelines
