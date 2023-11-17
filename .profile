export EDITOR=nvim
export VISUAL=nvim
export MANPATH="$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"

export npm_config_prefix="$HOME/.local"

# Rust/Cargo
. "$HOME/.cargo/env"

# rbenv
eval "$(rbenv init -)"

# Added by Toolbox App
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

export BAT_THEME=Catppuccin-mocha
export GTK_THEME=Arc-Dark
export GTK2_RC_FILES=/usr/share/themes/Arc-Dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=kvantum
