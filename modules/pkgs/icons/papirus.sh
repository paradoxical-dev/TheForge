#!/bin/bash

set -e

echo "Installing Papirus icons..."
echo ""

if [[ ! -d "$HOME/.local/share/icons" ]]; then
    echo "${yellow}Icons directory not found. Creating $HOME/.local/share/icons...${color_end}"
    echo ""
    mkdir -p "$HOME/.local/share/icons"
fi

wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.local/share/icons" sh
echo ""

