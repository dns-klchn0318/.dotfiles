# ~/.zshrc

# Homebrew (Apple Silicon)
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:$PATH"
export PYTHONDONTWRITEBYTECODE=1
export EDITOR=nvim
export VISUAL=nvim
export PAGER=bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# История и дополнение
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY HIST_REDUCE_BLANKS
setopt AUTO_CD CORRECT
bindkey -v
autoload -Uz compinit && compinit

# Навигация и просмотр
alias ls='eza --icons=auto'
alias ll='eza -lah --icons=auto --git'
alias lt='eza --tree --icons=auto --level=2'
alias cat='bat --style=plain'
alias catn='bat'
alias cdi='zi'
alias search='rg --type md'
alias help='tldr'

# Редактор, Git и контейнеры
alias v='nvim'
alias gs='git status --short --branch'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias cstart='colima start'
alias cstop='colima stop'

# Codex
if [[ -x "$HOME/Applications/tuipo/tuipo" ]] || (( $+commands[tuipo] )); then
  alias codex="tuipo -- codex"
fi

# Подсказки и подсветка используют цвета палитры Terminal.app
if [[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
fi
if [[ -r /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# >>> tuipo PATH >>>
export PATH="$HOME/Applications/tuipo:$PATH"
# <<< tuipo PATH <<<
