# all of our zsh files
typeset -U config_files
config_files=($HOME/dotfiles/**/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

unset config_files

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a $HOME/zshrc.local ]] then
  source $HOME/zshrc.local
else
  source $HOME/dotfiles/zshrc.local
fi

if [[ -a /jp/venv/app/bin/activate ]] then
  source /jp/venv/app/bin/activate
fi
