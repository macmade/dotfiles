################################################################################
# ZSH configuration file
# 
# Jean-David Gadina - www.xs-labs.com
################################################################################

################################################################################
# ZSH settings
################################################################################

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_STATESEPARATOR=" "

. ~/.zsh/git-prompt.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'

autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -U compinit && compinit

setopt prompt_subst

RPROMPT="%{$bg[green]%}[ TTY%l ]>%{$reset_color%}%{$bg[red]%}[ %D ]>%{$reset_color%}%{$bg[yellow]%}[ %* ]%{$reset_color%}"
precmd () { __git_ps1 "%{$bg[cyan]%}[ %m ]>%{$reset_color%}%{$bg[blue]%}[ %n %# ]>%{$reset_color%}%{$bg[magenta]%}[ %~ ]%{$reset_color%}
" "%{$fg[cyan]%}>%{$reset_color%} " "{ %s }%%{$fg[cyan]%%} -%%{$reset_color%%}" }

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

setopt share_history

fpath=(~/.zsh $fpath)

################################################################################
# Miscellaneous
################################################################################

# Use CLI colors
export CLICOLOR=1

# Colors for the LS command
export LSCOLORS=exfxcxdxbxxexgxbxdxcxf

# SVN options
export SVN_EDITOR=vim

# GIT options
export GIT_EDITOR=vim

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# SSH agent
ssh-add -A &> /dev/null

# Path
export PATH=/usr/local/bin:${PATH}:$(git --exec-path)

################################################################################
# Aliases
################################################################################

alias bb=bbedit
alias ll="ls -alh"
alias g="git"
alias vps="ssh -l macmade 45.79.77.24"
alias vps-old="ssh -l root 195.110.34.56"
alias phoenix="ssh -l build Phoenix-Server.local"
alias grev="git rev-list \`git branch | grep -e \"^*\" | cut -d' ' -f 2\` | wc -l | awk '{\$1=\$1};1'"

if [[ `uname -s` == "Darwin" ]];        then alias top="top -o cpu"; fi
if [ -d ~/Documents/Macmade/GitHub/ ];  then alias github="cd ~/Documents/Macmade/GitHub/"; fi
if [ -d ~/Documents/Macmade/DigiDNA/ ]; then alias dna="cd ~/Documents/Macmade/DigiDNA/"; fi
if [ -f /usr/local/gcc/bin/gcc ];       then alias gcc="/usr/local/gcc/bin/gcc"; fi
if [ -f /usr/local/bin/trash ];         then alias rm="/usr/local/bin/trash"; fi

if type -p bat > /dev/null 2>&1; then alias cat="bat"; fi

################################################################################
# Additional Software
################################################################################

if [ -d /opt/local/bin ];                     then export PATH=$PATH:/opt/local/bin; fi
if [ -d /usr/local/make/bin ];                then export PATH=/usr/local/make/bin:$PATH; fi
if [ -d /usr/local/jtool ];                   then export PATH=/usr/local/jtool:$PATH; fi
if [ -d /usr/local/xeos-toolchain/yasm/bin ]; then export PATH=$PATH:/usr/local/xeos-toolchain/yasm/bin; fi
if [ -d /usr/local/cling/bin ];               then export PATH=$PATH:/usr/local/cling/bin; fi
if [ -d /usr/local/distcc/bin ];              then export PATH=$PATH:/usr/local/distcc/bin; fi

################################################################################
# GPG / Windows
################################################################################

if [ -f /usr/bin/ssh-agent.exe ] && [ -f ~/.ssh/id_rsa ] && [ -z "$SSH_AUTH_SOCK" -a -x "/usr/bin/ssh-agent" ]; then
    eval `/usr/bin/ssh-agent -s` > /dev/null
    trap "kill $SSH_AGENT_PID" 0
    ssh-add ~/.ssh/id_rsa
fi

export GPG_TTY=$(tty)

################################################################################
# Travis
################################################################################

# [ -f /Users/macmade/.travis/travis.sh ] && source /Users/macmade/.travis/travis.sh
# 
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

################################################################################
# Tmux
################################################################################

alias tk="tmux kill-session"

alias work="tmux new-session \; send-keys \"clear && git status\" C-m \; split-window -p 50 \; split-window -p 30 \; send-keys \"clear && git-branch-status --fetch-origin --keychain-item macmade-github \" C-m \; selectp -t 1 \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"
alias debug="tmux new-session \; send-keys \"clear && lldb\" C-m \; split-window \; send-keys \"clear && htop\" C-m \; selectp -t 0 \; send-keys \"file \" \; attach"

if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/master ];      then alias imm="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/master      && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window -p 50 \; split-window -p 30 \; send-keys \"clear && git-branch-status --fetch-origin --keychain-item macmade-github \" C-m \; selectp -t 1 \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/release ];     then alias imr="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/release     && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window -p 50 \; split-window -p 30 \; send-keys \"clear && git-branch-status --fetch-origin --keychain-item macmade-github \" C-m \; selectp -t 1 \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/hotfix ];      then alias imh="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/hotfix      && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window -p 50 \; split-window -p 30 \; send-keys \"clear && git-branch-status --fetch-origin --keychain-item macmade-github \" C-m \; selectp -t 1 \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/development ]; then alias imd="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/development && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window -p 50 \; split-window -p 30 \; send-keys \"clear && git-branch-status --fetch-origin --keychain-item macmade-github \" C-m \; selectp -t 1 \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/master ];      then alias iwm="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/master      && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window -p 50 \; split-window -p 30 \; send-keys \"clear && git-branch-status --fetch-origin --keychain-item macmade-github \" C-m \; selectp -t 1 \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/release ];     then alias iwr="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/release     && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window -p 50 \; split-window -p 30 \; send-keys \"clear && git-branch-status --fetch-origin --keychain-item macmade-github \" C-m \; selectp -t 1 \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/hotfix ];      then alias iwh="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/hotfix      && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window -p 50 \; split-window -p 30 \; send-keys \"clear && git-branch-status --fetch-origin --keychain-item macmade-github \" C-m \; selectp -t 1 \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/development ]; then alias iwd="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/development && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window -p 50 \; split-window -p 30 \; send-keys \"clear && git-branch-status --fetch-origin --keychain-item macmade-github \" C-m \; selectp -t 1 \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi

if [ -d ~/Desktop/iMazing-Win/master ];      then alias iwm="cd ~/Desktop/iMazing-Win/master      && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
if [ -d ~/Desktop/iMazing-Win/release ];     then alias iwr="cd ~/Desktop/iMazing-Win/release     && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
if [ -d ~/Desktop/iMazing-Win/hotfix ];      then alias iwh="cd ~/Desktop/iMazing-Win/hotfix      && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
if [ -d ~/Desktop/iMazing-Win/development ]; then alias iwd="cd ~/Desktop/iMazing-Win/development && tmux new-session \; send-keys \"clear && git status\" C-m \; split-window \; send-keys \"clear && tig\" C-m \; split-window -h \; send-keys \"cd DDNAToolKit && clear && tig\" C-m \; selectp -t 0 \; split-window -h -p 40 \; send-keys \"clear && vim\" C-m \; selectp -t 0 \; attach"; fi
