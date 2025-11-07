#!/bin/bash

set -e

echo "Installing hyprpaper..."
echo ""

unmask_pkg "hyprpaper" "gui-apps/hyprpaper" "~amd64"
echo ""

install_pkg "hyprpaper" "gui-apps/hyprpaper"
echo ""
