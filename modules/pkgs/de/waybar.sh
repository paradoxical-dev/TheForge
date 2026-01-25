#!/bin/bash

set -e

echo "Installing waybar..."
echo ""

edit_use "waybar" "gui-apps/waybar" "mpris mpd wifi network backlight tray"

install_pkg "waybar" "gui-apps/waybar"
echo ""
