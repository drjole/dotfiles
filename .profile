export EDITOR=nvim
export TERMINAL=alacritty
export WINIT_X11_SCALE_FACTOR=1.0
export NEOVIDE_MULTIGRID=true
export PATH="/home/jole/.local/bin:$PATH"

. "$HOME/.cargo/env"

eval "$(rbenv init -)"

# Added by Toolbox App
export PATH="$PATH:/home/jole/.local/share/JetBrains/Toolbox/scripts"

# Mouse speed bei Laurin
x=2.6 && xinput set-prop "Logitech USB Receiver" "Coordinate Transformation Matrix" $x 0 0 0 $x 0 0 0 1
