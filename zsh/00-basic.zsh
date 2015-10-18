# Set up the prompt
#
#autoload -Uz promptinit
#promptinit
#prompt fade white
#autoload -U colors && colors

#compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


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

export BITBUCKET=/jp/bb/
NODE_NAME=`uname -n | tr '-' '_'`
OS=`uname -o | tr '/' '_'`
PDIR=${BITBUCKET}/settings/${NODE_NAME}/${OS}/ 
mkdir -p "${PDIR}"
HISTFILE=${PDIR}/zsh_history
source /jp/venv/app/bin/activate

alias cm="git pull origin master && git add --all /jp/bb/ && git commit -m 'text' && git push origin master"
alias rt="supervisorctl restart WishDone && service nginx restart"


