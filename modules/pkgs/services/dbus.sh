#!/bin/bash

set -e

echo "Installing dbus..."
echo ""

install_pkg "dbus" "sys-apps/dbus"
echo ""

# echo "Starting dbus service and adding to default..."
# echo ""

# sudo rc-service dbus start
# sudo rc-update add dbus default
# echo ""
