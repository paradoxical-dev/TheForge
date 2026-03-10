#!/bin/bash

set -e

echo "Installing bibata cursors..."
echo ""

CURSOR_NAME="Bibata"
CURSOR_URL="https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata.tar.xz"
CURSOR_DIR="$HOME/.local/share/icons"
TMP_DIR="/tmp/${CURSOR_NAME}"

if [[ -d "${CURSOR_DIR}"/Bibata-* ]]; then
    echo -e "${yellow}$CURSOR_NAME already installed. Skipping...${color_end}"
    echo ""
    exit 0
fi

mkdir -p "$TMP_DIR"

curl -L -o "${TMP_DIR}/${CURSOR_NAME}.tar.xz" "$CURSOR_URL"

mkdir -p "$CURSOR_DIR"

tar -xvf "${TMP_DIR}/${CURSOR_NAME}.tar.xz" -C "$TMP_DIR"

mv "${TMP_DIR}"/Bibata-* "$CURSOR_DIR"/

rm -rf "$TMP_DIR"

sudo cp -r "${CURSOR_DIR}"/Bibata-* "/usr/share/icons/"

echo ""
echo "${green}Bibata cursors installed successfully!${color_end}"
echo ""
