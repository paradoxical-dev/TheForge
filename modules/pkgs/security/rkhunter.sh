#!/bin/bash

set -e

echo "Installing rkhunter..."
echo ""

install_pkg "rkhunter" "app-forensics/rkhunter"
echo ""

echo "Copying config for rkhunter..."
echo ""

CONFIG_PATH="/etc/rkhunter.d/rkhunter.conf"
DOTFILE_PATH="$DEVICE_DIR/configs/rkhunter/rkhunter.conf"

backup_config "$CONFIG_PATH" true

sudo mkdir -p $(dirname "$CONFIG_PATH")


if [[ "$USER_EMAIL" ]]; then
    email="$USER_EMAIL"
else
    email=$(input "Email address (used to send findings)" "you@example.com")
fi
sed -e "s/{{EMAIL}}/$email/" "$DOTFILE_PATH" | sudo tee "$CONFIG_PATH" >/dev/null

echo "Checking config file..."
echo ""

sudo rkhunter -C

echo -e "${green}rkhunter config copied into /etc/rkhunter.d/rkhunter.conf${color_end}"
echo ""

echo "Adding CRON job..."
echo ""

SCRIPT_DIR=$(dirname "$DOTFILE_PATH")
sudo cp "$SCRIPT_DIR/rkhunter-check.sh" "/etc/cron.daily/rkhunter-check"
sudo chmod +x "/etc/cron.daily/rkhunter-check"

echo -e "${green}rkhunter initialized successfully!${color_end}"
echo ""
