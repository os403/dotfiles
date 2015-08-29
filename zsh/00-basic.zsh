## EDIT COMMANDS
autoload      edit-command-line
zle -N        edit-command-line
bindkey '\ee' edit-command-line
VISUAL='/usr/bin/vim'
EDITOR='/usr/bin/vim'


#### OTHERS
COMPLETION_WAITING_DOTS="true"

# cd by .. or ... or ... or mv file ..../.
alias '..'='cd ..'
alias -g ...='../..'
alias -g ..4='../../..'
alias -g ..5='../../../..'


autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

