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
      sudo dnf group install development-tools
      sudo dnf install zsh vim-enhanced emacs tmux neovim fastfetch mosh ripgrep fd-find luarocks gawk curl fzf
      ;;
    ubuntu*)
      sudo apt install zsh vim emacs tmux neovim neofetch mosh
      ;;
    opensuse*)
      sudo zypper install zsh vim emacs tmux neovim mosh
      ;;
    debian*)
      sudo apt install vim emacs tmux neovim neofetch mosh
      ;;
     *)
      pkcon install zsh vim-enhanced emacs tmux neovim neofetch mosh
      ;;
    esac
  fi
elif [[ "$OSTYPE" == "darwin"* ]]
then
  xcode-select --install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install zsh vim emacs tmux neovim neofetch mosh lazygit fzf ripgrep fd
fi

echo "Setting zsh as default shell"
chsh -s $(which zsh)

echo "Note: Please press C-b and then i to install tpm plugins"

echo "Copying config files"
cp -v .zshrc ~/.zshrc
cp -v .tmux.conf ~/
cp -v .p10k.zsh ~/
cp -v .vimrc ~/
cp -v .emacs ~/

echo "Installing LazyVim"
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo "You will have to manually install a Nerd Font for LazyVim"

echo "Finished"
