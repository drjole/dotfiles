#!/bin/bash

# Example locker script -- demonstrates how to use the --transfer-sleep-lock
# option with i3lock's forking mode to delay sleep until the screen is locked.

## CONFIGURATION ##############################################################

# Options to pass to i3lock
i3lock_options="--ignore-empty-password --show-failed-attempts --tiling --image=$HOME/.local/share/wallpapers/$HOSTNAME.png"

# The number of seconds of inactivity before the screen is turned off during session lock
SCREEN_OFF_TIMEOUT_DURING_LOCK=60

# Run before starting the locker
pre_lock() {
  # Disable notifications on lock screen
  dunstctl set-paused true

  # Turn off the screen after SCREEN_OFF_TIMEOUT_DURING_LOCK seconds
  # xset dpms $SCREEN_OFF_TIMEOUT_DURING_LOCK $SCREEN_OFF_TIMEOUT_DURING_LOCK $SCREEN_OFF_TIMEOUT_DURING_LOCK

  return
}

# Run after the locker exits
post_lock() {
  # Re-enable notifications
  dunstctl set-paused false

  # Disable automatic screen off
  # xset -dpms

  # Re-enable automatic screen saver (which also locks the session)
  $HOME/.config/i3/scripts/setup_auto_screen_off.sh

  return
}

###############################################################################

pre_lock

# We set a trap to kill the locker if we get killed, then start the locker and
# wait for it to exit. The waiting is not that straightforward when the locker
# forks, so we use this polling only if we have a sleep lock to deal with.
if [[ -e /dev/fd/${XSS_SLEEP_LOCK_FD:--1} ]]; then
  kill_i3lock() {
    pkill -xu $EUID "$@" i3lock
  }

  trap kill_i3lock TERM INT

  # we have to make sure the locker does not inherit a copy of the lock fd
  i3lock $i3lock_options {XSS_SLEEP_LOCK_FD}<&-

  # now close our fd (only remaining copy) to indicate we're ready to sleep
  exec {XSS_SLEEP_LOCK_FD}<&-

  while kill_i3lock -0; do
    sleep 0.5
  done
else
  trap 'kill %%' TERM INT
  i3lock -n $i3lock_options &
  wait
fi

post_lock
