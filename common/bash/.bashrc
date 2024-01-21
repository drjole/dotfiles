# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100 # limits recursive functions, see 'man bash'

# Starship prompt
eval "$(starship init bash)"

# tmuxifier
# eval "$(tmuxifier init -)"

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
