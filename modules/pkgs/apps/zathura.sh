#!/bin/bash

set -e

echo "Installing zathura..."
echo ""

unmask_pkg "zathura" "app-text/zathura" "~amd64"
echo ""
unmask_pkg "girara" "dev-libs/girara" "~amd64"
echo ""

install_pkg "zathura" "app-text/zathura-meta"
echo ""
