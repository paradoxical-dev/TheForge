#!/bin/bash

include_modules=(
    pkgs/shells/zsh

    pkgs/cli/bat
    pkgs/cli/bc
    pkgs/cli/bottom
    pkgs/cli/chafa
    pkgs/cli/ddgr
    pkgs/cli/exiftool
    pkgs/cli/eza
    pkgs/cli/fastfetch
    pkgs/cli/fd
    pkgs/cli/figlet
    pkgs/cli/file
    pkgs/cli/fzf
    pkgs/cli/jq
    pkgs/cli/lesspipe
    pkgs/cli/lm-sensors
    pkgs/cli/lshw
    pkgs/cli/smartmontools
    pkgs/cli/tealdeer
    pkgs/cli/tmux
    pkgs/cli/wikiman

    pkgs/hardware/network-manager
    pkgs/hardware/bluetooth
    pkgs/hardware/pipewire

    pkgs/security/fail2ban
    pkgs/security/firewalld
    pkgs/security/unbound
    pkgs/cli/msmtp
    pkgs/security/aide

    pkgs/apps/nvim
    pkgs/apps/yazi
)

run_profile() {
    for module in "${include_modules[@]}"; do
        sleep 1
        "$REPO_DIR/modules/$module.sh"
    done
}
