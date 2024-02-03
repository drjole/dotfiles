export TERMINAL=alacritty

export EDITOR=nvim
export VISUAL=nvim

export GTK_THEME='Catppuccin-Mocha-Standard-Lavender-Dark:dark'

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
