#!/bin/bash

set -e

echo "Installing emojis..."
echo ""

edit_use "noto-emoji" "media-fonts/noto-emoji" "icons"

install_pkg "noto-emoji" "media-fonts/noto-emoji"
echo ""
