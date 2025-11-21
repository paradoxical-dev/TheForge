#!/bin/bash

set -e

echo "Installing gowall..."
echo ""

echo -e "${yellow}No ebuild present for gowall. Building from source...${color_end}"
echo ""

if [[ ! -d "$HOME/src" ]]; then
    mkdir -p "$HOME/src"
fi

git clone https://github.com/Achno/gowall "$HOME/src/gowall"
echo ""
echo "Repo cloned into $HOME/src/gowall"
echo ""

cd "$HOME/src/gowall"
go build

echo "Copying binary to /usr/local/bin"
echo ""

sudo cp gowall "/usr/local/bin/"

echo -e "${green}gowall installed successfully!${color_end}"
echo ""
