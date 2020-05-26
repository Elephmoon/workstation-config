export ZSH="/home/alexandr/.oh-my-zsh"
ZSH_THEME="robbyrussell"

export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/alexandr/go
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:$GOPATH/bin/gocode

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vim="nvim"

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

# extract archive
extract () {
if [ -f $1 ] ; then
 case $1 in
 *.tar.bz2)   tar xjf $1        ;;
 *.tar.gz)    tar xzf $1     ;;
 *.bz2)       bunzip2 $1       ;;
 *.rar)       unrar x $1     ;;
 *.gz)        gunzip $1     ;;
 *.tar)       tar xf $1        ;;
 *.tbz2)      tar xjf $1      ;;
 *.tgz)       tar xzf $1       ;;
 *.zip)       unzip $1     ;;
 *.Z)         uncompress $1  ;;
 *.7z)        7z x $1    ;;
 *.tbz)       tar xjvf  ;;
 *)           echo "i dont now '$1'..." ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

# archive
pk () {
 if [ $1 ] ; then
 case $1 in
 tbz)       tar cjvf $2.tar.bz2 $2      ;;
 tgz)       tar czvf $2.tar.gz  $2       ;;
 tar)      tar cpvf $2.tar  $2       ;;
 bz2)    bzip $2 ;;
 gz)        gzip -c -9 -n $2 > $2.gz ;;
 zip)       zip -r $2.zip $2   ;;
 7z)        7z a $2.7z $2    ;;
 *)         echo "'$1' cannot be packed via pk()" ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

# rename file
name() {
    name=$1
    vared -c -p 'rename to: ' name
    command mv $1 $name
}
