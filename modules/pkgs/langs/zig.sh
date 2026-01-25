#!/bin/bash

set -e

echo "Installing zig..."
echo ""

install_pkg "zig" "dev-lang/zig-bin"
echo ""

echo "Installing zls..."
echo ""

unmask_pkg "zls" "dev-zig/zls" "~amd64"
echo ""

install_pkg "zls" "dev-zig/zls"
echo ""
