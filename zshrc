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
GIT_PS1_SHOWCONFLICTSTATE=1
GIT_PS1_OMITSPARSESTATE=1
GIT_PS1_SHOWUPSTREAM="verbose"
GIT_PS1_SHOWCOLORHINTS=1

if [[ $TERM == "xterm-kitty" ]]; then
GIT_PS1_STATESEPARATOR=" "$'\Uf14b'" "
else
GIT_PS1_STATESEPARATOR=" "
fi

if [[ $TERM == "xterm-kitty" ]]; then
GIT_PS1_REMOTESEPARATOR=" "$'\Uebcb'"  "
else
GIT_PS1_REMOTESEPARATOR=" "
fi

. ~/.zsh/git-prompt.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'

autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -U compinit && compinit

setopt prompt_subst

if [[ $TERM == "xterm-kitty" ]]; then

RPROMPT="%{$fg[yellow]%}"$'\Ue0b2'"%{$reset_color%}%{$bg[yellow]%} "$'\Ue641'" %* %{$fg[red]%}"$'\Ue0b2'"%{$reset_color%}%{$bg[red]%} "$'\Uf133'" %D %{$fg[green]%}"$'\Ue0b2'"%{$reset_color%}%{$bg[green]%} "$'\Uea85'" TTY%l %{$reset_color%}%{$fg[green]%}"$'\Ue0b4'"%{$reset_color%}"

precmd () { __git_ps1 "%{$fg[cyan]%}"$'\U256d'$'\U2574'$'\Ue0b6'"%{$reset_color%}%{$bg[cyan]%} "$'\Uf822'" %m %{$fg[cyan]%}%{$bg[blue]%}"$'\Ue0b0'"%{$reset_color%}%{$bg[blue]%} "$'\Uf2c0'" %n %# %{$fg[blue]%}%{$bg[magenta]%}"$'\Ue0b0'"%{$reset_color%}%{$bg[magenta]%} "$'\Uea83'" %~ %{$reset_color%}%{$fg[magenta]%}"$'\Ue0b0'"%{$reset_color%}
%{$fg[cyan]%}"$'\U2570'$'\U2574'"%{$reset_color%}" "%{$fg[cyan]%}"$'\Uf120'"  %{$reset_color%}" $'\Uea68'" %s %%{$reset_color%%}" }

else

RPROMPT="%{$bg[yellow]%} %* %{$reset_color%}%{$bg[red]%} %D %{$reset_color%}%{$bg[green]%} TTY%l %{$reset_color%}"

precmd () { __git_ps1 "%{$bg[cyan]%} %m %{$reset_color%}%{$bg[blue]%} %n %# %{$reset_color%}%{$bg[magenta]%} %~ %{$reset_color%}
" "%{$fg[cyan]%}>%{$reset_color%} " "%s%%{$fg[cyan]%%} %%{$reset_color%%}" }

fi

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
export SVN_EDITOR=nvim
export GIT_EDITOR=nvim

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

if [[ $TERM == "xterm-kitty" ]]; then

    if [ -f /opt/homebrew/bin/nvim ]; then
        alias vi=nvim
        alias vim=nvim
    fi

    if [ -f /opt/homebrew/bin/lsd ]; then
        alias ls=lsd
    fi
fi

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
export XDG_CONFIG_HOME="$HOME/.config"

################################################################################
# Tmux
################################################################################

alias tk="tmux kill-session"

if [ -f ~/.zsh/work.sh ];    then alias work="sh ~/.zsh/work.sh";  fi
if [ -f ~/.zsh/debug.sh ];   then alias debug="sh ~/.zsh/debug.sh"; fi
if [ -f ~/.zsh/imazing.sh ]; then alias imazing="sh ~/.zsh/imazing.sh"; fi
if [ -f ~/.zsh/release.sh ]; then alias release="sh ~/.zsh/release.sh"; fi

if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/master ];            then alias imm="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/master            && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/release ];           then alias imr="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/release           && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/hotfix ];            then alias imh="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/hotfix            && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/development ];       then alias imd="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/development       && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/feature-imazing-3 ]; then alias im3="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Mac/feature-imazing-3 && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/master ];            then alias iwm="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/master            && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/release ];           then alias iwr="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/release           && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/hotfix ];            then alias iwh="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/hotfix            && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/development ];       then alias iwd="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/development       && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/feature-imazing-3 ]; then alias iw3="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Win/feature-imazing-3 && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Downloads ];             then alias downloads="cd ~/Documents/Macmade/DigiDNA/GitHub/iMazing-Downloads       && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/DDNA-AppCache ];                 then alias appcache="cd ~/Documents/Macmade/DigiDNA/GitHub/DDNA-AppCache            && work"; fi
if [ -d ~/Documents/Macmade/DigiDNA/GitHub/DDNA-BuildCache ];               then alias buildcache="cd ~/Documents/Macmade/DigiDNA/GitHub/DDNA-BuildCache        && work"; fi

if [ -d ~/Desktop/iMazing-Win/master ];      then alias iwm="cd ~/Desktop/iMazing-Win/master      && work"; fi
if [ -d ~/Desktop/iMazing-Win/release ];     then alias iwr="cd ~/Desktop/iMazing-Win/release     && work"; fi
if [ -d ~/Desktop/iMazing-Win/hotfix ];      then alias iwh="cd ~/Desktop/iMazing-Win/hotfix      && work"; fi
if [ -d ~/Desktop/iMazing-Win/development ]; then alias iwd="cd ~/Desktop/iMazing-Win/development && work"; fi

################################################################################
# NVM
################################################################################

export NVM_DIR="$HOME/.nvm"

if [ -d /usr/local/opt/nvm ]; then [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"; fi
