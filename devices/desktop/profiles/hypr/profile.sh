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
    pkgs/cli/ftp
    pkgs/cli/fzf
    pkgs/cli/jq
    pkgs/cli/lesspipe
    pkgs/cli/lm-sensors
    pkgs/cli/lshw
    pkgs/cli/msmtp
    pkgs/cli/ripgrep
    pkgs/cli/smartmontools
    pkgs/cli/tealdeer
    pkgs/cli/tmux
    pkgs/cli/unzip
    pkgs/cli/wikiman

    pkgs/hardware/network-manager
    pkgs/hardware/bluetooth
    pkgs/hardware/pipewire
    pkgs/hardware/brightnessctl
    pkgs/hardware/acpi

    pkgs/security/fail2ban
    pkgs/security/firewalld
    pkgs/security/unbound
    pkgs/security/aide
    pkgs/security/rkhunter
    pkgs/security/logcheck

    pkgs/services/dbus

    drivers/graphics/init
    drivers/wayland

    pkgs/wm/hyprland
    pkgs/de/wl-clipboard
    pkgs/de/grim
    pkgs/de/slurp
    pkgs/de/gtk
    pkgs/de/hypridle
    pkgs/de/hyprlock
    pkgs/de/hyprpaper
    pkgs/de/hyprpicker
    pkgs/de/hyprsunset
    pkgs/de/quickshell
    pkgs/fonts/jetbrains
    pkgs/fonts/victor-mono
    pkgs/icons/breeze-icons
    pkgs/cursors/bibata

    pkgs/langs/node

    pkgs/apps/nvim
    pkgs/apps/yazi
    pkgs/apps/kitty
    pkgs/apps/wofi
    pkgs/apps/firefox
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

export needs_email=true
