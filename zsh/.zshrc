eval "$(sheldon source)"

autoload -Uz compinit && compinit
zstyle ':completion:*' completer _complete _approximate _correct _prefix
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' list-colors di=34

setopt correct
setopt ignore_eof
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt share_history
setopt hist_ignore_all_dups
setopt inc_append_history

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

fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
                    -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
    zle reset-prompt
}
zle -N fd
bindkey '^g' fd

alias h='hx'
alias s='sudo'
alias del='rm -rf'
alias grep='grep --color=auto'

alias xi='sudo xbps-install'
alias xr='sudo xbps-remove'
alias xq='sudo xbps-query'
alias xs='xbps-src-install'
xbps-src-install() {
  ~/void-packages/xbps-src pkg $1 && xi -R hostdir/binpkgs $1
}
alias xs-Su='xbps-src-update'
xbps-src-update() {
    xi -Su && cd ~/void-packages && git pull && ./xbps-src update-sys
}

alias g='git'
alias gi='git init'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gs='git status'
alias gr='git remote'
alias gl='git log'
alias gps='git push'
alias gpl='git pull'
alias gcl='git clone'
alias gb='git branch'
alias gco='git checkout'

alias wezconf='h ~/.config/wezterm/wezterm.lua'
alias hyprconf='h ~/.config/hypr/hyprland.conf'

export PROMPT='
%F{4}%~
> %f'
export HISTFILE=~/.zsh_history
export SAVEHIST=65536
export HISTSIZE=65536
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export PATH=$PATH:~/.local/bin
