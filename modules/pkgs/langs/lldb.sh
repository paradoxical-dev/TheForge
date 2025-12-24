#!/bin/bash

set -e

echo "Installing lldb..."
echo ""

unmask_pkg "lldb-mi" "dev-debug/lldb-mi" "~amd64"
echo ""

install_pkg "lldb-mi" "dev-debug/lldb-mi"
echo ""