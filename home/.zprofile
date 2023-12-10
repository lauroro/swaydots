#!/bin/sh

if [ -z "$XDG_RUNTIME_DIR" ]; then
    XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"
    mkdir -pm 0700 "$XDG_RUNTIME_DIR"
    export XDG_RUNTIME_DIR
fi    

export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export TERM=foot
export _JAVA_AWT_WM_NONREPARENTING=1
