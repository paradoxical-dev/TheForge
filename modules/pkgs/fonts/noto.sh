#!/bin/bash

set -e

echo "Installing noto fonts..."
echo ""

install_pkg "noto" "media-fonts/noto"
echo ""

install_pkg "noto-cjk" "media-fonts/noto-cjk"
echo ""

echo "Setting noto to default symbol fallback font..."
echo ""

sudo eselect fontconfig enable 75-noto-emoji-fallback.conf
echo ""