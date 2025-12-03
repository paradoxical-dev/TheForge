#!/bin/bash

set -e

echo "Installing lazydocker..."
echo ""

echo -e "${yellow}No ebuild present for lazydocker. Installing from source...${color_end}"
echo ""

go install github.com/jesseduffield/lazydocker@latest
echo ""