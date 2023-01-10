# Set PATH
## Add homebrew to path if on macOS
if [[ $OSTYPE == "darwin"* ]]
then
	export PATH=/opt/homebrew/bin:$PATH
fi
export PATH=$HOME/bin:$HOME/.local/bin:$PATH:/var/lib/flatpak/exports/bin:/usr/local/sbin:/usr/sbin:/sbin

# Set terminal type
export TERM="xterm-256color"

# Set MANPATH
export MANPATH=/usr/local/man:$MANPATH

# Set LANG
export LANG=en_US.UTF-8

# Enable globbing
setopt nonomatch

# Set EDITOR
export EDITOR=vim

# Set aliases
alias doas="sudo"
alias vim="nvim"
alias emacs="emacs -nw"

# Set platform specific aliases
if [[ $OSTYPE == "darwin"* ]]
then
	alias gdb="lldb"
fi

# Antigen configuration
# Install Antigen if missing
if [ ! -f ~/.antigen.zsh ]
then
	curl -L git.io/antigen > ~/.antigen.zsh
fi

# Enable Antigen
source ~/.antigen.zsh

# Use oh-my-zsh plugins
antigen use oh-my-zsh

# Load plugins
# Plugins that should be used regardless of platform
antigen bundle git
antigen bundle copyfile
antigen bundle dirhistory
antigen bundle extract
antigen bundle python
antigen bundle sudo
antigen bundle web-search
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Set the theme
antigen theme romkatv/powerlevel10k

# Apply Antigen settings
antigen apply

# Load powerlevel10k configuration
DEFAULT_USER=$(whoami)
prompt_context(){}
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load Tmux on interactive shell
# This does not work reliably under macOS and WSL
if [[ "$OSTYPE" != "darwin"* ]]
then
	[[ $- != *i* ]] && return
	[[ -z "$TMUX" ]] && exec tmux
fi
