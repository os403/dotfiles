#!/bin/zsh -f

################################################################################
# Get keys working
#
# For this to work you have to first run 'zsh /usr/share/zsh/4.3.4/functions/Misc/zkbd'.
# The location of this script on your system may vary.
# Also note you must change the 'source' line below to match your zkbd config.
#################################################################################

autoload -Uz zkbd
bindkey -v
if [[ -f ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE} ]]; then
    source ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE}
else
    echo "WARNING: Keybindings may not be set correctly!"
    echo "Execute \`zkbd\` to create bindings."
fi

#################################################################################
# Set some keybindings
#################################################################################
# Bind the keys that zkbd set up to some widgets
[[ -n "${key[Home]}" ]]    && bindkey "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}" ]]     && bindkey "${key[End]}"     end-of-line
[[ -n "${key[Insert]}" ]]  && bindkey "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}" ]]  && bindkey "${key[Delete]}"  delete-char
[[ -n "${key[Up]}" ]]      && bindkey "${key[Up]}"      up-line-or-search
[[ -n "${key[Down]}" ]]    && bindkey "${key[Down]}"    down-line-or-search
[[ -n "${key[Left]}" ]]    && bindkey "${key[Left]}"    backward-char
[[ -n "${key[Right]}" ]]   && bindkey "${key[Right]}"   forward-char
[[ -n "${key[C-Up]}" ]]    && bindkey "${key[C-Up]}"    history-beginning-search-backward
[[ -n "${key[C-Down]}" ]]  && bindkey "${key[C-Down]}"  history-beginning-search-forward
[[ -n "${key[C-Left]}" ]]  && bindkey "${key[C-Left]}"  backward-word
[[ -n "${key[C-Right]}" ]] && bindkey "${key[C-Right]}" forward-word
[[ -n "${key[C-R]}" ]]     && bindkey "${key[C-R]}"     history-incremental-search-backward
[[ -n "${key[C-T]}" ]]     && bindkey "${key[C-T]}"     history-incremental-search-forward

bindkey -v "^g" beginning-of-line
bindkey -v "^G" end-of-line
bindkey -v "^K" kill-line
bindkey -v "^L" clear-screen
bindkey -v "^R" history-incremental-search-backward
bindkey -v "^U" kill-whole-line
bindkey -v "^V" quoted-insert
bindkey -v "^W" backward-kill-word

bindkey -v "^N" down-history
bindkey -v "^P" up-history

bindkey -v "^[H" run-help
bindkey -v "^[h" run-help

# alow for editing of the command line
# http://zshwiki.org/home/examples/zlewidgets
autoload -U     edit-command-line
zle -N          edit-command-line
bindkey -v '^E' edit-command-line

# ^L to pipe through $PAGER and execute
bindkey -s '^P' "|$PAGER\n"

# Show dots while waiting to complete. Useful for systems with slow net access,
# like those places where they use giant, slow NFS solutions. (Hint.)
expand-or-complete-with-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# This inserts a tab after completing a redirect. You want this.
# (Source: http://www.zsh.org/mla/users/2006/msg00690.html)
self-insert-redir() {
    integer l=$#LBUFFER
    zle self-insert
    (( $l >= $#LBUFFER )) && LBUFFER[-1]=" $LBUFFER[-1]"
}
zle -N self-insert-redir
for op in \| \< \> \& ; do
    bindkey "$op" self-insert-redir
done

