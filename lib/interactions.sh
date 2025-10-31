#!/bin/bash

#===========================================================#
#    This file stores all interaction specific functions    #
#     When called within the main scirpt the following      #
#      functions will be sourced and used throughout        #
#===========================================================#

# a simple greeter for the script
greet(){
    $gum style --align "center" \
    "Hello and welcome to..." \
     '
        ________            ______                    
       /_  __/ /_  ___     / ____/___  _________ ____ 
        / / / __ \/ _ \   / /_  / __ \/ ___/ __ `/ _ \
       / / / / / /  __/  / __/ / /_/ / /  / /_/ /  __/
      /_/ /_/ /_/\___/  /_/    \____/_/   \__, /\___/ 
                                         /____/       
                                  by paradoxical-dev
     '
    sleep 0.5
}

# prompt the user for confirmation of a given option
# ---
# @param {string} header prompt
gum_confirm() {
    local header="$1"
    
    $gum confirm "$header" \
    --selected.background "#0fe" \
    --prompt.foreground "#0fe"
}

# returns users typed input
# ---
# @param {string} prompt for the user
# @param {string} guide text for the user
input() {
    local header="$1"
    local placeholder="$2"

    $gum input --header "$header" --placeholder "$placeholder" \
    --header.foreground "#0fe" --prompt.foreground "#0fe" \
    --cursor.foreground "#fff"
}

# pretty formatted messages
# ---
# @param {string | list} the message to be displayed
inform_msg() {
    $gum style --border "rounded" --border-foreground "#0fe" \
    --align "center" --width 50 --margin "1 2" --padding "2 4" \
    "$@"
}

# allow single selection of given options
# ---
# @param {string} header prompt
# @param {list} list of choices
choose_one() {
    local header="$1"
    shift 1
    local choices=("$@")

    $gum choose --cursor.foreground "#0fe" \
    --selected.foreground "#0fe" --header.foreground "#f0e" \
    --header="$header" "${choices[@]}"
}

# allow multiple selections of given options
# ---
# @param {string} header prompt
# @param {function | command} callback for selections
# @param {list} list of choices
choose_multi() {
    local header="$1"
    shift 1
    local choices=("$@")

    $gum choose --cursor.foreground "#0fe" \
    --selected.foreground "#0fe" --header.foreground "#f0e" \
    --header="$header" --no-limit "${choices[@]}"
}

export -f greet
export -f gum_confirm
export -f input
export -f inform_msg
export -f choose_one
export -f choose_multi
