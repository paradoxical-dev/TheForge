#!/bin/bash

# INFO: Checks for gum installation and installs using go if necessary

if [[ ! -e $HOME/go/bin/gum ]]; then
    echo -e "${yellow}gum is required to run this script${color_end}"
    echo "Installing now..."
    echo -e "\n"
    if ! pkg_exists "go"; then
        echo "${teal}No go version found. Emerging latest version...${color_end}"
        sudo emerge --noreplace "dev-lang/go"
    fi
    go install "github.com/charmbracelet/gum@latest"
    echo -e "\n"
fi
