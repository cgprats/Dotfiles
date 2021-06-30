# Dotfiles


-----


# **Dependencies:**
* **zsh**
* oh-my-zsh
* zsh-syntax-highlighting
* zsh-autosuggestions
* powerlevel10k
* **vim**
* **emacs**
* **tmux**
* tpm (tmux plugin manager)
* urlview
* **neovim**
* vim-plug
* nodejs

-----

# **Dependency Installation Instructions:**

**Use Your Distribution's Package Manager in place of pkcon if you do not have PackageKit**

**zsh**
```
sudo pkcon install zsh
```
**oh-my-zsh**
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
**zsh-syntax-highlighting**
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

```
**zsh-autosuggestions**
```
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

```
**powerlevel10k**
1. [Install a Nerd Font of your choice](https://github.com/ryanoasis/nerd-fonts)
2. Run the following command:
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
**vim**
```
sudo pkcon install vim
```
**emacs**
```
sudo pkcon install emacs
```
**tmux**
```
sudo pkcon install tmux
```
**tpm**
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
**urlview**
```
sudo pkcon install urlview
```
**neovim**
```
sudo pkcon install neovim
```
**vim-plug**
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
**nodejs**
```
sudo pkcon install nodejs
```

-----
# **File locations**
* .zshrc -> ~/.zshrc
    * To apply zsh changes run: `source ~/.zshrc`
    * If you have an error relating to missing plugins, try removing the $VENDOR plugin.
    * If on macOS or on some WSL distros, remove the autostart tmux block.
* .tmux.conf -> ~/.tmux.conf
    * To apply tmux changes run: `tmux source ~/.tmux.conf`
* .p10k.zsh -> ~/.p10k.zsh
* .vimrc -> ~/.vimrc
* .emacs -> ~/.emacs
* .config/nvim/init.vim -> ~/.config/nvim.init.vim
     * To Install neovim plugins, launch neovim and run the following vim commands:
         * `:PlugInstall`
     * Install coc extensions with `:CocInstall $extension_name`
     * I use the following coc extensions
         * coc-clangd
         * coc-json
         * coc-sh
         * coc-spellchecker
