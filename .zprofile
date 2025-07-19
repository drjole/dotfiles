export TERMINAL=alacritty

export EDITOR=nvim
export VISUAL=nvim

export QT_STYLE_OVERRIDE=kvantum

# TexLive
export MANPATH="$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info"

# https://github.com/catppuccin/lazygit
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.local/share/catppuccin-lazygit/themes-mergable/mocha/lavender.yml"

# https://github.com/catppuccin/fzf and more
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# https://github.com/catppuccin/bat
export BAT_THEME="Catppuccin Mocha"

# https://wiki.archlinux.org/title/Node.js#Allow_user-wide_installations
export npm_config_prefix="$HOME/.local"

# https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/java/lombok.jar"

# TODO: Revert this eventually
export NVIM_APPNAME=nvim_clean

# rbenv
eval "$(rbenv init - --no-rehash zsh)"

# Automatically start X when logging in on tty1 and no X server is running
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx &> /dev/null
fi
