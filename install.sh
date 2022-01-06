#!/usr/bin/env bash

set -euf -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p "$SCRIPT_DIR/.config"
mkdir -p "$SCRIPT_DIR/.local/share"
mkdir -p "$SCRIPT_DIR/.local/state"
mkdir -p "$SCRIPT_DIR/.cache"
NVIMBINARY="$SCRIPT_DIR/bin/.nvim.bin"
NVIM="$SCRIPT_DIR/bin/nvim"

case $(uname -s) in
    Darwin)
        curl -fsSL https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz | tar xzfC - "$SCRIPT_DIR"
        ln -s ../nvim-osx64/bin/nvim "$NVIMBINARY"
        ;;

    *)
        curl -fsSLo "$NVIMBINARY" https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
        chmod u+x "$NVIMBINARY"
        ;;
esac

# install vim  plug
curl -fsSLo "$SCRIPT_DIR/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"$NVIM" +PlugInstall
