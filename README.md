# About
Development setup for vim, tmux and zsh to work across all unix-based machines.

# Prerequisites 

* Make sure that the machine/server has enough memory. YCM and databases use lot of memory. If it is not sufficient, add swap file equivalent of RAM size. https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04


# Installation

* install zsh - sudo apt-get install zsh

wget https://raw.githubusercontent.com/osjayaprakash/dotfiles/master/new_machine_setup.sh -O - | zsh

# Issues 

## YCM server
Compile the YCM-core by 
* cd ~/.vim/bundle/YouCompleteMe 
* ./install.py --clang-completer 
* ./install.py --all

