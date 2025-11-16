#!/bin/bash

set -e

echo "Installing cava..."
echo ""

edit_use "cava" "media-sound/cava" "pipewire"

install_pkg "cava" "media-sound/cava"
echo ""
