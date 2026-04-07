# Contributing to Bonjour

Thank you for considering contributing to Bonjour. We welcome contributions from the community.

## Before you start

1. **Check existing issues** — your idea or bug may already be tracked
2. **Open an issue first** — for significant changes, please discuss before coding
3. **Read this guide** — follow our conventions to speed up the review process

## Development setup

### Prerequisites

- [Go 1.24+](https://go.dev/dl/)
- [Git](https://git-scm.com/)
- A text editor (VS Code, GoLand, etc.)

### Clone and build

```bash
git clone https://github.com/diShine-digital-agency/bonjour.git
cd bonjour
go build -o bonjour .
```

### Run locally

```bash
./bonjour --config docs/bonjour.yml
```

Then open http://localhost:8080 in your browser.

### Run tests

```bash
go test ./...
```

## Code conventions

### Go code

- Follow [Effective Go](https://go.dev/doc/effective_go) and standard Go idioms
- Use `gofmt` for formatting
- Keep functions focused and short
- Add comments for exported functions
- Do **not** add heavy JavaScript frameworks (React, Vue, Angular)
- Maintain the single-binary philosophy — all assets are embedded via `go:embed`

### CSS

- Use CSS custom properties (variables) defined in `main.css`
- Keep selectors specific and scoped to widget/component
- Test changes on both desktop and mobile viewports

### JavaScript

- Vanilla JS only — no frameworks
- Use ES modules (`import`/`export`)
- Keep scripts minimal and focused

### YAML configuration

- Use kebab-case for all configuration keys
- Document new options in `docs/configuration.md`
- Provide sensible defaults

## Pull request process

1. **Fork** the repository and create a feature branch from `main`
2. **Make your changes** with clear, descriptive commits
3. **Test** your changes locally (`go build`, `go test ./...`)
4. **Update documentation** if you add/change features
5. **Submit a PR** with a clear description of what and why

### PR title convention

Use a descriptive title:
- `feat: add new weather provider option`
- `fix: correct RSS feed parsing for Atom feeds`
- `docs: update YAML configuration examples`
- `style: improve mobile widget spacing`

## Bug reports

When reporting bugs, include:

1. **Bonjour version** (`./bonjour --version`)
2. **Operating system** and architecture
3. **Configuration** (sanitize any secrets)
4. **Steps to reproduce**
5. **Expected vs actual behavior**

## Feature requests

We welcome ideas! When proposing a feature:

1. Explain the **use case** and **benefit**
2. Consider how it fits the Bonjour philosophy (lightweight, YAML-driven, single binary)
3. If possible, suggest an implementation approach

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (GNU Affero General Public License v3.0).

## Code of conduct

This project follows the [Contributor Covenant Code of Conduct](.github/CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## Contact

For questions about contributing, reach out to kevin@dishine.it or open a discussion on the repository.

---

Bonjour builds upon the foundation of [Glance](https://github.com/glanceapp/glance).
