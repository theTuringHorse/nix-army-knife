#!/bin/sh
# shellcheck disable=SC2155

# set the following in /etc/zsh/zshenv or symlink this file to user's home
# export XDG_CONFIG_HOME="$HOME/.config"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# XDG-DIRS and ZDOTDIR
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SHELLDOTDIR="$XDG_CONFIG_HOME/shell"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

# ~/ Clean-up:
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/.gitconfig"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
# export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
# export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"
export PYTHON_HISTORY="$XDG_DATA_HOME/python/history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
# export UNISON="$XDG_DATA_HOME/unison"

# export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
