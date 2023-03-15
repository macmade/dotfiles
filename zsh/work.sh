#!/bin/sh

if [[ $TERM == "xterm-kitty" ]]; then

    kitty @ goto-layout splits > /dev/null

    kitty @ launch --location=vsplit --cwd current zsh > /dev/null
    kitty @ set-window-logo --match recent:0 none
    kitty @ resize-window --match recent:0 --increment -20 > /dev/null

    if [ -f README.md ]; then kitty @ send-text --match recent:0 nvim README.md'\n' > /dev/null
    else                      kitty @ send-text --match recent:0 nvim .'\n' > /dev/null
    fi

    kitty @ focus-window --match recent:2 > /dev/null
    kitty @ launch --location=hsplit --cwd current zsh  > /dev/null
    kitty @ set-window-logo --match recent:0 none
    kitty @ send-text --match recent:0 lazygit'\n' > /dev/null

    kitty @ focus-window --match recent:2 > /dev/null
    kitty @ launch --location=hsplit --cwd current zsh  > /dev/null
    kitty @ set-window-logo --match recent:0 none
    kitty @ send-text --match recent:0 tig'\n' > /dev/null

    kitty @ launch --location=hsplit --cwd current zsh  > /dev/null
    kitty @ set-window-logo --match recent:0 none
    kitty @ resize-window --match recent:0 --increment -20 --axis vertical > /dev/null
    kitty @ send-text --match recent:0 git-branch-status'\n' > /dev/null

    kitty @ focus-window --match recent:5 > /dev/null
    kitty @ send-text --match recent:0 clear'\n'git status'\n' > /dev/null

else

    tmux new-session \; \
    split-window -h -p 40 \; \
    selectp -t 0 \; \
    split-window -p 50 \; \
    selectp -t 2 \; \
    split-window -p 50 \; \
    split-window -p 30 \; \
    selectp -t 0 \; \
    send-keys "clear && git status" C-m \; \
    selectp -t 1 \; \
    send-keys "clear && lazygit" C-m \; \
    selectp -t 2 \; \
    send-keys "clear && if [ -f README.md ]; then vim README.md; else vim .; fi" C-m \; \
    selectp -t 3 \; \
    send-keys "clear && tig" C-m \; \
    selectp -t 4 \; \
    send-keys "clear && git-branch-status --fetch-origin --keychain-item macmade-github" C-m \; \
    selectp -t 0\; \
    attach

fi
