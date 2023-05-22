# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Theme
# SH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

# Plugins
plugins=(git colored-man-pages z aliases vi-mode zsh-syntax-highlighting)

### User configuration
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

### Aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="cd ~/.config/lvim; vim"

alias vim=lvim

alias ls=lsd
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias f='lfcd'
# Vi mode
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -v
export KEYTIMEOUT=1
# use the vi navigation keys in menu completion
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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# Source theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Source LFCD file manager 
LFCD="$GOPATH/src/github.com/gokcehan/lf/etc/lfcd.sh"  
LFCD="/home/jay/.config/lf/lfcd.sh"                               
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

### EXPORTS
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export GOPATH="$HOME/go"

source $ZSH/oh-my-zsh.sh
# Default editor
export EDITOR='lvim'
export VISUAL='lvim'  
