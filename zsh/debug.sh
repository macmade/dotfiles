#!/bin/sh

if [[ $TERM == "xterm-kitty" ]]; then

    kitty @ goto-layout splits > /dev/null

    kitty @ launch --location=hsplit --cwd current zsh > /dev/null
    kitty @ set-window-logo --match id:-1 none

    kitty @ send-text --match id:-1 btm'\n' > /dev/null
    kitty @ focus-window --match id:-2 > /dev/null
    kitty @ send-text --match id:-2 lldb'\n' > /dev/null
    

else

    tmux new-session \; \
    send-keys "clear && lldb" C-m \; \
    split-window \; \
    send-keys "clear && btm" C-m \; \
    selectp -t 0 \; \
    send-keys "file " \; \
    attach

fi
