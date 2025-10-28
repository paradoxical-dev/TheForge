#!/bin/bash

set -e

echo "Installing bluez..."
echo ""

edit_use "bluez" "net-wireless/bluez" "-deprecated"
echo ""

install_pkg "bluez" "net-wireless/bluez"
echo ""


echo "Starting bluetooth service and adding to default..."
echo ""

sudo rc-service bluetooth start
sudo rc-update add bluetooth default
echo ""
