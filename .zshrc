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

EDITOR="vim"
HISTFILE="$ZHOME/.zshistory"
HISTSIZE=1000
SAVEHIST=1000

setopt nobeep
setopt autocd

zstyle ':compinstall' filename $ZSHRC


##################################################
# Commands
##################################################

fpath=( $ZFUNCTIONS "${fpath[@]}" )

autoload -Uz compinit; compinit
autoload -Uz Startup; Startup
autoload -Uz Help
autoload -Uz Whoami


##################################################
# Antigen
##################################################

source /usr/share/zsh-antigen/antigen.zsh

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

function cd-up {
    cd .. && zle accept-line
}

zle -N cd-up

##################################################
# Key-Bindings
##################################################

bindkey -v
bindkey '^n' cd-up
bindkey '^j' autosuggest-accept
bindkey '^k' autosuggest-execute


##################################################
# Aliases
##################################################

alias "ls=ls -lAh --group-directories-first --color=always"
alias "ze=$EDITOR $ZSHRC"
alias "zs=source $ZSHRC"
