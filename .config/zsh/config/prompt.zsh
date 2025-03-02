#PROMPT
# time user@machine dir git 
# $ command line
precmd() {vcs_info}

setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'

PROMPT="%F{blue}[%F{red}%T %n@%m%f%F{blue}]%f %F{cyan}%~%f
%F{green}$%f "

# %F{yellow} ${vcs_info_msg_0_}%f

