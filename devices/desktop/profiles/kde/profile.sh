#!/bin/bash

include_modules=(
    pkgs/shells/zsh
    pkgs/shells/nushell

    pkgs/cli/bat
    pkgs/cli/bc
    pkgs/cli/bottom
    pkgs/cli/carnage
    pkgs/cli/cava
    pkgs/cli/chafa
    pkgs/cli/ddgr
    pkgs/cli/exiftool
    pkgs/cli/eza
    pkgs/cli/fastfetch
    pkgs/cli/fd
    pkgs/cli/figlet
    pkgs/cli/file
    pkgs/cli/ftp
    pkgs/cli/fzf
    pkgs/cli/gowall
    pkgs/cli/jiq
    pkgs/cli/jless
    pkgs/cli/jq
    pkgs/cli/lazydocker
    pkgs/cli/lesspipe
    pkgs/cli/lm-sensors
    pkgs/cli/lshw
    pkgs/cli/matugen
    pkgs/cli/msmtp
    pkgs/cli/ripgrep
    pkgs/cli/smartmontools
    pkgs/cli/tealdeer
    pkgs/cli/tmux
    pkgs/cli/unzip
    pkgs/cli/wikiman
    
    pkgs/hardware/acpi
    pkgs/hardware/bluetooth
    pkgs/hardware/brightnessctl
    pkgs/hardware/network-manager
    pkgs/hardware/pipewire
    
    pkgs/security/aide
    pkgs/security/fail2ban
    pkgs/security/firewalld
    pkgs/security/logcheck
    pkgs/security/rkhunter
    pkgs/security/unbound

    pkgs/services/dbus

    drivers/graphics/init
    drivers/wayland

    pkgs/fonts/jetbrains
    pkgs/fonts/victor-mono
    pkgs/icons/breeze-icons
    pkgs/cursors/bibata

    pkgs/langs/node
    pkgs/langs/gdb
    pkgs/langs/hyprls
    pkgs/langs/lldb

    pkgs/apps/docker
    pkgs/apps/firefox
    pkgs/apps/kitty
    pkgs/apps/nvim
    pkgs/apps/obsidian
    pkgs/apps/vscodium
    pkgs/apps/yazi
)

run_profile() {
    for module in "${include_modules[@]}"; do
        sleep 1
        "$REPO_DIR/modules/$module.sh"
    done

    if [ $LAPTOP -eq 1 ]; then
        echo -e "${yellow}Laptop installation detected!${color_end}"
        echo ""

        "$REPO_DIR/modules/pkgs/hardware/ppd.sh"
    fi
}

export needs_email_true