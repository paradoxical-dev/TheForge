#!/bin/bash

set -e

echo "Installing shellcheck..."
echo ""

unmask_pkg "shellcheck" "dev-util/shellcheck" "~amd64"
echo ""

install_pkg "shellcheck" "dev-util/shellcheck"
echo ""
