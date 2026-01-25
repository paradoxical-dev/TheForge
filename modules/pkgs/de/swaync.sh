#!/bin/bash

set -e

echo "Installing swaync..."
echo ""

unmask_pkg "swaync" "gui-apps/swaync" "~amd64"
echo ""
unmask_pkg "gtk4-layer-shell" "gui-libs/gtk4-layer-shell" "~amd64"
echo ""

edit_use "gtk-layer-shell" "gui-libs/gtk-layer-shell" "introspection vala"
edit_use "gtk4-layer-shell" "gui-libs/gtk4-layer-shell" "introspection vala"

install_pkg "swaync" "gui-apps/swaync"
echo ""

echo "Copying config for swaync..."
echo ""

# TODO: add swaync config
