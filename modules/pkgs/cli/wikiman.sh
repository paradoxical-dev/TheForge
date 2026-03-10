#!/bin/bash

set -e

echo "No ebuild present for wikiman. Building from source..."
echo ""

repo_url="https://github.com/filiparag/wikiman"
clone_location="$HOME/src/wikiman"

if pkg_exists "wikiman"; then
    echo -e "${green}wikiman already installed!${color_end}"
    echo ""
    exit 0
fi

deps=(
    "man"
    "fzf"
    "ripgrep"
    "awk"
    "w3m"
    "coreutils"
    "parallel"
)

declare -A dep_name_map
dep_name_map["man"]="sys-apps/man-db"
dep_name_map["fzf"]="app-shells/fzf"
dep_name_map["ripgrep"]="sys-apps/ripgrep"
dep_name_map["awk"]="app-alternatives/awk"
dep_name_map["w3m"]="www-client/w3m"
dep_name_map["coreutils"]="sys-apps/coreutils"
dep_name_map["parallel"]="sys-process/parallel"

for pkg in "${deps[@]}"; do
    pkg_repo="${dep_name_map[$pkg]}"
    if ! pkg_exists "$pkg_repo"; then
        echo -e "${yellow}Dependancy $pkg not installed. Installing now..."
        install_pkg "$pkg" "$pkg_repo"
        echo ""
    fi
done

if [[ ! -d "$HOME/src" ]]; then
    echo "Creating $HOME/src directory..."
    mkdir -p "$HOME/src"
    echo ""
fi

echo "Cloning wikiman repo..."
echo ""

git clone "$repo_url" "$clone_location"
echo ""

echo "Installing wikiman..."
echo ""

cd "$clone_location"
sudo make all && sudo make install
echo ""

echo -e "${green}wikiman installed successfully!${color_end}"
echo ""

echo "Installing wikiman sources (arch, gentoo, tldr)..."
echo ""

# curl -L 'https://raw.githubusercontent.com/filiparag/wikiman/master/Makefile' -o 'wikiman-makefile'

make source-gentoo && make source-arch && make source-tldr
echo ""

echo "Finalizing wikiman sources..."
echo ""

sudo make source-install
echo ""

echo -e "${green}wikiman sources installed successfully!${color_end}"
echo ""
