#!/bin/bash

set -e

echo "Installing power-profiles-daemon..."
echo ""

install_pkg "power-profiles-daemon" "sys-power/power-profiles-daemon"
echo ""

echo "Starting power-profiles-daemon service and adding to default..."
echo ""

sudo rc-service power-profiles-daemon start
sudo rc-update add power-profiles-daemon default
echo ""
