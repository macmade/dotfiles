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

. ~/zsh/git-prompt.zsh

autoload -U promptinit && promptinit
autoload -U colors && colors

setopt prompt_subst

RPROMPT="[ %{$fg[green]%}%d%{$reset_color%} ] [ %{$fg[red]%}%D%{$reset_color%} ] [ %{$fg[yellow]%}%*%{$reset_color%} ]"
precmd () { __git_ps1 "[ %{$fg[cyan]%}%m%{$reset_color%} ]> [ %{$fg[blue]%}TTY%l%{$reset_color%} ]> [ %{$fg[magenta]%}%n %#%{$reset_color%} ]> " "" "[ %s ]> " }

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

setopt share_history

################################################################################
# Miscellaneous
################################################################################

# Use CLI colors
export CLICOLOR=1

# Colors for the LS command
export LSCOLORS=exfxcxdxbxxexgxbxdxcxf

# SVN options
export SVN_EDITOR=vi

# GIT options
export GIT_EDITOR=vi

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# YASM
export PATH=/usr/local/make/bin/:$PATH:/usr/local/xeos-build/yasm/bin/

################################################################################
# Aliases
################################################################################

alias ll="ls -alh"
alias top="top -o cpu"
alias ps="ps -axc -o pid,command,ppid,uid,gid,nice,pri,paddr,rss,vsz,%cpu,%mem,lstart,user"
alias dna="cd ~/Documents/Macmade/DigiDNA/"
alias mac="cd ~/Documents/Macmade/Development/Mac/"
alias ios="cd ~/Documents/Macmade/Development/iOS/"
alias github="cd ~/Documents/Macmade/Development/GitHub/"
alias xeos="cd ~/Documents/Macmade/Development/GitHub/XEOS/"
alias sw="cd ~/Documents/Macmade/SW-Source/"
alias web="cd /Library/WebStart/"
alias vps="ssh -l root 195.110.34.56"
alias gcc="/usr/local/gcc/bin/gcc"

################################################################################
# Additional Software
################################################################################


# MacPorts
export PATH=$PATH:/opt/local/bin

# Homebrew
export PATH=$PATH:/Users/macmade/Documents/Homebrew/bin
