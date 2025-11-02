# My Dotfiles

This repository contains my personal dotfiles that I use on my Arch Linux based
systems. Refer to [this repository](https://github.com/drjole/arch) for the
installation script of my systems.

The dotfiles are grouped in multiple directories that are intended to be applied
using [GNU Stow](https://www.gnu.org/software/stow/).

The `shared` directory contains the files that are intended to be used on all
systems.

The `jolepc` and `jolelaptop` directories contain configuration specific to the
respective system. The name of the directory matches the hostname of that
system.

To apply the dotfiles, clone this repository:

```shell
git clone git@github.com:drjole/dotfiles.git ~/.dotfiles
```

Then, apply the dotfiles:

```shell
cd ~/.dotfiles
stow shared
stow "$(hostname)"
```
