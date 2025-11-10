#!/bin/bash

set -e

echo "Installing ftp..."
echo ""

install_pkg "ftp" "net-ftp/ftp"
echo ""

install_pkg "lftp" "net-ftp/lftp"
echo ""
