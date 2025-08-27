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
      sudo apt install zsh vim emacs tmux neovim fastfetch mosh rust-ripgrep rust-fdfind gawk curl fzf unzip build-essential
      ;;
    opensuse*)
      sudo zypper install -t pattern devel_basis
      sudo zypper install zsh vim emacs tmux fastfetch mosh ripgrep fd lua54-luarocks gawk curl fzf unzip
      ;;
    debian*)
      sudo apt install vim emacs tmux neovim fastfetch mosh rust-ripgrep rust-fdfind luarocks gawk curl fzf unzip build-essential
      ;;
    *)
      pkcon install zsh vim-enhanced emacs tmux neovim fastfetch mosh ripgrep fd-find luarocks gawk curl fzf unzip gcc
      ;;
    esac
  fi
elif [[ "$OSTYPE" == "darwin"* ]]
then
  xcode-select --install
  if ! command -v brew
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew install zsh vim emacs-app tmux neovim fastfetch mosh lazygit fzf ripgrep fd unzip gnu-tar
fi

echo "Installing metric-compatible nerd fonts to defaults on KDE, Windows, and macOS alongside Atkinson Hyperlegible."
if [[ "$OSTYPE" == "linux"* ]]
then
  curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/AtkinsonHyperlegibleMono.zip"
  curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip"
  curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip"
  curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Noto.zip"
  mkdir -p ~/.fonts
  unzip "AtkinsonHyperlegibleMono.zip" -d "$HOME/.fonts/AtkinsonHyperlegibleMono/"
  unzip "CascadiaCode.zip" -d "$HOME/.fonts/CascadiaCode/"
  unzip "Meslo.zip" -d "$HOME/.fonts/Meslo"
  unzip "Noto.zip" -d "$HOME/.fonts/Noto"
  fc-cache -f
elif [[ "$OSTYPE" == "darwin"* ]]
then
  brew install --cask font-atkynson-mono-nerd-font font-caskaydia-cove-nerd-font font-meslo-lg-nerd-font font-noto-nerd-font font-sf-mono-nerd-font-ligaturized
fi

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
cp spacemacs $HOME/.spacemacs

echo "Configuring starship"
$HOME/.local/bin/starship preset nerd-font-symbols -o $HOME/.config/starship.toml

echo "Finished"
