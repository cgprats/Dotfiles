# Dotfiles


-----


# **Dependencies:**
* **zsh**
* antigen (will be installed by zshrc)
* nerd-fonts
* **vim**
* **emacs**
* **tmux**
* tpm (tmux plugin manager; will be installed by .tmux.conf)
* **neovim**
* Packer (will be installed by init.vim)
* **nodejs**
* **npm**

-----

# **Dependency Installation Instructions:**

**This is for when your current distribution is unsupported by install.sh**

**zsh**
```
sudo pkcon install zsh
```
**nerd-fonts**
* [Install a Nerd Font of your choice](https://github.com/ryanoasis/nerd-fonts)

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
**neovim**
```
sudo pkcon install neovim
```

**nodejs**
```
sudo pkcon install nodejs
```
**npm**
```
sudo pkcon install npm-default
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
* .config/nvim/init.lua -> ~/.config/nvim/init.lua
     * To Install neovim plugins, launch neovim and run the following vim commands:
         * `:PlugInstall`
     * Install coc extensions with `:CocInstall $extension_name`
     * I use the following coc extensions
         * coc-clangd
         * coc-git
         * coc-highlight
         * coc-java
         * coc-json
         * coc-omnisharp
         * coc-pyright
         * coc-sh
         * coc-spell-checker
         * coc-tsserver
         * coc-yank
