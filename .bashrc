# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100 # limits recursive functions, see 'man bash'

# Starship prompt
eval "$(starship init bash)"

# dotfiles setup
# https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
source /usr/share/bash-completion/completions/git
__git_complete dotfiles __git_main

# Rust/Cargo
. "$HOME/.cargo/env"

# Aliases and functions
alias bathelp='bat --plain --language=help'
alias cat=bat
alias ls=exa
help() {
	"$@" --help 2>&1 | bathelp
}

# Key binding for tmux-sessionizer
bind -x '"\C-f": "tmux-sessionizer"'

# Automatically start tmux
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
	tmux-sessionizer ~
fi
