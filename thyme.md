Thyme is 

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

Verify the thyme works
```shell
$HOME/go/bin/thyme track
```

Add the script to crontab, such that this script would run every minute.
```shell
crontab -e 
* * * * * $HOME/Desktop/thyme/thyme.sh
```
