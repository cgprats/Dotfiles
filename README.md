# Dotfiles_B450-1_Debian


-----


**Dependencies:**
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

**Installation Instructions**

**zsh**
```
sudo apt install zsh
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
sudo apt install tmux
```
**tpm**
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
**urlview**
```
sudo apt install urlview
```