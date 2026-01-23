#!/bin/bash

set -e

echo "Installing go..."
echo ""

install_pkg "go" "dev-lang/go"
echo ""

echo "Installing gopls..."
echo ""

install_pkg "gopls" "dev-lang/gopls"
echo ""

echo "Installing gomodifytags..."
echo ""

go install github.com/fatih/gomodifytags@latest
echo ""

echo "Installing gotests..."
echo ""

go install github.com/cweill/gotests/gotests@latest
echo ""

echo "Installing gore..."
echo ""

go install github.com/x-motemen/gore/cmd/gore@latest
echo ""
