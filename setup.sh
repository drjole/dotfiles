#!/bin/bash

echo "Stowing $(hostname)"
pushd "$(hostname)" >/dev/null
stow -t "$HOME" -D */
stow -t "$HOME" --adopt */
popd >/dev/null

echo "Stowing common"
pushd common >/dev/null
stow -t "$HOME" -D */
stow -t "$HOME" --adopt */
popd >/dev/null
