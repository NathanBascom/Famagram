pid_file = "/tmp/pidfile"

# VAULT_ADDR is read from the environment (set it on the vault-agent service
# in docker-compose.vault.yml / your .env file) — no address is hardcoded here.

auto_auth {
  method "approle" {
    mount_path = "auth/approle"
    config = {
      role_id_file_path                   = "/vault/config/role_id"
      secret_id_file_path                 = "/vault/config/secret_id"
      remove_secret_id_file_after_reading = false
    }
  }

  sink "file" {
    config = {
      path = "/vault/secrets/.vault-token"
    }
  }
}

template {
  source      = "/vault/config/app.env.tpl"
  destination = "/vault/secrets/app.env"
  perms       = "0444"
}
