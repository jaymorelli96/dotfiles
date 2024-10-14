# zsh plugins
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

# Key bindings 
# In insert mode
bindkey -M viins '^[[A' history-substring-search-up   # Up arrow
bindkey -M viins '^[[B' history-substring-search-down  # Down arrow

# In normal mode
bindkey -M vicmd '^[[A' history-substring-search-up   # Up arrow
bindkey -M vicmd '^[[B' history-substring-search-down  # Down arrow

# options
# zsh vi
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_CURSOR_STYLE_ENABLED=false

# zsh history search substring colors
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=#2e3440,fg=white,bold"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=#2e3440,fg=white,bold"

# zsh syntax highlight colors
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=yellow # for testing
ZSH_HIGHLIGHT_STYLES[precommand]=fg=#8fbcbb # for testing
ZSH_HIGHLIGHT_STYLES[arg0]=fg=#88c0d0
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=#bf616a 

# aliases
alias vim="nvim ."
alias ls="eza --icons"
alias ll="eza -lg --icons"
alias la="eza -lag --icons"
alias lt="eza -lTg --level=3 --icons"
alias lta="eza -lTag --level=3 --icons"
alias lt1="eza -lTg --level=1 --icons"
alias lt2="eza -lTg --level=2 --icons"

alias zshconfig="vim ~/.zshrc"

alias lg='lazygit'

alias cat='bat'
alias ccat='/bin/cat'

alias vfzf='vim $(fzf)'

# exports
export EDITOR="nvim"
export TERM="xterm-256color"
export BAT_THEME="Nord"
export VISUAL='nvim'
export XDG_CONFIG_HOME="$HOME/.config"

# evals
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
