
# wget https://raw.githubusercontent.com/osjayaprakash/dotfiles/master/new_machine_setup.sh -O - | zsh

set -ex

# CHANGE to Home
OLD_PWD=$PWD
cd ~

# Essentials
sudo apt-get --yes install zsh vim tmux git 

#Lightweight GUI - Diff tool
sudo apt-get --yes install meld 

# For YCM plugin and development
sudo apt-get --yes install build-essential python python-dev g++ clang 
# For YCM plugin and development
sudo apt-get --yes install clang-format clang-tidy pylint
which zsh
which vim 
which tmux
which git
which python

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
tail -n 1 $HOME/.zshrc | grep dotfiles/zsh/zshrc || echo '\nsource $HOME/dotfiles/zsh/zshrc' >> $HOME/.zshrc
tail -n 1 $HOME/.zshrc | grep dotfiles/zsh/zshrc

# TMUX
mv --backup=numbered $HOME/.tmux.conf $HOME/.tmux.conf.backup
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ls $HOME/.tmux.conf
# Install Tmux Plugin manager
test -e $HOME/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# VIM
mv --backup=numbered ~/.vimrc $HOME/.vimrc.backup
ln -s $HOME/dotfiles/vim/vimrc $HOME/.vimrc
# Install vundle
test -e $HOME/.vim/bundle/Vundle.vim || git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# Install all plugins
vim +PluginInstall +qall

# Move to last working directory.
cd $OLD_PWD

# zsh_reload
# source ~/.zshrc 
