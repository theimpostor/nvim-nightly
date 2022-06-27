#!/usr/bin/env bash

set -euf -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NVIMBINARY="$SCRIPT_DIR/bin/.nvim.bin"
NVIM="$SCRIPT_DIR/bin/nvim"

set -x

case $(uname -s) in
    Darwin)
        NVIMDIR_ASIDE="$SCRIPT_DIR/nvim-macos.$RANDOM"
        mv "$SCRIPT_DIR/nvim-macos" "$NVIMDIR_ASIDE"
        curl -fsSL https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz | tar xzfC - "$SCRIPT_DIR"
        # curl -fsSL https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-macos.tar.gz | tar xzfC - "$SCRIPT_DIR"
        rm -rf "$NVIMDIR_ASIDE"
        ;;

    *)
        curl -fsSLo "$NVIMBINARY" https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
        chmod u+x "$NVIMBINARY"
        ;;
esac

"$NVIM" +PlugUpgrade +qa && "$NVIM" +PlugUpdate
