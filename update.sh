#!/usr/bin/env bash

set -euf -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NVIMAPPIMG="$SCRIPT_DIR/nvim.appimage"
NVIM="$SCRIPT_DIR/nvim"

set -x

case $(uname -s) in
    Darwin)
        curl -fsSL https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz | tar xzf -
        ;;

    *)
        curl -fsSLo "$NVIMAPPIMG" https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
        chmod u+x "$NVIMAPPIMG"
        ;;
esac

"$NVIM" +PlugUpgrade +qa && "$NVIM" +PlugUpdate
