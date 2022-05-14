#!/usr/bin/env bash

set -euf -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NVIMBINARY="$SCRIPT_DIR/bin/.nvim.bin"
NVIM="$SCRIPT_DIR/bin/nvim"

set -x

case $(uname -s) in
    Darwin)
        NVIMDIR_ASIDE="$SCRIPT_DIR/nvim-osx64.$RANDOM"
        mv "$SCRIPT_DIR/nvim-osx64" "$NVIMDIR_ASIDE"
        curl -fsSL https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz | tar xzfC - "$SCRIPT_DIR"
        rm -rf "$NVIMDIR_ASIDE"
        ;;

    *)
        curl -fsSLo "$NVIMBINARY" https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
        chmod u+x "$NVIMBINARY"
        ;;
esac

"$NVIM" --headless +PlugUpgrade +qa && "$NVIM" +PlugUpdate +PlugDiff
