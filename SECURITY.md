# Security Policy

## Scope

Bonjour is a self-hosted dashboard application. It runs as a single Go binary and serves a web interface on a local network port. It is designed for personal and internal use behind a reverse proxy — it is not hardened for direct exposure to the public internet without additional protection.

## Supported versions

| Version | Supported |
|---------|-----------|
| 1.x     | Yes       |

Security updates will be applied to the latest release.

## Reporting a vulnerability

If you discover a security vulnerability in Bonjour, please report it responsibly:

1. **Do not** open a public GitHub issue.
2. **Email** your report to [security@dishine.it](mailto:security@dishine.it) with the subject line `[Bonjour Security]`.
3. Include:
   - A description of the vulnerability.
   - Steps to reproduce it.
   - The potential impact.
   - A suggested fix, if you have one.

### Response timeline

- **Acknowledgment**: within 48 hours
- **Assessment**: within 5 business days
- **Fix release**: as soon as possible after confirmation

## Security best practices for deployment

When deploying Bonjour:

- **Use HTTPS** — always run behind a reverse proxy (Nginx, Caddy, Traefik) with TLS.
- **Enable authentication** — use the built-in auth feature for any instance accessible beyond localhost.
- **Keep updated** — regularly pull the latest release.
- **Limit network access** — bind to `127.0.0.1` if only accessed locally.
- **Use Docker** — the official Docker image runs as a non-root user.

### Example secure configuration

```yaml
server:
  host: 127.0.0.1
  port: 8080
  proxied: true

auth:
  secret-key: <generate with ./bonjour secret:make>
  users:
    admin:
      password-hash: <generate with ./bonjour password:hash YOUR_PASSWORD>
```

## Acknowledgments

We appreciate responsible disclosure and will credit security researchers (with their permission) in our release notes.
