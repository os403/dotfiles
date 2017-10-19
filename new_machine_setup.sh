
# wget https://raw.githubusercontent.com/osjayaprakash/dotfiles/master/new_machine_setup.sh -O - | zsh

set -ex

# CHANGE to Home
OLD_PWD=$PWD
cd ~

sudo apt-get install zsh vim tmux git
which zsh
which vim 
which tmux
which git

# Git setting
git config --global user.name osjayaprakash
git config --global user.email osjayaprakash@gmail.com
git config --global credential.helper 'cache --timeout=86400' # store the password for one day

# CHANGE TO ZSH
chsh -s $(which zsh)

# Install oh-my-zsh if it is not installed already
test -e $HOME/.oh-my-zsh || wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
test -e $HOME/.oh-my-zsh

# INSTALL DOT FILES ( Keep this for last)
test -e $HOME/dotfiles || git clone https://github.com/osjayaprakash/dotfiles/
test -e $HOME/dotfiles
# append the link to dotfiles zshrc
tail -n 1 $HOME/.zshrc | grep dotfiles/zsh/zshrc || echo '\nsource $HOME/dotfiles/zsh/zshrc' >> ~/.zshrc
tail -n 1 $HOME/.zshrc | grep dotfiles/zsh/zshrc

# TMUX
sudo rm -f ~/.tmux.conf
ln -s $HOME/dotfiles/tmux/tmux.conf ~/.tmux.conf
ls ~/.tmux.conf

# VIM
sudo rm -f ~/.vimrc
ln -s $HOME/dotfiles/vim/vimrc ~/.vimrc
# Install vundle
test -e ~/.vim/bundle/Vundle.vim || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install all plugins
vim +PluginInstall +qall

# Move to last working directory.
cd $OLD_PWD

# zsh_reload
# source ~/.zshrc 
