#!/bin/bash

#=============================================================#
#  This file stores all functions deemed 'utility functions'  #
#     When called within the main scirpt the following        #
#      functions will be sourced and used throughout          #
#=============================================================#

# Query package list or command existance
# ---
# @param {string} command
pkg_exists() {
    qlist -I "$1" &> /dev/null || command -v "$1" &> /dev/null
}

# Unmasks a given package with given keyword(s)
# ---
# @param {string} package name
# @param {string} package repo
# @param {string} keywords
unmask_pkg() {
    local pkg_name=$1
    local pkg_repo=$2
    local keywords=$3

    echo -e "${green}Unmasking package $pkg_name with keyword(s) $keywords${color_end}"
    echo "$pkg_repo $keywords" | sudo tee "/etc/portage/package.accept_keywords/$pkg_name" > /dev/null
    echo -e "${green}$pkg_name has been unmaked and saved to /etc/portage/package.accept_keywords/$pkg_name${color_end}"
}

# Installs the given package if it does not exist
# ---
# @param {string} package name
# @param {string} package repo
install_pkg() {
    local pkg_name=$1
    local pkg_repo=$2

    if ! pkg_exists "$pkg_name"; then
        sudo emerge --noreplace --verbose "$pkg_repo"
        echo -e "${green}$pkg_name installed successfully!${color_end}"
    else
        echo -e "${green}$pkg_name already installed!${color_end}"
    fi
}

# Updates USE flags for the given package
# ---
# @param {string} package name
# @param {string} package repo
# @param {string} flags
edit_use () {
    local pkg_name=$1
    local pkg_repo=$2
    local flags=$3

    echo -e "${green}Updating $pkg_name USE flags ($flags)${color_end}"
    echo "$pkg_repo $flags" | sudo tee "/etc/portage/package.use/$pkg_name"
    echo -e "${green}$pkg_name USE flags updated and saved to /etc/portage/package.use/$pkg_name${color_end}"
}

# Move existing configs to .bak if present; removes old backups as well
# ---
# @param {string} target path
# @param {boolean} elevate privileges (optional)
backup_config() {
    local target=$1
    local use_sudo=${2:-false}

    local cmd_prefix=""
    if [[ "$use_sudo" == true ]]; then
        cmd_prefix="sudo"
    fi

    if [[ -e "$target" ]]; then
        if [[ -e "${target}.bak" ]]; then
            echo -e "${yellow}Backup already exists for $target. Removing old one...${color_end}"
            $cmd_prefix rm -rf "${target}.bak"
        fi

        echo -e "${yellow}$target already exists. Moving to .bak${color_end}"
        $cmd_prefix mv "$target" "${target}.bak"
        echo ""
    fi
}


export -f pkg_exists
export -f unmask_pkg
export -f install_pkg
export -f edit_use
export -f backup_config
