#!/bin/bash

set -e

# WARNING: Refer to the webull section of this directories README before
# adding this to your profile.

echo "Copying files into $HOME/src/webull..."
echo ""

if [[ ! -d "$HOME/src/webull" ]]; then
    mkdir -p "$HOME/src/webull"
fi

CONF_DIR="$DEVICE_DIR/configs/webull"
DEST="$HOME/src/webull"

cp "$CONF_DIR/Dockerfile" "$DEST/Dockerfile"
cp "$CONF_DIR/launch_webull.sh" "$DEST/launch_webull.sh"

chmod +x "$DEST/launch_webull.sh"
cp "$DEST/launch_webull.sh" "$HOME/.local/bin/webull-docker"

cp "$CONF_DIR/webull.png" "$HOME/.local/share/icons/webull.png"

echo "Creating webull directories..."
echo ""

mkdir -p "$HOME/.local/share/Webull Desktop/Webull Desktop/log"
mkdir -p "$HOME/.config/Webull Desktop/Webull Desktop"

echo "Building webull container..."
echo ""

docker build -t webull:latest "$HOME/src/webull"
echo ""

echo -e "${green}Webull container built successfully!${color_end}"
echo ""

echo "Creating .desktop entry for webull..."
echo ""

tee "$HOME/.local/share/applications/webull-docker.desktop" >/dev/null <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Webull Desktop (Docker)
Comment=Launch Webull Desktop inside Docker
Exec=$HOME/.local/bin/webull-docker
Icon=$HOME/.local/share/icons/webull.png
Terminal=false
Categories=Finance;Network;
StartupNotify=true
EOF

update-desktop-database "$HOME/.local/share/applications"
echo ""

echo -e "${green}Webull desktop installed successfully!${color_end}"
echo ""
