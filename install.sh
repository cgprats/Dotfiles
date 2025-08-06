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
      sudo dnf install zsh vim-enhanced emacs tmux neovim fastfetch mosh ripgrep fd-find luarocks gawk curl fzf unzip
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
  brew install zsh vim emacs tmux neovim neofetch mosh lazygit fzf ripgrep fd unzip
fi

echo "Installing FiraCode Nerd Font"
curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
mkdir -p ~/.fonts
unzip "FiraCode.zip" -d "~/.fonts/FiraCode/"
fc-cache -fv

echo "Installing Starship"
mkdir -p ~/.local/bin
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y

echo "Installing LazyVim"
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo "Installing spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

echo "Setting zsh as default shell"
chsh -s $(which zsh)

echo "Copying config files"
cp -v .zshrc ~/.zshrc
cp -v .tmux.conf ~/
cp -v .vimrc ~/

echo "Configuring starship"
~/.local/bin/starship preset nerd-font-symbols -o ~/.config/starship.toml

echo "Finished"
