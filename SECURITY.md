# Security Policy

## Scope

This repository holds the **deployment configuration** for Famagram — Docker
Compose files, `.env` templates, and the Vault Agent setup — not the
application's source code (that's maintained privately; this repo consumes
the pre-built `nathanbascom/famagram-*` images). Reports are welcome for
either:

- A vulnerability in the deployment configuration itself (e.g. an insecure
  default, a container running with excessive privileges, a secret handling
  bug in `docker-compose.vault.yml`'s Vault Agent setup).
- A vulnerability in the running Famagram application discovered through
  normal use (e.g. an auth bypass, a way to access another family's data, an
  injection flaw) — these get relayed to the private source repo for a fix,
  and a new image is published once resolved.

## Supported Versions

Only the latest published image tags (and `latest`) are supported. Since this
is a self-hosted project with no backward-compatibility guarantee across
major versions, please update to the newest release before reporting an issue
to confirm it's still present.

## Reporting a Vulnerability

**Please do not open a public GitHub issue for security vulnerabilities.**

Use GitHub's private vulnerability reporting instead:

1. Go to the **Security** tab of this repository.
2. Click **Report a vulnerability**.
3. Describe the issue, including steps to reproduce, affected version/image
   tag, and potential impact.

This opens a private channel visible only to you and the maintainer, so the
issue isn't disclosed publicly before a fix is available.

## What to Expect

This is a single-maintainer hobby project, so response times are best-effort,
not SLA-backed. You can generally expect:

- An acknowledgment within a few days.
- An assessment of severity and whether it's accepted as a valid
  vulnerability.
- A fix released as a new image tag once resolved, with credit given (if
  wanted) in the release notes/`CHANGELOG.md`.

## Handling Your Own Deployment's Secrets

Since Famagram is self-hosted, you are responsible for securing your own
deployment:

- Keep `.env` / `.env.vault` and the Vault AppRole credentials
  (`vault/auth/role_id`, `vault/auth/secret_id`) out of version control (the
  included `.gitignore` already excludes them) and restricted to the host
  running the containers.
- Back up `ENCRYPTION_KEY` somewhere secure and separate from your database
  backups — losing it permanently loses access to all stored media, and
  anyone who obtains it (together with the encrypted files) could decrypt
  them.
- Keep your Docker images up to date (`docker compose pull && docker compose
  up -d`) to pick up security fixes.
