#!/bin/bash

echo "Stowing $(hostname)"
pushd "$(hostname)" >/dev/null
stow -t "$HOME" -D */
stow -t "$HOME" --adopt */
popd >/dev/null

pushd common >/dev/null
echo "Stowing common"
stow -t "$HOME" -D */
stow -t "$HOME" --adopt */
popd >/dev/null
