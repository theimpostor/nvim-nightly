#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# https://stackoverflow.com/a/28776166
if (return 0 2>/dev/null) ; then
    export PATH="$SCRIPT_DIR/bin:$PATH"
else
    # usage: eval "$(./setup-env.sh)"
    echo export PATH=\""$SCRIPT_DIR/bin:\$PATH"\"
fi
