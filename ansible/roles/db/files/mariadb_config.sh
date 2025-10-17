#!/usr/bin/env bash
set -Eeuo pipefail

MARKER="/var/lib/mysql/.config_done"

if [[ -f "$MARKER" ]]; then
  echo "Config already applied. Nothing to do."
  exit 0
fi

# Wait for server to be ready
echo "Waiting for MariaDB to be ready..."
for i in {1..60}; do
  if mysqladmin ping --silent >/dev/null 2>&1; then
    break
  fi
  sleep 1
done

# Choose auth method: socket (preferred on Debian) or password if provided
MYSQL=(mysql --protocol=socket -uroot)
if [[ -n "${MARIADB_ROOT_PASSWORD:-}" ]]; then
  MYSQL=(mysql -uroot -p"${MARIADB_ROOT_PASSWORD}")
fi

DB="${MARIADB_DATABASE}"
USER="${MARIADB_USER}"
PASS="${MARIADB_USER_PASSWORD}"

# Create database
"${MYSQL[@]}" <<SQL
CREATE DATABASE IF NOT EXISTS \`${DB}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
SQL

# Create user and grant privileges (least-privilege on the DB only)
"${MYSQL[@]}" <<SQL
CREATE USER IF NOT EXISTS '${USER}'@'%' IDENTIFIED BY '${PASS}';
GRANT ALL PRIVILEGES ON \`${DB}\`.* TO '${USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SQL

# Mark done
touch "$MARKER"
echo "Configuration applied."