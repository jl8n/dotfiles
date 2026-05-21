#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"
HOST=$(hostname)

backup() {
    if [ -f "$1" ] && [ ! -L "$1" ]; then
        mv "$1" "$1.bak" && echo "Backed up $1 -> $1.bak"
    fi
}

echo "Setting up dotfiles for $HOST..."

backup "$HOME/.gitconfig"
ln -sf "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"

backup "$HOME/.bashrc"
ln -sf "$DOTFILES/bash/$HOST.sh" "$HOME/.bashrc"

chmod 600 "$DOTFILES/ssh/"*.conf
backup "$HOME/.ssh/config"
ln -sf "$DOTFILES/ssh/$HOST.conf" "$HOME/.ssh/config"

echo "Done. Run: source ~/.bashrc"
