export PATH=$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="${ZSH:-/usr/share/oh-my-zsh}"  # set by NixOS, Arch fallback
export ZSH_CUSTOM=$HOME/.config/oh-my-zsh/custom

ZSH_THEME="custom"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

export HISTCONTROL=ignoreboth
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export EDITOR="nvim"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243"

bindkey "^H" backward-kill-word

command -v thefuck >/dev/null && eval $(thefuck --alias)

alias ls="eza"
alias ll="eza -lah"
alias cat="bat"
alias df="duf"

eval "$(zoxide init zsh)"

