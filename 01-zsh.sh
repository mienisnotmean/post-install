#!/bin/bash

omzpath=/home/mien/.config/oh-my-zsh

git clone https://github.com/ohmyzsh/ohmyzsh.git $omzpath

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $omzpath/custom/themes/powerlevel10k

git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $omzpath/custom/plugins/zsh-autosuggestions

git clone --depth=1 https://github.com/zsh-users/zsh-completions.git $omzpath/custom/plugins/zsh-completions

git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $omzpath/custom/plugins/zsh-syntax-highlighting

cp arch_install/dotfiles/.zshrc /home/mien/.zshrc

tput setaf 11;
echo "################################################################"
echo "# Oh-my-zsh have been installed"
echo "################################################################"
echo;tput sgr0
