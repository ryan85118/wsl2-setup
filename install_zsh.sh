#frist to run
sudo apt update && sudo apt upgrade

##install git zsh
sudo apt-get install -y git zsh

#check version and shells path
zsh --version
cat /etc/shells

#set zsh as the default shell
chsh -s $(which zsh)

#check default shell
echo $SHELL
$SHELL --version


sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Automatically load the linux .zshrc from above