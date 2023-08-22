# Options
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
export TERM="xterm-256color"

#Plugins
plugins=(git colored-man-pages z vi-mode)

#Theme
ZSH_THEME="nord-extended/nord"

## User configuration
#To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Vi mode
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -v
export KEYTIMEOUT=1

# Use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd v edit-command-line

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# NVIM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"   This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Source LFCD command
LFCD="/home/jay/bin/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bindkey -s '^o' 'lfcd\n' 

## EXPORTS
export ZSH="$HOME/.oh-my-zsh"
export GOPATH="$HOME/go"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin"
source $ZSH/oh-my-zsh.sh

# Default editor
export EDITOR='lvim'
export VISUAL='lvim'

## Aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="cd ~/.config/lvim; vim"
alias projects="cd ~/Dev/Projects/"
alias personal="cd ~/Dev/Projects/Personal"
alias notes="cd ~/notes; vim"
alias antlr='java -jar ~/bin/antlr-4.7-complete.jar'
alias vim=lvim
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'
alias f='lfcd'
alias t='todo.sh'
alias lg='lazygit'
alias k3start='sudo $(which k3s) server'
alias cat='batcat'
   
# Homebrew installation
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Syntax highlighting - must be at the bottom of this file
source /home/jay/Documents/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

