#!/bin/bash

set -e

echo "Installing waybar..."
echo ""

# INFO: sdl2 must be built with gles2 for wayland support
edit_use "libsdl2" "media-libs/libsdl2" "gles2 pipewire"
install_pkg "libsdl2" "media-libs/libsdl2"
echo ""

edit_use "waybar" "gui-apps/waybar" "mpris mpd wifi network backlight tray pipewire upower"
unmask_pkg "waybar" "gui-apps/waybar" "~amd64"
echo ""

install_pkg "waybar" "gui-apps/waybar"
echo ""
