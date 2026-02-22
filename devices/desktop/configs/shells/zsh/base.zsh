#=======================================================#
#      ____                     ______            ____  #
#     / __ )____ _________     / ____/___  ____  / __/  #
#    / __  / __ `/ ___/ _ \   / /   / __ \/ __ \/ /_    #
#   / /_/ / /_/ (__  )  __/  / /___/ /_/ / / / / __/    #
#  /_____/\__,_/____/\___/   \____/\____/_/ /_/_/       #
#                                                       #
#=======================================================#

# INFO: This will store the base zsh cofniguration,
# including: history, keybinds, startup commands, etc.

#=== DIR CHECKS ===#
if [[ ! -d "${XDG_CONFIG_HOME:-$HOME/.config}/zsh" ]]; then
    mkdir -p $(dirname "${$XDG_CONFIG_HOME:-$HOME/.config}/zsh")
elif [[ ! -d "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/oh-my-zsh" ]]; then
    echo -e "\e[1;33m!!! Oh My Zsh not installed. Installing now...\e[1;0m"
    ZSH="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

#=== ZCOMP DIR ===#
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

mkdir -p "$ZSH_CACHE_DIR"

export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump"

#=== HISTORY ===#
HISTSIZE=10000
HISTFILE="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh_history"
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#=== KEYBINDS ===#
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#=== PROMPT ===#
eval "$(starship init zsh)"

#=== OMZ ===#
export ZSH="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/oh-my-zsh"
export ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"

for entry in \
    "fzf-tab https://github.com/Aloxaf/fzf-tab" \
    "zsh-vi-mode https://github.com/jeffreytse/zsh-vi-mode" \
    "zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting" \
    "zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions" \
    "zsh-completions https://github.com/zsh-users/zsh-completions"; do

    read -r plugin url <<< "$entry"

    [[ -d "$ZSH_CUSTOM/plugins/$plugin" ]] || git clone "$url" "$ZSH_CUSTOM/plugins/$plugin"
done

plugins=(
    sudo
    copybuffer
    copyfile
    dirhistory
    fzf-tab
    zsh-vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
)
fpath+="$ZSH_CUSTOM/plugins/zsh-completions/src"

source $ZSH/oh-my-zsh.sh

#=== MISC ===#
# case insensitive completion
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"


#========================================#
#       ___    ___                       #
#      /   |  / (_)___ _________  _____  #
#     / /| | / / / __ `/ ___/ _ \/ ___/  #
#    / ___ |/ / / /_/ (__  )  __(__  )   #
#   /_/  |_/_/_/\__,_/____/\___/____/    #
#                                        #
#========================================#
                                   
# INFO: Store your aliases here. These starters
# have been categorized but feel free to break this

#=== APPS ===#
alias c="clear"
alias ff="fastfetch"
alias fe="yazi"
alias v="nvim"
alias wifi="nmtui"
alias ai="aider --model ollama_chat/qwen2.5-coder:14b --weak-model ollama_chat/llama3.2:latest --dark-mode --no-auto-commits --pretty --stream"

#=== PKG MANAGEMENT ===#
# TODO: Update with emerge shortcuts

alias compile-kernel="make && make modules_install && make install"

#=== COMMANDS ===#
alias ls="eza -a --icons"
alias ll="eza -al --icons"
alias lt="eza -a --tree --level=1 --icons"

#=== GIT ===#
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"
alias gg="lazygit"


#======================================================================#
#       ______           _                                       __    #
#      / ____/___ _   __(_)________  ____  ____ ___  ___  ____  / /_   #
#     / __/ / __ \ | / / / ___/ __ \/ __ \/ __ `__ \/ _ \/ __ \/ __/   #
#    / /___/ / / / |/ / / /  / /_/ / / / / / / / / /  __/ / / / /_     #
#   /_____/_/ /_/|___/_/_/   \____/_/ /_/_/ /_/ /_/\___/_/ /_/\__/     #
#                                                                      #
#======================================================================#

# INFO: Extra environment variables to be used within the shell

#=== NVIM MANPAGER ===#
export MANPAGER='nvim +Man!'

#=== FIREFOX + WAYLAND ===#
export MOZ_ENABLE_WAYLAND=1

#=== ADD GO BINARIES ===#
export PATH="$PATH:$HOME/go/bin"

