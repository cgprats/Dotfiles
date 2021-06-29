#!/bin/bash
echo "Installing Packages"
pkcon install zsh vim emacs tmux urlview neovim neofetch
clear

echo "Setting zsh as default shell"
chsh -s $(which zsh)

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
ZSH_CUSTOM=~/.oh-my-zsh/custom

echo "Installing zsh plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Note: Please install a Nerd Font of your choice to use powerlevel10k"
echo "Please see: https://github.com/ryanoasis/nerd-fonts"

echo "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Note: Please press C-b and then i to install tpm plugins"

echo "Installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Note: Please install pynvim if it is not installed alongside neovim"
echo "Please run :PlugInstall and :UpdateRemotePlugins in Normal mode to activate neovim plugins"

echo "Copying config files"
cp -v .zshrc ~/.zshrc
cp -v .tmux.conf ~/
cp -v .p10k.zsh ~/
cp -v .vimrc ~/
cp -v .emacs ~/
cp -rv .config ~/
cp -rv bin ~/
echo "Finished"
