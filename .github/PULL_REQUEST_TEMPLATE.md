## What does this change?

<!-- A short description of what this PR changes and why. -->

## Type of change

- [ ] Documentation (README, CHANGELOG, comments)
- [ ] Docker Compose config (`docker-compose.deploy.yml` / `docker-compose.vault.yml`)
- [ ] `.env` / `.env.vault` example template
- [ ] Vault Agent setup (`vault/agent.hcl`, `vault/templates/app.env.tpl`)
- [ ] Other (please describe above)

## Checklist

- [ ] I tested this change locally (`docker compose -f docker-compose.deploy.yml up -d`, or against a real/dev Vault instance if this touches the Vault setup)
- [ ] I did not commit any real secrets — only placeholder values in example files
- [ ] I updated `README.md` if this changes setup steps or required environment variables
- [ ] I added an entry to `CHANGELOG.md` if this is a user-visible change

## Related issue

<!-- Link any related issue, e.g. "Closes #123" -->
