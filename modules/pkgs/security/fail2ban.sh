#!/bin/bash

set -e

echo "Installing fail2ban..."
echo ""

install_pkg "fail2ban" "net-analyzer/fail2ban"
echo ""

echo "Creating jail.d directory in /etc/fail2ban..."
echo ""

if [[ ! -d "/etc/fail2ban/jail.d" ]]; then
    sudo mkdir /etc/fail2ban/jail.d
else
    echo -e "${green}Directory /etc/fail2ban/jail.d already exists!${color_end}"
    echo ""
fi

echo "Copying config for fail2ban..."
echo ""

CONFIG_PATH="/etc/fail2ban/jail.local"
DOTFILE_PATH="$DEVICE_DIR/configs/fail2ban/jail.local"

backup_config "$CONFIG_PATH" true

sudo mkdir -p $(dirname "$CONFIG_PATH")

sudo cp "$DOTFILE_PATH" "$CONFIG_PATH"
sudo chown root:root "$CONFIG_PATH"
sudo chmod 644 "$CONFIG_PATH"

echo -e "${green}fail2ban config copied into /etc/fail2ban/jail.local${color_end}"
echo ""

echo "Copying jails into /etc/fail2ban/jail.d..."
echo ""

JAILS_SRC="$DEVICE_DIR/configs/fail2ban/jails"
JAILS_DEST="/etc/fail2ban/jail.d"

if [[ -d "$JAILS_SRC" ]]; then
    sudo cp "$JAILS_SRC/"* "$JAILS_DEST/"
    echo -e "${green}Jails copied into /etc/fail2ban/jail.d${color_end}"
else
    echo -e "${yellow}Warning: no jails found at $JAILS_SRC — skipping.${color_end}"
fi
echo ""

echo "Starting fail2ban service and adding to default..."
echo ""

# sudo rc-service fail2ban start
# sudo rc-update add fail2ban default
echo ""
