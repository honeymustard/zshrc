##################################################
# Zshrc
#
# @author Adrian Solumsmo
#
##################################################


##################################################
# Variables
##################################################

export ZHOME=~/zshrc
export ZSHRC="$ZHOME/.zshrc"
export ZSCRIPTS="$ZHOME/scripts"
export ZFUNCTIONS="$ZHOME/functions"
export ZWIDGETS="$ZHOME/widgets"
export VHOME=~/vimrc
export VIMRC="$VHOME/.vimrc"

EDITOR="vim"
HISTFILE="$ZHOME/.zshistory"
HISTSIZE=1000
SAVEHIST=1000

setopt nobeep
setopt autocd

zstyle ':compinstall' filename $ZSHRC

fpath=( $ZFUNCTIONS $ZWIDGETS "${fpath[@]}" )


##################################################
# Functions
##################################################

autoload -Uz compinit; compinit
autoload -Uz zcalc
autoload -Uz Startup; Startup
autoload -Uz Help
autoload -Uz Whoami


##################################################
# Antigen
##################################################

ANTI_SOURCE="$ZSCRIPTS/antigen.zsh"

if [ ! -f $ANTI_SOURCE ]; then
    curl -L git.io/antigen > $ANTI_SOURCE
fi

source $ANTI_SOURCE

antigen use oh-my-zsh
antigen theme robbyrussell

# Plugins
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen apply


##################################################
# Widgets
##################################################

# Go up a directory
autoload -Uz cd-up
zle -N cd-up
bindkey -M viins '^n' cd-up
bindkey -M vicmd '^n' cd-up

# Edit current command with Vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Prepend sudo to buffer
autoload -Uz prepend-sudo
zle -N prepend-sudo
bindkey -M viins '^[s' prepend-sudo

##################################################
# Key-Bindings
##################################################

bindkey -v
bindkey '^j' autosuggest-accept
bindkey '^k' autosuggest-execute


##################################################
# Aliases
##################################################

alias ":q=exit"
alias "h=history"
alias "ls=ls -lAh --group-directories-first --color=always"
alias "ve=$EDITOR $VIMRC"
alias "ze=$EDITOR $ZSHRC"
alias "zs=source $ZSHRC"
alias "zc=zcalc"
alias "exc=expressvpn connect"
alias "exd=expressvpn disconnect"
alias "exs=expressvpn status"
alias "exl=expressvpn list | more"
alias "cdh=cd ~/"
alias "cdz=cd $ZHOME"
alias "cdv=cd $VHOME"
alias "cdow=cd ~/Downloads"
alias "cdoc=cd ~/Documents"
alias "cdsite=cd ~/Sites"
alias "apgi=sudo apt-get install"
