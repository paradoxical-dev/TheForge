#!/bin/bash

set -e

echo "Installing waybar..."
echo ""

edit_use "waybar" "gui-apps/waybar" "mpris mpd wifi network backlight tray"
unmask_pkg "waybar" "gui-apps/waybar" "~amd64"

install_pkg "waybar" "gui-apps/waybar"
echo ""
