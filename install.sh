#!/usr/bin/env bash

set -euf -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p "$SCRIPT_DIR/.config"
mkdir -p "$SCRIPT_DIR/.local/share"
mkdir -p "$SCRIPT_DIR/.local/state"
mkdir -p "$SCRIPT_DIR/.cache"
NVIMAPPIMG="$SCRIPT_DIR/nvim.appimage"
NVIM="$SCRIPT_DIR/nvim"

set -x

case $(uname -s) in
    Darwin)
        curl -fsSL https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz | tar xzf -
        ln -s nvim-osx64/bin/nvim "$NVIMAPPIMG"
        ;;

    *)
        curl -fsSLo "$NVIMAPPIMG" https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
        chmod u+x "$NVIMAPPIMG"
        ;;
esac

# install vim  plug
curl -fsSLo "$SCRIPT_DIR/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"$NVIM" +PlugInstall
