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
