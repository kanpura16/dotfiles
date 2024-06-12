eval "$(sheldon source)"

autoload -Uz compinit && compinit
zstyle ':completion:*' completer _complete _approximate _correct _prefix
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' list-colors di=34

setopt correct
setopt auto_cd
setopt ignore_eof
setopt share_history
setopt hist_ignore_all_dups
setopt inc_append_history

export PATH=$PATH:~/.local/bin
export EDITOR=kak
export TERM=footclient
export HISTFILE=~/.zsh_history
export SAVEHIST=100000
export HISTSIZE=100000
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export PROMPT='
%F{4}%~
> %f'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias xi='sudo xbps-install'
alias xr='sudo xbps-remove'
alias xq='sudo xbps-query'

fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

fzf-z-search() {
    local res=$(z | sort -rn | cut -c 12- | fzf)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    fi
}
zle -N fzf-z-search
bindkey '^z' fzf-z-search
