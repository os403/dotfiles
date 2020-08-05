# About
Development setup for vim, tmux and zsh to work across all unix-based machines.

# Prerequisites 

* Make sure that the machine/server has enough memory. YCM and databases use lot of memory. If it is not sufficient, add swap file equivalent of RAM size. https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04


# Installation

```shell
install zsh - sudo apt-get install zsh
wget https://raw.githubusercontent.com/osjaya/dotfiles/master/new_machine_setup.sh -O - | zsh
```

* Clone Git repo
```shell
cd $HOME
git clone https://github.com/osjaya/dotfiles
```

* Update Git repo
```shell
cd $HOME/dotfiles
git pull origin master
```

## YCM server
Compile the YCM-core by 
```shell
cd ~/.vim/bundle/YouCompleteMe 
./install.py --clang-completer 
./install.py --all
```

## Thyme
Thyme is tool to monitor the productivity (which window is actively used throughout the day).

```shell
# Install go language and git
sudo apt-get install golang git
# Install thyme
go get -u github.com/sourcegraph/thyme/cmd/thyme
```

Install the dependencies for thyme, 
```shell
$HOME/go/bin/thyme dep
## The above command will print the packages needed to be installed on this machine. 
## sudo apt-get install x11-utils xdotool wmctrl
```

Verify the thyme works, this should print the json output.
```shell
$HOME/go/bin/thyme track
```

Add the script to crontab, such that this script would run every minute.
```shell
crontab -e 
* * * * * sh $HOME/dotfiles/thyme.sh >> $HOME/Desktop/Thyme/thyme.log 2>&1
@reboot sh $HOME/dotfiles/startup.sh &
```
**NOTE** Add an empty line at the end of crontab configuration file.

