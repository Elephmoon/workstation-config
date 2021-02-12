export ZSH="/home/alexandr/.oh-my-zsh"
ZSH_THEME="robbyrussell"

export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/alexandr/go
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:$GOPATH/bin/gocode
export PATH=$PATH:/usr/bin/llvm-config
plugins=(git)

source $ZSH/oh-my-zsh.sh

# aliases
alias vi="nvim"
alias vim="nvim"

# path aliases
alias workdir="cd ~/go/src/github.com"

# git aliases
alias gst="git status"
alias gd="git diff"
alias gc="git commit"
alias gp="git push"
alias ga="git add"

# docker aliases
alias ds="docker stop"
alias di="docker images"
alias dp="docker ps"
alias dcu="dcoker-compose up"
alias dcp="docker-compose pull"
alias dcd="docker-compose down"
alias dcs="docker-compose stop"

setopt AUTO_CD
ENABLE_CORRECTION="true"

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/alexandr/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

