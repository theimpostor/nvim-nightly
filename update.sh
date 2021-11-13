#!/usr/bin/env bash

set -euf -o pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NVIM="$SCRIPT_DIR/nvim.appimage"

set -x

curl -fsSLo "$NVIM" https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage

chmod u+x "$NVIM"

"$NVIM" +PlugUpgrade +qa && "$NVIM" +PlugUpdate
