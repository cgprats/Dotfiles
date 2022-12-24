#!/bin/sh
echo "Installing Packages"
if [[ "$OSTYPE" == "linux"* ]]
then
  if [[ -f /etc/os-release ]]
  then
    source /etc/os-release
    echo "Detected Linux distribution: $ID"
    case "$ID" in
    fedora*)
      sudo dnf install zsh vim-enhanced emacs tmux urlview neovim neofetch nodejs npm mosh
      ;;
    ubuntu*)
      sudo apt install zsh vim emacs tmux urlview neovim neofetch nodejs npm mosh
      ;;
    opensuse*)
      sudo zypper install zsh vim emacs tmux neovim nodejs-default npm-default mosh
      ;;
    debian*)
      sudo apt install vim emacs tmux urlview neovim neofetch nodejs npm mosh
      ;;
     *)
      pkcon install zsh vim-enhanced emacs tmux urlview neovim neofetch nodejs npm mosh
      ;;
    esac
  fi
elif [[ "$OSTYPE" == "darwin"* ]]
then
  brew install zsh vim emacs tmux urlview neovim neofetch node npm mosh
fi

echo "Setting zsh as default shell"
chsh -s $(which zsh)

echo "Note: Please install a Nerd Font of your choice to use powerlevel10k"
echo "Please see: https://github.com/ryanoasis/nerd-fonts"

echo "Note: Please press C-b and then i to install tpm plugins"

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
