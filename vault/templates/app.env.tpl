{{- with secret (env "VAULT_SECRET_PATH") -}}
POSTGRES_USER={{ .Data.data.postgres_user }}
POSTGRES_PASSWORD={{ .Data.data.postgres_password }}
SESSION_SECRET={{ .Data.data.session_secret }}
ENCRYPTION_KEY={{ .Data.data.encryption_key }}
GOOGLE_CLIENT_ID={{ .Data.data.google_client_id }}
GOOGLE_CLIENT_SECRET={{ .Data.data.google_client_secret }}
GOOGLE_ADMIN_EMAIL={{ .Data.data.google_admin_email }}
ADMIN_EMAIL={{ .Data.data.admin_email }}
ADMIN_PASSWORD={{ .Data.data.admin_password }}
EXPORT_PASSWORD={{ .Data.data.export_password }}
{{- end }}
