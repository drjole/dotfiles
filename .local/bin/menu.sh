#!/bin/bash

pkill wofi

entries="--- Shutdown\n--- Reboot\n--- Suspend\n--- Logout"

selected=$(echo -e $entries | wofi --show drun,dmenu --sort-order alphabetical | awk '{print tolower($2)}')

case $selected in
  shutdown)
    exec systemctl poweroff -i;;
  reboot)
    exec systemctl reboot;;
  suspend)
    exec systemctl suspend;;
  logout)
    exec hyprctl dispatch exit NOW;;
esac
