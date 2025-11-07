#!/bin/bash

set -e

echo "Installing acpi..."
echo ""

install_pkg "acpi" "sys-power/acpi"
echo ""

echo "Installing SELinux shutdown policy..."
echo ""

install_pkg "selinux-shutdown" "sec-policy/selinux-shutdown"
echo ""

echo "Starting acpid serivce and adding to default..."
echo ""

sudo rc-service acpid start
sudo rc-update add acpid default
echo ""
