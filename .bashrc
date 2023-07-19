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

# Aliases
alias cat=bat
alias bathelp='bat --plain --language=help'
help() {
	"$@" --help 2>&1 | bathelp
}
alias ls=exa
alias vim=nvim

# Start tmux
if command -v tmux &>/dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	exec tmux
fi
