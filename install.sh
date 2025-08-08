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
unzip "FiraCode.zip" -d "$HOME/.fonts/FiraCode/"
fc-cache -f

echo "Installing Starship"
mkdir -p $HOME/.local/bin
curl -sS https://starship.rs/install.sh | sh -s -- -b $HOME/.local/bin -y

echo "Installing LazyVim"
git clone https://github.com/LazyVim/starter $HOME/.config/nvim

echo "Installing spacemacs"
git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d

echo "Setting zsh as default shell"
chsh -s $(which zsh)

echo "Copying config files"
cp zshrc $HOME/.zshrc
cp tmux.conf $HOME/.tmux.conf
cp vimrc $HOME/.vimrc

echo "Configuring starship"
$HOME/.local/bin/starship preset nerd-font-symbols -o $HOME/.config/starship.toml

echo "Finished"
