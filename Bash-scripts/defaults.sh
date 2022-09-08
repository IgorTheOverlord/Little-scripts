#! /bin/bash

clear

###  update-upgrade ###

sudo apt update -y

read -p 'Do you want to upgrade? [Y/N]: ' answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo apt upgrade -y

else

	:

fi

#######################

#######  tools  #######

sudo apt install git curl net-tools htop -y

#######################

########  vim  ########

sudo apt install vim -y

mkdir ~/.vim/ ~/.vim/colors

if [[ ! -e ~/.vim/colors/gruvbox.vim ]]; then

 wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P ~/.vim/colors/ 

else

	:

fi

echo "set number				 
set relativenumber				 
syntax on						 
set tabstop=4					 
set shiftwidth=4				 
set autoindent					 
set mouse=a						 
set background=dark				 
colorscheme gruvbox" > ~/.vimrc  


#######################


########  zsh  ########

sudo apt install zsh -y


sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="darkblood"/g' ~/.zshrc

#######################

read -p "Auto-remove unnecessary? [Y/N]: " answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	sudo apt autoremove

else

	:

fi


read -p "Reboot needed, reboot? [Y/N]: " answer

if [[ "$answer" == 'y' || "$answer" == 'Y' ]]; then

	reboot

else

	:

fi