#=== ADD RUST BINARIES ===#
export PATH="$PATH:$HOME/.cargo/bin"

#=== NVM ===#
export NVM_DIR="$HOME/.config/nvm"

#---------------ensure node version is present in path for LSPs

# WARN: should be updated to latest version
version="v25.1.0"
node_path="$NVM_DIR/versions/node/$version"
if [[ ! -d "$node_path" ]]; then
    echo "Required node version ($version) not installed."
    echo "Loading nvm..."
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" >/dev/null 2>&1
    echo "Installing now..."
    nvm install "$version"
fi
export PATH="$node_path/bin:$PATH"

#---------------lazy-load NVM for interactive and remove custom functions
lazy_nvm() {
  echo "Setting up nvm..."
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" >/dev/null 2>&1
}

nvm()  { lazy_nvm; nvm "$@"; }
node() { lazy_nvm; node "$@"; }
npm()  { lazy_nvm; npm "$@"; }
npx()  { lazy_nvm; npx "$@"; }


#============================#
#        ______      ____    #
#       / ____/___  / __/    #
#      / /_  /_  / / /_      #
#     / __/   / /_/ __/      #
#    /_/     /___/_/         #
#                            #
#============================#

# INFO: Used to configure Fzf, including menu options
# and tab completion sources

#=== BASE ===#
eval "$(fzf --zsh)"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:*" use-fzf-default-opts yes

# Reapply fzf bindings after zsh-vi-mode resets keymaps
autoload -Uz add-zsh-hook

_zvm_after_init_fzf_binds() {
  if typeset -f fzf-history-widget >/dev/null; then
    bindkey -M vicmd '^R' fzf-history-widget
    bindkey -M viins '^R' fzf-history-widget
  fi
}

# Run it after zsh-vi-mode finishes initialization
add-zsh-hook precmd _zvm_after_init_fzf_binds

# dynamic theme switching
update_fzf_theme() {
    case "$SYSTEM_THEME" in
        "echelon")
            export FZF_DEFAULT_OPTS='
            --color=fg+:#f8f8fb,bg+:#45475b
            --color=hl:#b4befe,hl+:#94e2d5,info:#f5e0dc,marker:#f38ba8
            --color=prompt:#b4befe,spinner:#94e2d5,pointer:#b4befe,header:#f5c2e7
            --color=border:#404040,label:#aeaeae,query:#f8f8fb
            --border="rounded" --preview-window="border-rounded"
            --prompt=" " --marker=""
            --separator="─" --scrollbar="│" --info="right"'
            ;;
        *)
            export FZF_DEFAULT_OPTS='
            --border="rounded" --preview-window="border-rounded"
            --prompt=" " --marker=""
            --separator="─" --scrollbar="│" --info="right"'
            ;;

    esac
}
# SYSTEM_THEME=$(cat "$HOME/.system-theme")
# update_fzf_theme

#=== FZF PREVIEWS ===#

# Directories
zstyle ":fzf-tab:complete:cd:*" fzf-preview 'eza -1 --color=always $realpath'

# Service status
# zstyle ":fzf-tab:complete:rc-service:*" fzf-preview 'rc-service $word status'

# File content
zstyle ":fzf-tab:complete:*:*" fzf-preview 'less $realpath'
export LESSOPEN="|$HOME/scripts/lessfilter.sh %s"
zstyle ":fzf-tab:complete:*:options" fzf-preview 
zstyle ":fzf-tab:complete:*:argument-1" fzf-preview

# Env vars
zstyle ":fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*" \
fzf-preview 'echo ${(P)word}'

# Dynamic man pages for commands
zstyle ":fzf-tab:complete:-command-:*" fzf-preview \
'(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'


#=================================================#
#   _    ___              __  ___          __     #
#  | |  / (_)___ ___     /  |/  /___  ____/ /__   #
#  | | / / / __ `__ \   / /|_/ / __ \/ __  / _ \  #
#  | |/ / / / / / / /  / /  / / /_/ / /_/ /  __/  #
#  |___/_/_/ /_/ /_/  /_/  /_/\____/\__,_/\___/   #
#                                                 #
#=================================================#

# INFO: This adds support for extensive vi mode editing
# using the zsh-vi-mode plugin.


export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK        
export ZVM_KEYTIMEOUT=0
export ZVM_VI_HIGHLIGHT_BACKGROUND=#45475b
