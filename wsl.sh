sudo apt update && sudo apt upgrade
 
##zsh
sudo apt install zsh
zsh --version
cat /etc/shells
chsh -s $(which zsh)
echo $SHELL
$SHELL --version

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "⮀ ± ⭠ ➦ ✔ ✘ ⚡"

##git
sudo apt update && sudo apt upgrade
sudo apt install git

#user setting
git config --global user.name "Ryan ho"
git config --global user.email "ryan85118@gmail.com"
git config --global core.editor code
#End of line
git config --global core.autocrlf input

#add dracula theme for zsh
git clone https://github.com/dracula/zsh.git
cp ./zsh/dracula.zsh-theme /${USER}/.oh-my-zsh/themes/dracula.zsh-theme
cp -r ./zsh/lib /${USER}/.oh-my-zsh/themes/lib
cp ./.zshrc /${USER}/.zshrc
rm -r zsh
upgrade_oh_my_zsh

#git ssh
# ssh-keygen -t rsa -b 4096 -C "ryan85118@gmail.com" #replace with your email
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa

#Node.js

#Docker
# sudo apt-get update
# sudo apt-get install \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     gnupg-agent \
#     software-properties-common
# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io
# sudo service docker start
# sudo docker run hello-world

#Docker Compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# docker-compose --version