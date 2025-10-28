#!/bin/bash

set -e

echo "Installing firewalld..."
echo ""

edit_use "firewalld" "net-firewall/firewalld" "gui"

edit_use "nftables" "net-firewall/nftables" "json python xtables"

install_pkg "firewalld" "net-firewall/firewalld"
echo ""

echo "Starting firewalld service and adding to default..."
echo ""

sudo rc-service firewalld start
sudo rc-update add firewalld default
echo ""

echo "Configuring firewalld..."
echo ""

sudo firewall-cmd --set-default-zone=public
sudo firewall-cmd --permanent --zone=public --add-service=ssh
sudo firewall-cmd --reload
echo ""
