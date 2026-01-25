#!/bin/bash

set -e

echo "Installing kernel-hardening-checker..."
echo ""

unmask_pkg "kernel-hardening-checker" "app-admin/kernel-hardening-checker" "~amd64"
echo ""

install_pkg "kernel-hardening-checker" "app-admin/kernel-hardening-checker"
echo ""
