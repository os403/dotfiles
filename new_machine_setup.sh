
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

# Tmux 
sudo rm -rf ~/.tmux.conf
ln -s $HOME/dotfiles/tmux/tmux.conf ~/.tmux.conf
ls ~/.tmux.conf

# Install oh-my-zsh if it is not installed already
test -e $HOME/.oh-my-zsh || wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
test -e $HOME/.oh-my-zsh

# INSTALL DOT FILES ( Keep this for last)
test -e $HOME/dotfiles || git clone https://github.com/osjayaprakash/dotfiles/
test -e $HOME/dotfiles
# append the link to dotfiles zshrc
tail -n 1 $HOME/.zshrc | grep dotfiles/zsh/zshrc || echo '\nsource $HOME/dotfiles/zsh/zshrc' >> ~/.zshrc
tail -n 1 $HOME/.zshrc | grep dotfiles/zsh/zshrc
# zsh_reload
# source ~/.zshrc 

# Move to last working directory.
cd $OLD_PWD
