#!/bin/bash

set -e

echo "Installing carnage..."
echo ""

unmask_pkg "carnage" "app-portage/carnage" "~amd64"
unmask_pkg "msgpack" "dev-python/msgpack" "~amd64"
unmask_pkg "textual" "dev-python/textual" "~amd64"

install_pkg "carnage" "app-portage/carnage"
echo ""

echo "Installing eix..."
echo ""

install_pkg "eix" "app-portage/eix"
echo ""
