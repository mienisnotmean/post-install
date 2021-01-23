#!/bin/bash

func_install() {
    if pacman -Qi $1 &> /dev/null; then
	tput setaf 2
  	echo "###############################################################"
  	echo "# The package " $1 " is already installed"
    echo "###############################################################"
    echo;tput sgr0
    else
    	tput setaf 2
    	echo "###############################################################"
    	echo "# Installing package " $1
    	echo "###############################################################"
    	echo;tput sgr0
    	trizen -S --noconfirm --needed $1
    fi
}

package_list=(
    spotify
    teams
    ant-dracula-gtk-theme
    jetbrains-toolbox
    nerd-fonts-jetbrains-mono
)

count=0

curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -

for name in "${package_list[@]}" ; do
    count=$[count+1]
    tput setaf 3;echo "Installing package nr. " $count " " $name;tput sgr0;
    func_install $name
done

tput setaf 2;
echo "################################################################"
echo "# AUR Packages have been installed"
echo "################################################################"
echo;tput sgr0
