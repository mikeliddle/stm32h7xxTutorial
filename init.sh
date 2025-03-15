#!/bin/sh

# if mac, run scripts;/init-mac.sh
if [ "$(uname)" == "Darwin" ]; then
    tools/scripts/init-mac.sh
fi

if [ "$(uname)" == "Linux" ]; then
    tools/scripts/init-linux.sh
fi