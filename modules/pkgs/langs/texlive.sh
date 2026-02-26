#!/bin/bash

set -e

echo "Installing texlive..."
echo ""

edit_use "harfbuzz" "media-libs/harfbuzz" "icu graphite"
echo ""

edit_use "texlive" "app-text/texlive" "graphics science extra png"
echo ""

install_pkg "texlive" "app-text/texlive"
echo ""
