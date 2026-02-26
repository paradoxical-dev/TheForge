#!/bin/bash

set -e

echo "Installing nemo..."
echo ""

edit_use "libxmlb" "dev-libs/libxmlb" "introspection"
echo ""
edit_use "xapp" "x11-libs/xapp" "introspection"
echo ""
edit_use "nemo" "gnome-extra/nemo" "exif"
echo ""

install_pkg "nemo" "gnome-extra/nemo"
echo ""
