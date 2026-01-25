#!/bin/bash

set -e

echo "Installing rust..."
echo ""

edit_use "rust-bin" "dev-lang/rust-bin" "rust-analyzer rust-src rustfmt"

unmask_pkg "rust-bin" "dev-lang/rust-bin" "~amd64"
echo ""

install_pkg "rust-bin" "dev-lang/rust-bin"
echo ""
