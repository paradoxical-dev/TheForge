#!/bin/bash

set -e

echo "Installing jless..."
echo ""

install_pkg "rust-bin" "dev-lang/rust-bin"
echo ""

cargo install jless
echo ""