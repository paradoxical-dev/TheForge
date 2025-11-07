#!/bin/bash

set -e

echo "Installing JetBrains Nerd Font..."
echo ""

FONT_NAME="JetBrainsMono"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"
FONT_DIR="$HOME/.local/share/fonts"
TMP_DIR="/tmp/${FONT_NAME}"

if  fc-list | grep -q "$FONT_NAME"; then
    echo -e "${yellow}$FONT_NAME already installed. Skipping...${color_end}"
    echo ""
    exit 0
fi

mkdir -p "$TMP_DIR"

curl -L -o "${TMP_DIR}/${FONT_NAME}.zip" "$FONT_URL"

mkdir -p "$FONT_DIR"

unzip -o "${TMP_DIR}/${FONT_NAME}.zip" -d "$FONT_DIR" >/dev/null

fc-cache -fv "$FONT_DIR" >/dev/null

rm -rf "$TMP_DIR"

echo ""
echo "${green}JetBrains Nerd Font installed and activated!${color_end}"
echo ""
