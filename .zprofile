export EDITOR=nvim
export VISUAL=nvim

# https://github.com/catppuccin/lazygit
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.local/share/catppuccin-lazygit/themes-mergable/mocha/lavender.yml"

# https://github.com/catppuccin/fzf and more
source $HOME/.local/share/catppuccin-fzf/themes/catppuccin-fzf-mocha.sh

# https://github.com/catppuccin/bat
export BAT_THEME="Catppuccin Mocha"

# Automatically start Hyprland when logging in on tty1 and $DISPLAY is not set
# if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    # [[ $(fgconsole 2>/dev/null) == 1 ]] && Hyprland &> /dev/null
    # Exit after running Hyprland. Best display manager there is lul.
    # exit
# fi
