#!/bin/bash

set -e

echo "Installing logcheck..."
echo ""

edit_use "logcheck" "app-admin/logcheck" "cron"

install_pkg "logcheck" "app-admin/logcheck"
echo ""

echo "Copying updated config for syslog-ng..."
echo ""

CONFIG_PATH="/etc/syslog-ng/syslog-ng.conf"
DOTFILE_PATH="$DEVICE_DIR/configs/syslog-ng/syslog-ng.conf"

backup_config "$CONFIG_PATH" true

sudo mkdir -p $(dirname "$CONFIG_PATH")

sudo cp "$DOTFILE_PATH" "$CONFIG_PATH"

sudo chown root:root "$CONFIG_PATH"
sudo chmod 600 "$CONFIG_PATH"

echo -e "${green}syslog-ng config copied into /etc/syslog-ng/syslog-ng.conf${color_end}"
echo ""

echo "Restarting syslog-ng..."
echo ""

sudo /etc/init.d/syslog-ng reload
echo ""

echo "Installing syslog-summary..."
echo ""

install_pkg "syslog-summary" "app-admin/syslog-summary"
echo ""

echo "Copying config for logcheck..."
echo ""

CONFIG_PATH="/etc/logcheck/logcheck.conf"
DOTFILE_PATH="$DEVICE_DIR/configs/logcheck/logcheck.conf"

backup_config "$CONFIG_PATH" true

sudo mkdir -p $(dirname "$CONFIG_PATH")

if [[ "$USER_EMAIL" ]]; then
    email="$USER_EMAIL"
else
    email=$(input "Email address (used to send findings)" "you@example.com")
fi
sed -e "s/{{EMAIL}}/$email/" "$DOTFILE_PATH" | sudo tee "$CONFIG_PATH" >/dev/null

sudo chown root:logcheck "$CONFIG_PATH"
sudo chmod 640 "$CONFIG_PATH"

echo -e "${green}logcheck config copied into /etc/logcheck/logcheck.conf${color_end}"
echo ""

echo "Adding CRON job..."
echo ""

sudo -u logcheck touch /etc/logcheck/cron-logcheck-enabled

echo -e "${green}logcheck initialized successfully!${color_end}"
