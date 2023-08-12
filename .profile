export EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"

# Rust/Cargo
. "$HOME/.cargo/env"

# rbenv
eval "$(rbenv init -)"

# Added by Toolbox App
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

export BAT_THEME="Catppuccin-mocha"
export GTK_THEME=Arc-Dark
export GTK2_RC_FILES=/usr/share/themes/Arc-Dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=kvantum
