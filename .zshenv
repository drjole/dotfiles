typeset -U path PATH

path=(~/.local/bin $path)

# TexLive
path=(/usr/local/texlive/2023/bin/x86_64-linux $path)

# Cargo
path=(~/.cargo/bin $path)

# Go
path=(~/go/bin $path)

export PATH
