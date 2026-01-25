#!/bin/bash

set -e

echo "Installing jupyter..."
echo ""

# edit_use "nodejs" "net-libs/nodejs" "npm"
#
# install_pkg "jupyter" "dev-python/jupyter"
# echo ""

pipx install jupyter
echo ""
