#!/bin/sh
echo "Installing Packages"
if [[ "$OSTYPE" == "linux"* ]]
then
  pkcon install zsh vim emacs tmux urlview neovim neofetch nodejs npm util-linux-user mosh
elif [[ "$OSTYPE" == "darwin"* ]]
then
  brew install zsh vim emacs tmux urlview neovim neofetch node npm mosh
fi
clear

echo "Setting zsh as default shell"
chsh -s $(which zsh)

echo "Note: Please install a Nerd Font of your choice to use powerlevel10k"
echo "Please see: https://github.com/ryanoasis/nerd-fonts"

echo "Note: Please press C-b and then i to install tpm plugins"

echo "Please run :PlugInstall in Normal mode to activate neovim plugins"
echo "Please install the coc-extensions you wish to use"
echo "Please see: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions for a list"

echo "Copying config files"
cp -v .zshrc ~/.zshrc
cp -v .tmux.conf ~/
cp -v .p10k.zsh ~/
cp -v .vimrc ~/
cp -v .emacs ~/
cp -rv .config ~/
cp -rv bin ~/
echo "Finished"
