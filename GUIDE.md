# Bonjour User Guide

Welcome to Bonjour — your personal, high-performance dashboard by [diShine Digital Agency](https://dishine.it).

This guide is written for **non-technical users** who want to set up and customize their Bonjour dashboard.

---

## Table of Contents

1. [What is Bonjour?](#what-is-bonjour)
2. [Getting Started](#getting-started)
3. [Understanding the Configuration File](#understanding-the-configuration-file)
4. [Adding Pages](#adding-pages)
5. [Adding Widgets](#adding-widgets)
6. [Customizing the Look](#customizing-the-look)
7. [Setting Up Auto-Refresh](#setting-up-auto-refresh)
8. [Authentication](#authentication)
9. [Frequently Asked Questions](#frequently-asked-questions)

---

## What is Bonjour?

Bonjour is a lightweight dashboard that runs as a single application on your computer or server. It shows you information from various sources — news feeds, weather, stock markets, bookmarks, and more — all in one place.

Everything is configured through a single file called `bonjour.yml`.

---

## Getting Started

### Option 1: Direct Binary

1. Download the `bonjour` binary from the [Releases page](https://github.com/diShine-digital-agency/bonjour/releases). You'll find, under the changelog, all binaries for Windows, Mac & Linux (for Apple Silicon, download `bonjour_1.0.1_darwin_arm64.tar.gz`, for Intel-based Macs, download `bonjour_1.0.1_darwin_amd64.tar.gz`).
2. Create a `bonjour.yml` file in the same directory
3. Run: `./bonjour`
4. Open http://localhost:8080 in your browser

### Option 1: Docker (Recommended)

If you have Docker installed, this is the easiest way:

1. Create a file called `bonjour.yml` in a folder (e.g., `~/bonjour/`)
2. Copy the example configuration from `docs/bonjour.yml`
3. Run:

```bash
docker run -d \
  --name bonjour \
  -p 8080:8080 \
  -v ~/bonjour/bonjour.yml:/app/config/bonjour.yml \
  ghcr.io/dishine-digital-agency/bonjour:latest
```

4. Open http://localhost:8080 in your browser

---

## Understanding the Configuration File

The `bonjour.yml` file controls everything about your dashboard. It uses YAML format, which is a simple text format that uses indentation (spaces, not tabs!) to organize data.

### Basic Structure

```yaml
# Optional: customize the app identity
branding:
  logo-text: Bonjour
  app-name: Bonjour

# Optional: enable auto-refresh
document:
  auto-refresh-minutes: 5

# Required: define your pages and their content
pages:
  - name: My Dashboard
    columns:
      - size: small
        widgets:
          # widgets go here

      - size: full
        widgets:
          # widgets go here

      - size: small
        widgets:
          # widgets go here
```

### Important Rules

- **Use spaces, not tabs** — YAML is strict about this
- **Indentation matters** — items at the same level must have the same indentation
- **Dashes (`-`)** indicate list items
- **Comments** start with `#` and are ignored

---

## Adding Pages

Your dashboard can have multiple pages. Each page appears as a tab in the top navigation.

```yaml
pages:
  - name: Home
    columns:
      # ... widgets

  - name: Work
    columns:
      # ... widgets

  - name: Finance
    columns:
      # ... widgets
```

### Page Options

| Option | Description | Example |
|--------|-------------|---------|
| `name` | Page title shown in the tab | `Home` |
| `slug` | URL path (auto-generated from name if omitted) | `my-page` |
| `width` | Content width: `slim`, default, or `wide` | `wide` |
| `show-mobile-header` | Show page title on mobile | `true` |
| `center-vertically` | Center content vertically | `true` |

---

## Adding Widgets

Each page has columns, and each column contains widgets. Columns can be `small`, `full`, or you can specify a custom size.

### Most Popular Widgets

#### Search Bar

```yaml
- type: search
  search-engine: google  # or: duckduckgo, bing, startpage
  autofocus: true
  placeholder: Search the web…
```

#### Weather

```yaml
- type: weather
  location: Milan, Italy
  units: metric      # or: imperial
  hour-format: 24h   # or: 12h
```

#### Bookmarks

```yaml
- type: bookmarks
  groups:
    - title: Work
      links:
        - title: Gmail
          url: https://mail.google.com
        - title: Drive
          url: https://drive.google.com

    - title: News
      links:
        - title: Hacker News
          url: https://news.ycombinator.com
```

#### RSS / News Feeds

```yaml
- type: rss
  limit: 10
  collapse-after: 5
  feeds:
    - url: https://example.com/feed.xml
      title: My Blog
```

#### Markets / Stocks

```yaml
- type: markets
  markets:
    - symbol: SPY
      name: S&P 500
    - symbol: BTC-USD
      name: Bitcoin
```

#### Calendar

```yaml
- type: calendar
  first-day-of-week: monday
```

#### Clock

```yaml
- type: clock
  hour-format: 24h
  timezones:
    - timezone: Europe/Rome
      label: Rome
    - timezone: America/New_York
      label: New York
```

#### Monitor (Uptime)

```yaml
- type: monitor
  title: My Services
  sites:
    - title: Website
      url: https://example.com
    - title: API
      url: https://api.example.com/health
```

For a complete list of all available widgets and their options, see the [Configuration Reference](docs/configuration.md).

---

## Customizing the Look

### Branding

```yaml
branding:
  logo-text: My Dashboard    # Text shown in the header
  app-name: My App           # Name for the browser tab / PWA
  hide-footer: true          # Hide the footer
  # favicon-url: /assets/my-favicon.svg
  # logo-url: /assets/my-logo.png
```

### Colors / Themes

Bonjour comes with a built-in theme picker. You can also define custom theme presets:

```yaml
theme:
  background-color: 192 10 11    # HSL values: hue saturation lightness
  primary-color: 248 75 64       # The accent/link color
  contrast-multiplier: 1.0
```

### Custom CSS

For advanced customization, you can load a custom CSS file:

```yaml
server:
  assets-path: /path/to/my/assets

theme:
  custom-css-file: /assets/custom.css
```

---

## Setting Up Auto-Refresh

Bonjour can automatically refresh widget content at regular intervals. This is useful for widgets like weather, markets, or monitor.

```yaml
document:
  auto-refresh-minutes: 5   # Refresh every 5 minutes (set to 0 to disable)
```

This refreshes the page content without a full browser reload.

---

## Authentication

To protect your dashboard with a login:

1. Generate a secret key:
   ```bash
   ./bonjour secret:make
   ```

2. Hash your password:
   ```bash
   ./bonjour password:hash YourPassword123
   ```

3. Add to your config:
   ```yaml
   auth:
     secret-key: <paste-secret-key-here>
     users:
       admin:
         password-hash: <paste-hash-here>
   ```

---

## Frequently Asked Questions

### How do I restart after changing the config?

If running directly: stop the process (Ctrl+C) and run it again.
If using Docker: `docker restart bonjour`

Bonjour also supports live config reloading — it watches the config file for changes.

### Can I run it on my Raspberry Pi?

Yes! Bonjour is compiled for multiple architectures. Download the ARM binary for your Pi.

### How do I use a custom domain?

Set up a reverse proxy (like Nginx or Caddy) pointing to Bonjour's port, and configure:

```yaml
server:
  proxied: true
  base-url: /dashboard  # if running at a subpath
```

### Where can I find more widget options?

See the full [Configuration Reference](docs/configuration.md) for all widgets and their options.

### How do I report a bug?

Open an issue on [GitHub](https://github.com/diShine-digital-agency/bonjour/issues) with:
- Your `bonjour.yml` (remove any secrets!)
- Steps to reproduce the issue
- What you expected vs. what happened

---

Bonjour builds upon the foundation of [Glance](https://github.com/glanceapp/glance).
