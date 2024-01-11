#!/bin/bash

STOW_FOLDERS=$(find . -maxdepth 1 -type d -not -path . -not -path ./.git -printf '%P\n' | sort)

echo "$STOW_FOLDERS" | while read stow_folder; do
  echo "Stowing $stow_folder"
  stow --adopt $stow_folder
done
