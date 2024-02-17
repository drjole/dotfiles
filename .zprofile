export TERMINAL=alacritty

export EDITOR=nvim
export VISUAL=nvim

export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME=gtk2

export LG_CONFIG_FILE="$HOME/.local/share/catppuccin-lazygit/themes-mergable/mocha/lavender.yml" lazygit

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export npm_config_prefix="$HOME/.local"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx &> /dev/null
fi
