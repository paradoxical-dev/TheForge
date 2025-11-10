#!/bin/bash

set -e

echo "Installing obsidian..."
echo ""

unmask_pkg "obsidian" "app-office/obsidian" "~amd64"
echo ""

edit_use "gcr" "app-crypt/gcr" "gtk"

install_pkg "obsidian" "app-office" "obsidian"
echo ""
