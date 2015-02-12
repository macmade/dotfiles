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
export SVN_EDITOR=vi

# GIT options
export GIT_EDITOR=vi

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

################################################################################
# Aliases
################################################################################

alias ll="ls -alh"
alias ps="ps -axc -o pid,command,ppid,uid,gid,nice,pri,paddr,rss,vsz,%cpu,%mem,lstart,user"
alias vps="ssh -l root 195.110.34.56"

if [[ `uname -s` == "Darwin" ]];                        then alias top="top -o cpu"; fi
if [ -d ~/Documents/Macmade/DigiDNA/ ];                 then alias dna="cd ~/Documents/Macmade/DigiDNA/"; fi
if [ -d ~/Documents/Macmade/Development/Mac/ ];         then alias mac="cd ~/Documents/Macmade/Development/Mac/"; fi
if [ -d ~/Documents/Macmade/Development/iOS/ ];         then alias ios="cd ~/Documents/Macmade/Development/iOS/"; fi
if [ -d ~/Documents/Macmade/Development/GitHub/ ];      then alias github="cd ~/Documents/Macmade/Development/GitHub/"; fi
if [ -d ~/Documents/Macmade/Development/GitHub/XEOS/ ]; then alias xeos="cd ~/Documents/Macmade/Development/GitHub/XEOS/"; fi
if [ -d ~/Documents/Macmade/SW-Source/ ];               then alias sw="cd  ~/Documents/Macmade/SW-Source/"; fi
if [ -d /Library/WebStart/ ];                           then alias web="cd /Library/WebStart/"; fi
if [ -f /usr/local/gcc/bin/gcc ];                       then alias gcc="/usr/local/gcc/bin/gcc"; fi

################################################################################
# Additional Software
################################################################################

if [ -d /opt/local/bin ];                   then export PATH=$PATH:/opt/local/bin; fi
if [ -d /usr/local/make/bin ];             then export PATH=/usr/local/make/bin:$PATH; fi
if [ -d /usr/local/xeos-build/yasm/bin ];  then export PATH=$PATH:/usr/local/xeos-build/yasm/bin; fi
