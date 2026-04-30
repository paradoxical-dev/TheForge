# base config
$env.config = {
    show_banner: false
    buffer_editor: "nvim"
    # buffer_editor: [
    #     "emacsclient"
    #     "-s"
    #     $"/tmp/emacs((id -u))/server"
    #     "-nw"
    # ]
    edit_mode: vi
    
    history: {
        file_format: sqlite
        max_size: 1_000_000
        sync_on_enter: true
        isolation: true
    }
}

# add custom scripts to PATH
$env.PATH ++= [($env.HOME | path join "scripts/bin")]

# add nix paths to PATH
$env.PATH ++= [
    "/nix/var/nix/profiles/default/bin"
    ($env.HOME | path join ".nix-profile/bin")
]

# add doom commands to PATH
$env.PATH ++= [($env.HOME | path join ".config/emacs/bin")]

# add .local/bin to PATH
$env.PATH ++= [($env.HOME | path join ".local/bin")]

# add go/bin to PATH
$env.PATH ++= [($env.HOME | path join "go/bin")]

# add .cargo/bin to PATH
$env.PATH ++= [($env.HOME | path join ".cargo/bin")]

#=== pyenv ===#
$env.PYENV_ROOT = "~/.pyenv" | path expand
if (( $"($env.PYENV_ROOT)/bin" | path type ) == "dir") {
  $env.PATH = $env.PATH | prepend $"($env.PYENV_ROOT)/bin" }
$env.PATH = $env.PATH | prepend $"(pyenv root)/shims"

# television support
mkdir ($nu.data-dir | path join "vendor/autoload")
tv init nu | save -f ($nu.data-dir | path join "vendor/autoload/tv.nu")

# carapace support
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"

source $"($nu.cache-dir)/carapace.nu"

# starship prompt
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
