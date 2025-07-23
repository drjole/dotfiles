export EDITOR=nvim
export VISUAL=nvim

# https://github.com/catppuccin/fzf
source $HOME/.local/share/catppuccin-fzf/themes/catppuccin-fzf-mocha.sh

# https://github.com/catppuccin/lazygit
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,$HOME/.local/share/catppuccin-lazygit/themes-mergable/mocha/lavender.yml"

# https://github.com/catppuccin/bat
export BAT_THEME="Catppuccin Mocha"

# Force (some) electron apps to use Wayland
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# Configure VDPAU hardware video acceleration
export VDPAU_DRIVER=radeonsi
