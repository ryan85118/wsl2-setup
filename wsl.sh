
sudo apt update && sudo apt upgrade

###zsh###
sudo apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
###zsh###
sudo hwclock -s

###git###
sudo apt update && sudo apt upgrade
sudo apt install git

#End of line
git config --global core.autocrlf input

###git###

#