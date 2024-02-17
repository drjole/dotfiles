export TERMINAL=alacritty

export EDITOR=nvim
export VISUAL=nvim

export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME=gtk2

export LG_CONFIG_FILE="$HOME/.local/share/catppuccin-lazygit/themes-mergable/mocha/lavender.yml" lazygit

export npm_config_prefix="$HOME/.local"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx &> /dev/null
fi
