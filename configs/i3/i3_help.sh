#!/usr/bin/env bash
set -euo pipefail

sed -n '/###KEYBIDINGS/,/### WORKSPACES/p' \
    /home/filipe/.mySettings/configs/i3/config | \
    #grep -v '^#' | \
    sed -e 's/bindsym //' \
    -e '/^XF/d' \
    -e '/^$/d' \
    -e 's/\$mod+/Super + /' \
    -e 's/exec/run/' \
    -e '/### WORKSPACES/d' \
    -e '/## Special keys/,/## ACTIONS/d'
