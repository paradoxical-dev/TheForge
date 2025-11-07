#!/bin/bash

set -e

echo "Installing GTK..."
echo ""

install_pkg "gtk+" "x11-libs/gtk+"
echo ""

install_pkg "gtk" "gui-libs/gtk"
echo ""

echo "Copying config for GTK 2.0..."
echo ""

CONFIG_PATH="$HOME/.gtkrc-2.0"
DOTFILE_PATH="$DEVICE_DIR/configs/gtk/gtk-2.0/main"

backup_config "$CONFIG_PATH"

cp "$DOTFILE_PATH" "$CONFIG_PATH"

echo -e "${green}GTK 2.0 config copied into $CONFIG_PATH${color_end}"
echo ""

echo "Copying config for GTK 3.0..."
echo ""

CONFIG_PATH="$HOME/.config/gtk-3.0/settings.ini"
DOTFILE_PATH="$DEVICE_DIR/configs/gtk/gtk-3.0/main.ini"

backup_config "$CONFIG_PATH"

cp "$DOTFILE_PATH" "$CONFIG_PATH"

echo -e "${green}GTK 3.0 config copied into $CONFIG_PATH${color_end}"
echo ""

echo "Copying config for GTK 4.0..."
echo ""

CONFIG_PATH="$HOME/.config/gtk-4.0/settings.ini"
DOTFILE_PATH="$DEVICE_DIR/configs/gtk/gtk-4.0/main.ini"

backup_config "$CONFIG_PATH"

cp "$DOTFILE_PATH" "$CONFIG_PATH"

echo -e "${green}GTK 4.0 config copied into $CONFIG_PATH${color_end}"
echo ""

echo "Unpacking GTK themes..."
echo ""

THEME_DEST="$HOME/.themes"
mkdir -p "$THEME_DEST"

count=0
for theme in "$DEVICE_DIR/configs/gtk/themes/"*; do
    theme_name=$(basename "${theme%.tar.*}")
    if [[ -d "$THEME_DEST/$theme_name" ]]; then
        echo -e "${yellow}Theme '$theme_name' already exists. Skipping...${color_end}"
        continue
    fi

    echo "Unpacking $(basename $theme)..."
    tar -xvf "$theme" -C "$THEME_DEST" >/dev/null
    count=$((count + 1))
done

echo "$count GTK themes unpacked into $THEME_DEST"
echo ""
