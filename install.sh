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

backup "$HOME/.tmux.conf"
ln -sf "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"

backup "$HOME/.vimrc"
ln -sf "$DOTFILES/vim/vimrc" "$HOME/.vimrc"

backup "$HOME/.gitignore_global"
ln -sf "$DOTFILES/git/gitignore_global" "$HOME/.gitignore_global"

echo "Done. Run: source ~/.bashrc"
