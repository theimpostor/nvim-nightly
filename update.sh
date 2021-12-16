#!/usr/bin/env bash

set -euf -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NVIMBINARY="$SCRIPT_DIR/bin/.nvim.bin"
NVIM="$SCRIPT_DIR/bin/nvim"

set -x

case $(uname -s) in
    Darwin)
        rm -rf "$SCRIPT_DIR/nvim-osx64"
        curl -fsSL https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz | tar xzf -
        ;;

    *)
        curl -fsSLo "$NVIMBINARY" https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
        chmod u+x "$NVIMBINARY"
        ;;
esac

"$NVIM" +PlugUpgrade +qa && "$NVIM" +PlugUpdate
