#!/bin/bash

echo "Installing dua-cli..."
echo ""

pkg_install "rust-bin" "dev-lang/rust-bin"
echo ""

cargo install dua-cli
echo ""