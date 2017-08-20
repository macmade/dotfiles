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

autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -U compinit && compinit

setopt prompt_subst

RPROMPT="[ %{$fg[green]%}%d%{$reset_color%} ] [ %{$fg[red]%}%D%{$reset_color%} ] [ %{$fg[yellow]%}%*%{$reset_color%} ]"
precmd () { __git_ps1 "[ %{$fg[cyan]%}%m%{$reset_color%} ]> [ %{$fg[blue]%}TTY%l%{$reset_color%} ]> [ %{$fg[magenta]%}%n %#%{$reset_color%} ]> " "" "[ %s ]> " }

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

################################################################################
# Aliases
################################################################################

alias ll="ls -alh"
alias ps="ps -axc -o pid,command,ppid,uid,gid,nice,pri,paddr,rss,vsz,%cpu,%mem,lstart,user"
alias vps="ssh -l root 195.110.34.56"
alias git-master="git checkout master && git submodule foreach --recursive git checkout master"
alias git-development="git checkout development && git submodule foreach --recursive git checkout development"

if [[ `uname -s` == "Darwin" ]];        then alias top="top -o cpu"; fi
if [ -d ~/Documents/Macmade/GitHub/ ];  then alias github="cd ~/Documents/Macmade/GitHub/"; fi
if [ -d ~/Documents/Macmade/DigiDNA/ ]; then alias dna="cd ~/Documents/Macmade/DigiDNA/"; fi
if [ -f /usr/local/gcc/bin/gcc ];       then alias gcc="/usr/local/gcc/bin/gcc"; fi
if [ -f /usr/local/bin/trash ];         then alias rm="/usr/local/bin/trash"; fi

################################################################################
# Additional Software
################################################################################

if [ -d /opt/local/bin ];                     then export PATH=$PATH:/opt/local/bin; fi
if [ -d /usr/local/make/bin ];                then export PATH=/usr/local/make/bin:$PATH; fi
if [ -d /usr/local/jtool ];                   then export PATH=/usr/local/jtool:$PATH; fi
if [ -d /usr/local/xeos-toolchain/yasm/bin ]; then export PATH=$PATH:/usr/local/xeos-toolchain/yasm/bin; fi

################################################################################
# GPG
################################################################################

# if [[ `command -v gpg-agent` ]]; then
#     
#     if test -f $HOME/.gpg-agent-info && kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
#         GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info | cut -c 16-`
#     else
#         eval `gpg-agent --daemon --no-grab $HOME/.gpg-agent-info`
#     fi
# 
#     export GPG_TTY=`tty`
#     export GPG_AGENT_INFO
#     
# fi

################################################################################
# Travis
################################################################################

# [ -f /Users/macmade/.travis/travis.sh ] && source /Users/macmade/.travis/travis.sh
# 
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
