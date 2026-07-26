#################
# Initial stuff #
#################

# Path
# ----

# Add bin dirs to path
fish_add_path $HOME/bin $HOME/.local/bin/ /usr/local/bin

# Add ccache to path
fish_add_path /usr/lib/ccache/bin

# Add cargo/bin to path
fish_add_path ~/.cargo/bin/

# Add npm global to path
fish_add_path ~/.npm-global/bin

# Inits
# -----

# Mise
mise activate fish | source

# Pez
pez activate fish | source

# fzf
fzf --fish | source

# opam
# Load OPAM environment if the init file exists
if test -f ~/.opam/opam-init/init.fish
    source ~/.opam/opam-init/init.fish >/dev/null 2>/dev/null
end

###############
# Fish config #
###############

# Disable welcome message
set fish_greeting

# Enable vi keybindings
set -g fish_key_bindings fish_vi_key_bindings

# Bind fzf directory search to ctrl+v
bind \cv fzf-cd-widget
bind -M insert \cv fzf-cd-widget

# Bindings for accepting autosuggestions
bind -M insert \ce accept-autosuggestion
bind -M insert \cf forward-word

##############
# Aesthetics #
##############

############
# Env vars #
############

# ============
# Default apps
# ============

set -gx EDITOR nvim
set -gx PAGER "bat -p --theme ansi"
# set -gx PAGER less

# ===========
# Programming
# ===========

# go
# --

set -gx GOPATH ~/.go
fish_add_path ~/.go/bin/

# ============
# App specific
# ============

# Steam
# -----

# Make it so that steam closes to the tray
set -gx STEAM_FRAME_FORCE_CLOSE 1

# Fzf
# ---

# Set rg as the default source for fzf
set -gx FZF_DEFAULT_COMMAND "rg --files --no-ignore --hidden --follow -g '!.{git,__py*}/*' 2> /dev/null"

# ctrl+t
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# set options for ctrl+t
set -gx FZF_CTRL_T_OPTS "
  --preview 'bat -n --color=always {}'
  --preview-window hidden
  --bind '?:toggle-preview'
  --header '?: toggle file preview'"

# alt+c
set -gx FZF_ALT_C_COMMAND "fd -t d --no-ignore -HL -E "{.git,__py*}" -E node_modules -E vendor"

# Set default options for the fzf app that apply to all modes
set -gx FZF_DEFAULT_OPTS "-i -m --reverse --border"

# eza
# ---

# Make it so that icons are always displayed
set -gx EZA_ICONS_AUTO 1

#################
# Abbreviations #
#################

# General
abbr -a q exit

# Arch
abbr -a pacman "pacman --color auto"
abbr -a yay "yay -a"

# Applications
abbr -a vim nvim
abbr -a ls eza
abbr -a grep "grep --color=auto"
abbr -a greP "grep -P"
abbr -a cat "bat --theme ansi"
abbr -a syscat /bin/cat
abbr -a rg "rg --pcre2 --color always"
abbr -a fd "fd --color always"
abbr -a yz yazi

#############
# Functions #
#############

# Jump to somewhere in the file system using fzf
function j
    cd $(fd --color never -H -I -d 3 -t d \
        -E '{.git,__py*}' \
        -E node_modules \
        -E vendor \
        . ~ /mnt/windows-shared/ /mnt/windows-shared/syncthing/ \
        | fzf)
end

# Call sesh to create a new tmux session in the specified directory 
function t
    sesh connect $(
      # sesh list --icons | fzf -p 80%,70% \
      sesh list --icons | fzf \
        --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
        --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find ? toggle preview' \
        --bind 'tab:down,btab:up' \
        --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
        --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
        --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
        --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
        --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -I -d 4 -t d . ~ /mnt/windows-shared/ /mnt/windows-shared/syncthing/)' \
        --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
        --bind '?:toggle-preview' \
        --preview 'sesh preview {}' \
        --preview-window hidden
        # --preview-window 'right:55%' \
    )
end

# Call zesh to create a new zellij session in the specified directory 
function zs
    zesh connect $(
      zesh list | fzf \
        --no-sort --ansi --border-label ' zesh ' --prompt '⚡  ' \
        --header '  ^a all ^z zellij ^x zoxide ^d zellij kill ^f find ? toggle preview' \
        --bind 'tab:down,btab:up' \
        --bind 'ctrl-a:change-prompt(⚡  )+reload(zesh list)' \
        --bind 'ctrl-z:change-prompt(🪟  )+reload(zesh list -Z)' \
        --bind 'ctrl-x:change-prompt(📁  )+reload(zesh list -z)' \
        --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -I -d 4 -t d . ~ /mnt/windows-shared/ /mnt/windows-shared/syncthing/)' \
        --bind 'ctrl-d:execute(zellij kill-session {2..})+change-prompt(⚡  )+reload(zesh list)' \
        --bind '?:toggle-preview' \
        --preview 'zesh preview {}' \
        --preview-window hidden
    )
end

###############
# Final inits #
###############

# direnv
direnv hook fish | source

# Starship prompt
starship init fish | source

# Zoxide
zoxide init fish | source

# Micromamba
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
set -gx MAMBA_EXE "/home/fahmi/.local/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX /home/fahmi/micromamba
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
