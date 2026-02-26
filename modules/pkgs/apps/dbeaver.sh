#!/bin/bash

set -e

echo "Installing DBeaver..."
echo ""

unmaks_pkg "dbeaver-bin" "dev-db/dbeaver-bin" "~amd64"
echo ""
install_pkg "dbeaver-bin" "dev-db/dbeaver-bin"
echo ""
