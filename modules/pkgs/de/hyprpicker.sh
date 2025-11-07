#!/bin/bash

set -e

echo "Installing hyprpicker..."
echo ""

unmask_pkg "hyprpicker" "gui-apps/hyprpicker" "~amd64"
echo ""

install_pkg "hyprpicker" "gui-apps/hyprpicker"
echo ""
