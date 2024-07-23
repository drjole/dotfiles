#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ "$(hostname)" = "jolepc" ]; then
  # DPY-2 is the right monitor, DPY-4 is the left monitor
  # Both are 2560x1440 144Hz
  nvidia-settings --assign CurrentMetaMode="
        DPY-2: 2560x1440_144 @2560x1440 +0+0 {ViewPortIn=2560x1440, ViewPortOut=2560x1440+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On},
        DPY-4: 2560x1440_144 @2560x1440 +2560+0 {ViewPortIn=2560x1440, ViewPortOut=2560x1440+0+0, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
  xrandr --output DP-2 --primary
elif [ "$(hostname)" = "jolelaptop" ]; then
  xrandr --output eDP --primary --mode 1920x1080 --rate 60
fi

picom --no-frame-pacing &
numlockx &
setxkbmap 'de(us)'

exec i3
