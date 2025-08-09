#GENERAL SETTINGS
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="nvim"
export VISUAL="nvim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE="10000"
export SAVEHIST="10000"

#PROMPT
#fpath=($ZDOTDIR/config/prompt.zsh $fpath)
#autoload -Uz prompt.zsh; prompt.zsh
PROMPT="%F{blue}[%F{red}%T %n@%m%f%F{blue}]%f %F{cyan}%~%f
%F{green}$%f "

#COMPLETATION
autoload -U compinit; compinit

#ALIASES
source $ZDOTDIR/config/aliases.zsh

