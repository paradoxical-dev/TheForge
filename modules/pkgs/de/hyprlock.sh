#!/bin/bash

set -e

echo "Installing hyprlock..."
echo ""

unmask_pkg "hyprlock" "gui-apps/hyprlock" "~amd64"
echo ""

install_pkg "hyprlock" "gui-apps/hyprlock"
echo ""
