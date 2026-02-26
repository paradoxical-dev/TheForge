#!/bin/bash

set -e

echo "Installing postgres..."
echo ""

install_pkg "postgresql" "dev-db/postgresql"
echo ""

sudo emerge --config "dev-db/postgresql"
echo ""

sudo systemctl start postgresql-18.service
sudo systemctl enable postgresql-18.service

echo "Installing pgadmin4..."
echo ""

pipx install pgadmin4
echo ""

if [[ ! -f "$HOME/.local/share/pipx/venvs/pgadmin4/lib/python3.13/site-packages/pgadmin4/config_local.py" ]]; then
tee "$HOME/.local/share/pipx/venvs/pgadmin4/lib/python3.13/site-packages/pgadmin4/config_local.py" <<EOF
import os.path

DATA_DIR = os.path.realpath(os.path.expanduser('~/.pgadmin/'))
LOG_FILE = os.path.join(DATA_DIR, 'pgadmin4.log')
SQLITE_PATH = os.path.join(DATA_DIR, 'pgadmin4.db')
SESSION_DB_PATH = os.path.join(DATA_DIR, 'sessions')
STORAGE_DIR = os.path.join(DATA_DIR, 'storage')
AZURE_CREDENTIAL_CACHE_DIR = os.path.join(DATA_DIR, 'azurecredentialcache')
EOF
fi
