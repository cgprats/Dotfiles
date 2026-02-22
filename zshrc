# Set PATH
## Add homebrew to path if on macOS
if [[ $OSTYPE == "darwin"* ]]
then
	export PATH=/opt/homebrew/bin:$PATH
fi
export PATH=$HOME/bin:$HOME/.local/bin:$PATH:/var/lib/flatpak/exports/bin:/usr/local/sbin:/usr/sbin:/sbin

# Set MANPATH
export MANPATH=/usr/local/man:$MANPATH

# Set MANPAGER
export MANPAGER='nvim +Man!'

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
alias less="nvim +Man!"

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
antigen bundle tmux
antigen bundle web-search
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Automatically start tmux
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_FIXCOLORS=true

# Apply Antigen settings
antigen apply

# Enable starship
eval "$(starship init zsh)"
