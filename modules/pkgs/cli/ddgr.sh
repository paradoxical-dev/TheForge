#!/bin/bash

set -e

echo "No ebuild found for ddgr. Building from source..."
echo ""

if pkg_exists "ddgr"; then
    echo -e "${green}ddgr already installed!${color_end}"
    echo ""
    exit 0
fi

repo_url="https://github.com/jarun/ddgr"
clone_location="$HOME/src/ddgr"

if ! pkg_exists "python"; then
    echo "No python version detected. Emerging python..."
    install_pkg "python" "dev/lang-python"
    echo ""
fi

if [[ ! -d "$HOME/src" ]]; then
    echo "Creating $HOME/src directory..."
    mkdir -p "$HOME/src"
    echo ""
fi

echo "Cloning ddgr into $clone_location"
echo ""

git clone "$repo_url" "$clone_location"
echo ""

echo "Installing ddgr..."
echo ""

cd "$clone_location"
sudo make install
echo ""

echo -e "${green}ddgr installed successfully!${color_end}"
echo ""
