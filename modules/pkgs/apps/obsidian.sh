#!/bin/bash

set -e

echo "Installing obsidian..."
echo ""

unmask_pkg "obsidian" "app-office/obsidian" "~amd64"
echo ""

edit_use "gcr" "app-crypt/gcr" "gtk"
edit_use "libdbusmenu" "dev-libs/libdbusmenu" "gtk3"
edit_use "obsidian" "app-office/obsidian" "appindicator"

install_pkg "obsidian" "app-office" "obsidian"
echo ""
