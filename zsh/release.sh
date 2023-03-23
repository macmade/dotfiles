if [[ $TERM == "xterm-kitty" ]]; then

    kitty @ launch --type tab zsh > /dev/null
    kitty @ launch --type tab zsh > /dev/null
    kitty @ launch --type tab zsh > /dev/null
    kitty @ launch --type tab zsh > /dev/null
    kitty @ launch --type tab zsh > /dev/null

    kitty @ focus-tab --match id:-5
    kitty @ send-text --match recent:0 downloads'\n' > /dev/null
    sleep 1

    kitty @ focus-tab --match id:-4
    kitty @ send-text --match recent:0 imr'\n' > /dev/null
    sleep 1

    kitty @ focus-tab --match id:-3
    kitty @ send-text --match recent:0 iwr'\n' > /dev/null
    sleep 1

    kitty @ focus-tab --match id:-2
    kitty @ send-text --match recent:0 imh'\n' > /dev/null
    sleep 1

    kitty @ focus-tab --match id:-1
    kitty @ send-text --match recent:0 iwh'\n' > /dev/null
    sleep 1

    kitty @ focus-tab --match id:-5

fi
