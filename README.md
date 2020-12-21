# Dotfiles_B450-1_Linux


-----


# **Dependencies:**
* **zsh**
* oh-my-zsh
* zsh-syntax-highlighting
* zsh-autosuggestions
* powerlevel10k
* **tmux**
* tpm (tmux plugin manager)
* urlview
* **neovim**
* vim-plug
* pip3
* pynvim

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
**pip3**
```
sudo pkcon install python3-pip
```
**pynvim**
```
pip3 install --user pynvim
```


-----
# **File locations**
* .zshrc -> ~/.zshrc
    * To apply zsh changes run: `source ~/.zshrc`
* .tmux.conf -> ~/.tmux.conf
    * To apply tmux changes run: `tmux source ~/.tmux.conf`
* .p10k.zsh -> ~/.p10k.zsh
* .config/nvim/init.vim -> ~/.config/nvim.init.vim
     * To Install neovim plugins, launch neovim and run the following vim commands:
         * `:PlugInstall`
         * `:UpdateRemotePlugins`
