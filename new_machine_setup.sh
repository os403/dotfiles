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

# USE oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# INSTALL DOT FILES
git clone https://github.com/osjayaprakash/dotfiles/
echo '' >> ~/.zshrc # append empty line
echo 'source $HOME/dotfiles/zshrc' >> ~/.zshrc  ## append the link to dotfiles zshrc
source ~/.zshrc  #zsh_reload

# Tmux 
sudo rm -rf ~/.tmux.conf
ln -s $HOME/dotfiles/.tmux.conf ~/.tmux.conf

# Move to last working directory.
cd $OLD_PWD
