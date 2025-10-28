#!/bin/bash

set -e

echo "Installing unbound..."
echo ""

install_pkg "unbound" "net-dns/unbound"
echo ""

echo "Creating unbound anchor..."
echo ""

sudo mkdir -p /etc/unbound
sudo chown unbound:unbound /etc/unbound/
sudo unbound-anchor -a /etc/unbound/dnssec-trust-anchors.key
echo ""

echo "Copying config for unbound..."
echo ""

CONFIG_PATH="/etc/unbound/unbound.conf"
DOTFILE_PATH="$DEVICE_DIR/configs/unbound/unbound.conf"

backup_config "$CONFIG_PATH" true

sudo mkdir -p $(dirname "$CONFIG_PATH")

sudo cp "$DOTFILE_PATH" "$CONFIG_PATH"
sudo chown root:root "$CONFIG_PATH"
sudo chmod 644 "$CONFIG_PATH"

echo -e "${green}unbound config copied into /etc/unbound/unbound.conf${color_end}"
echo ""

echo "Creating unbound directories..."
echo ""

sudo mkdir -p "/var/lib/unbound"
sudo chown unbound:unbound "/var/lib/unbound"
sudo mkdir -p "/var/run/unbound"
sudo chown unbound:unbound "/var/run/unbound"

echo "Starting unbound service and adding to default..."
echo ""

sudo rc-service unbound start
sudo rc-update add unbound default
echo ""

echo "Installing bind-tools..."
echo ""

install_pkg "bind-tools" "net-dns/bind-tools"
echo ""
