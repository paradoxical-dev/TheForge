#!/bin/bash

set -e

echo "Installing quickshell..."
echo ""

unmask_pkg "quickshell" "gui-apps/quickshell" "~amd64"
unmask_pkg "breakpad" "dev-util/breakpad" "~amd64"
unmask_pkg "linux-syscall-support" "dev-libs/linux-syscall-support" "~amd64"
unmask_pkg "libdisasm" "dev-embedded/libdisasm" "~amd64"

install_pkg "quickshell" "gui-apps/quickshell"
echo ""
