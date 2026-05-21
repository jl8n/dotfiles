# dotfiles

Tracks bash, SSH, and git config across hydrogen (PC), nitrogen (laptop), and oxygen (server).

## Structure

```
bash/
  shared.sh       # main bashrc, sourced by all machines
  hydrogen.sh     # sources shared, add machine-specific stuff here
  nitrogen.sh
  oxygen.sh
ssh/
  shared.conf     # all SSH hosts
  hydrogen.conf   # includes shared, add machine-specific hosts here
  nitrogen.conf
  oxygen.conf
git/
  gitconfig
```

`~/.bashrc`, `~/.ssh/config`, and `~/.gitconfig` are symlinks into this repo.

## New machine setup

```bash
git clone git@github.com:jl8n/dotfiles.git ~/dotfiles
bash ~/dotfiles/install.sh
source ~/.bashrc
```

`install.sh` backs up any existing configs (as `.bak`) before symlinking. It uses `hostname` to pick the right per-machine files, so the machine's hostname needs to match (`hydrogen`, `nitrogen`, or `oxygen`).

## Adding a new machine

1. Add `bash/<hostname>.sh` and `ssh/<hostname>.conf` (copy an existing one)
2. Commit and push
3. Clone and run `install.sh` on the new machine

## Day to day

Edit files directly in `~/dotfiles/` or through the symlinks — same thing. Commit and push when done.
