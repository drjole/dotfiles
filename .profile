# Rust/Cargo
. "$HOME/.cargo/env"

# rbenv
eval "$(rbenv init -)"

# PATH
# export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# NPM
export npm_config_prefix="$HOME/.local"

# TexLive
export MANPATH="$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"

# Other environment variables
export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME=Catppuccin-mocha
export QT_QPA_PLATFORMTHEME=qt5ct
