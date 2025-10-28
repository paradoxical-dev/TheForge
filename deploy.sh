#==============================#
#            SETUP             # 
#==============================# 

#---------------global vars/functions 

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

#----------opts 

PROFILE="" 
PROFILE_DIR="" 
while [[ $# -gt 0 ]]; do 
    case "$1" in 
        --help) 
            echo "Usage: ./deploy.sh [OPTIONS]" 
            echo "" 
            echo "Options:" 
            echo " --profile <name> Specify the profile to use (e.g., desktop/hypr, server/minimal)." 
            echo " --list-profiles List available profiles by category and exit." 
            echo " --help Show this help message and exit." 
            echo "" 
            echo "Examples:" 
            echo " .dotfiles/deploy.sh --profile desktop/hypr" 
            echo " ./deploy.sh --list-profiles" 
            exit 0
            ;;
        --list-profiles) 
            echo "Desktop:" 
            echo " Hyprland (desktop/hypr)" 
            echo " Minimal (desktop/minimal)" 
            echo " GNOME (desktop/gnome)" 
            echo " KDE (desktop/kde)" 
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
        *) 
            echo "Unknown option: $1" 
            exit 1 
            ;; 
    esac 
done 

#-----handle opts 

export DEVICE=$(echo "$PROFILE" | cut -d'/' -f1) 
export PROFILE=$(echo "$PROFILE" | cut -d'/' -f2) 
export PROFILE_DIR="$REPO_DIR/devices/$DEVICE/profiles/$PROFILE" 
echo $PROFILE_DIR 

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


