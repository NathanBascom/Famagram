# Contributing to Famagram

Thanks for your interest in contributing! Before opening an issue or PR, it
helps to know what this repository actually contains.

## What's in this repo (and what isn't)

This repository holds the **deployment files** for Famagram — Docker Compose
configs, `.env` templates, the Vault Agent setup, and documentation. It does
**not** contain the application's source code (frontend/backend). The app
itself is distributed as pre-built Docker images
(`nathanbascom/famagram-{backend,frontend,nginx}`), which this repo's compose
files pull and run.

That means:

- **PRs with source-code changes** (new features, UI tweaks, backend fixes)
  can't be accepted here — there's no application code to change. Please open
  an issue describing the feature/bug instead (see below), and it'll be
  considered for the app itself.
- **PRs are welcome** for anything that *is* in this repo: the Compose files,
  `.env.example`/`.env.vault.example`, the Vault Agent config/template,
  `README.md`, `CHANGELOG.md`, and the community health files.

## Reporting Bugs

Open an issue using the **Bug report** template. Include:

- Which deployment method you used (`docker-compose.deploy.yml` or
  `docker-compose.vault.yml`)
- The image tag/version (`docker compose images`, or check the Admin panel)
- Steps to reproduce
- Relevant logs (`docker compose logs -f <service>`) — **redact anything
  sensitive**: `.env` values, session cookies, email addresses, etc.

For a security vulnerability, see [`SECURITY.md`](SECURITY.md) instead of
opening a public issue.

## Requesting Features

Open an issue using the **Feature request** template. Since the app's source
lives outside this repo, feature requests are triaged by the maintainer and
implemented separately — there's no guarantee of a timeline, but they're read
and considered.

## Submitting a Pull Request

For changes that do belong in this repo (compose files, docs, Vault setup):

1. Fork the repo and create a branch from `main`.
2. Make your change. If you're editing a Compose file, test it locally:
   ```bash
   cp .env.example .env   # fill in required values
   docker compose -f docker-compose.deploy.yml up -d
   ```
3. If you touched `docker-compose.vault.yml` or anything under `vault/`, test
   against a real (or local dev) Vault instance if you can — these files are
   harder to verify by inspection alone.
4. Update `README.md` and `CHANGELOG.md` if your change affects setup steps,
   required environment variables, or user-visible behavior.
5. **Never commit real secrets.** `.env.example`/`.env.vault.example` should
   only ever contain placeholder values.
6. Open a PR against `main` using the pull request template.

## Documentation Fixes

Typo fixes, clarity improvements, and corrections to `README.md` are always
welcome and don't need an issue first — just open a PR.

## Code of Conduct

This project follows a [Code of Conduct](CODE_OF_CONDUCT.md). By
participating, you're expected to uphold it.
