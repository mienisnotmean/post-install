#!/bin/bash

func_install() {
    if pacman -Qi $1 &> /dev/null; then
	tput setaf 2
  	echo "###############################################################"
  	echo "# The package " $1 " is already installed"
      	echo "###############################################################"
      	echo; tput sgr0
    else
    	tput setaf 3
    	echo "###############################################################"
    	echo "# Installing package " $1
    	echo "###############################################################"
    	echo; tput sgr0
    	sudo pacman -S --noconfirm --needed $1
    fi
}

func_uninstall() {
    if pacman -Qi $1 &> /dev/null; then
        tput setaf 3
    	echo "###############################################################"
    	echo "# Remove package " $1
    	echo "###############################################################"
    	echo; tput sgr0
    	sudo pacman -Rsncdd --noconfirm --needed $1
    else
        tput setaf 2
  	    echo "###############################################################"
  	    echo "# The package " $1 " is not installed"
        echo "###############################################################"
        echo; tput sgr0
    fi
}

package_list=(
    trizen
    base-devel
    firefox
    thunderbird
    keepassxc
    emacs
    npm
    python-pip
    go
    terraform
    kubernetes
    net-tools
    awesome-terminal-fonts
    ttf-font-awesome
)

remove_package_list=(
    kvantum-manager
    gedit
    epiphany
    ranger
)

count=0

for name in "${package_list[@]}" ; do
    count=$[count+1]
    tput setaf 3;echo "Installing package nr. " $count " " $name;tput sgr0;
    func_install $name
done

for name in "${remove_package_list[@]}" ; do
    count=$[count+1]
    tput setaf 3;echo "Remove package nr. " $count " " $name;tput sgr0;
    func_uninstall $name
done

sudo -u mien git clone https://github.com/mienisnotmean/.emacs.d.git /home/mien/.emacs.d

tput setaf 2;
echo "################################################################"
echo "# Packages have been installed"
echo "################################################################"
echo;tput sgr0
