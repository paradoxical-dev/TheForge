# TODO: Need to make most app configurations sym-linked
# This is to remove the need to manually sync when updating

# TODO: Refactor to support systemd

#==============================#
#            SETUP             # 
#==============================# 

#---------------global vars/functions 

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

#----------opts 

PROFILE="" 
PROFILE_DIR="" 
LAPTOP=1
while [[ $# -gt 0 ]]; do 
    case "$1" in 
        --help) 
            echo "Usage: ./deploy.sh [OPTIONS]" 
            echo "" 
            echo "Options:" 
            echo " --profile <name>    Specify the profile to use (e.g., desktop/hypr, server/minimal)." 
            echo " --laptop            Installs laptop specific packages for power management" 
            echo " --list-profiles     List available profiles by category and exit." 
            echo " --help              Show this help message and exit." 
            echo "" 
            echo "Examples:" 
            echo " .dotfiles/deploy.sh --profile desktop/hypr" 
            echo " ./deploy.sh --list-profiles" 
            exit 0
        ;;
        --list-profiles) 
            echo "Desktop:" 
            echo " Hyprland   (desktop/hypr)" 
            echo " Minimal    (desktop/minimal)" 
            echo " GNOME      (desktop/gnome)" 
            echo " KDE        (desktop/kde)" 
            echo " " 
            echo "Server:" 
            echo " " 
            echo "Raspberry Pi:" 
            echo " " 
            exit 0 
        ;; 
        --profile) 
            PROFILE="$2" 
            shift 2 
        ;; 
        --laptop)
            LAPTOP=1
            shift 1
        ;;
        *) 
            echo "Unknown option: $1" 
            exit 1 
        ;; 
    esac 
done 

#-----handle opts 

export REPO_DIR=$REPO_DIR
export DEVICE=$(echo "$PROFILE" | cut -d'/' -f1) 
export DEVICE_DIR="$REPO_DIR/devices/$DEVICE"
export PROFILE=$(echo "$PROFILE" | cut -d'/' -f2) 
export PROFILE_DIR="$REPO_DIR/devices/$DEVICE/profiles/$PROFILE" 
export LAPTOP=$LAPTOP

#----------colors 

red="\e[1;31m" 
green="\e[1;32m" 
yellow="\e[1;33m" 
blue="\e[1;34m" 
magenta="\e[1;1;35m" 
cyan="\e[1;36m" 
orange="\e[1;38;5;214m" 
end="\e[1;0m" 

export red=$red 
export green=$green 
export yellow=$yellow 
export blue=$blue 
export magenta=$magenta 
export cyan=$cyan 
export orange=$orange 
export color_end=$end 

#----------source helper functions 

for script in "$REPO_DIR/lib/"*; do 
    source "$script" 
done 

#---------------handle dependancies 

$REPO_DIR/base/gum.sh 
export gum="$HOME/go/bin/gum" 

greet 

$REPO_DIR/base/git.sh 
$REPO_DIR/base/guru.sh 

#===============================# 
#          MAIN SCRIPT          # 
#===============================# 

echo ""
echo -e "Beginning configuration of your machine..."
echo ""

echo "Sourcing profile $DEVICE/$PROFILE"
echo ""

source "$PROFILE_DIR/profile.sh"

if [[ "$needs_email" == true ]]; then
    inform_msg "Email is required for current profile!" "(Will still need to be input if msmtp is to be configured)"
    sleep 1
    USER_EMAIL=$(input "Your email" "you@example.com")
    export USER_EMAIL=$USER_EMAIL
fi

run_profile

# TODO: move to specific profiles
cp "$REPO_DIR/wallpapers/main.jpg" "$HOME/.current_wallpaper"

echo -e "${green}Install complete!${color_end}"
echo ""
