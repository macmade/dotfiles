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

# SCM Editors
export SVN_EDITOR=vim
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
alias lg="lazygit"
alias vps="ssh -l macmade 45.79.77.24"
alias vps-old="ssh -l root 195.110.34.56"
alias phoenix="ssh -l build Phoenix-Server.local"
alias grev="git rev-list \`git branch | grep -e \"^*\" | cut -d' ' -f 2\` | wc -l | awk '{\$1=\$1};1'"

if [[ `uname -s` == "Darwin" ]];        then alias top="top -o cpu"; fi
if [ -d ~/Documents/Macmade/GitHub/ ];  then alias github="cd ~/Documents/Macmade/GitHub/"; fi
if [ -d ~/Documents/Macmade/DigiDNA/ ]; then alias dna="cd ~/Documents/Macmade/DigiDNA/"; fi
if [ -f /usr/local/gcc/bin/gcc ];       then alias gcc="/usr/local/gcc/bin/gcc"; fi
if [ -f /opt/homebrew/bin/trash ];      then alias rm="/opt/homebrew/bin/trash"; fi
if [[ `uname -s` == "Darwin" ]];        then alias hot="pmset -g thermlog"; fi

################################################################################
# Additional Software
################################################################################

if [ -d /opt/local/bin ];                     then export PATH=$PATH:/opt/local/bin; fi
if [ -d /opt/homebrew/bin ];                  then export PATH=$PATH:/opt/homebrew/bin; fi
if [ -d /usr/local/make/bin ];                then export PATH=/usr/local/make/bin:$PATH; fi
if [ -d /usr/local/jtool ];                   then export PATH=/usr/local/jtool:$PATH; fi
if [ -d /usr/local/xeos-toolchain/yasm/bin ]; then export PATH=$PATH:/usr/local/xeos-toolchain/yasm/bin; fi
if [ -d /usr/local/cling/bin ];               then export PATH=$PATH:/usr/local/cling/bin; fi
if [ -d /usr/local/distcc/bin ];              then export PATH=$PATH:/usr/local/distcc/bin; fi
if [ -d /usr/local/qemu/bin ];                then export PATH=$PATH:/usr/local/qemu/bin; fi

if type -p bat > /dev/null 2>&1; then alias cat="bat"; fi

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
# Tmux
################################################################################

alias tk="tmux kill-session"

alias work="tmux new-session \; split-window -h -p 40 \; selectp -t 0 \; split-window -p 50 \; selectp -t 2 \; split-window -p 50 \; split-window -p 30 \; selectp -t 0 \; send-keys \"clear && git status\" C-m \; selectp -t 1 \; send-keys \"clear && lazygit\" C-m \; selectp -t 2 \; send-keys \"clear && vim\" C-m \; selectp -t 3 \; send-keys \"clear && tig\" C-m \; selectp -t 4 \; send-keys \"clear && git-branch-status --fetch-origin --keychain-item macmade-github\" C-m \; selectp -t 0\; attach"
alias debug="tmux new-session \; send-keys \"clear && lldb\" C-m \; split-window \; send-keys \"clear && htop\" C-m \; selectp -t 0 \; send-keys \"file \" \; attach"

if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/master ];      then alias imm="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/master      && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/release ];     then alias imr="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/release     && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/hotfix ];      then alias imh="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/hotfix      && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/development ]; then alias imd="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/development && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/master ];      then alias iwm="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/master      && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/release ];     then alias iwr="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/release     && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/hotfix ];      then alias iwh="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/hotfix      && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/development ]; then alias iwd="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/development && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Downloads ];       then alias downloads="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Downloads && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/DDNA-AppCache ];           then alias appcache="cd ~/Documents/Macmade/DigiDNA/GitHub/DDNA-AppCache      && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/DDNA-BuildCache ];         then alias buildcache="cd ~/Documents/Macmade/DigiDNA/GitHub/DDNA-BuildCache  && work"; fi

if [ -d ~/Desktop/iMazing-Win/master ];      then alias iwm="cd ~/Desktop/iMazing-Win/master      && work"; fi
if [ -d ~/Desktop/iMazing-Win/release ];     then alias iwr="cd ~/Desktop/iMazing-Win/release     && work"; fi
if [ -d ~/Desktop/iMazing-Win/hotfix ];      then alias iwh="cd ~/Desktop/iMazing-Win/hotfix      && work"; fi
if [ -d ~/Desktop/iMazing-Win/development ]; then alias iwd="cd ~/Desktop/iMazing-Win/development && work"; fi

################################################################################
# NVM
################################################################################

export NVM_DIR="$HOME/.nvm"

if [ -d /usr/local/opt/nvm ]; then [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"; fi
      
