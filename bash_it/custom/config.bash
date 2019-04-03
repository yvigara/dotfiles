export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette_osx.sh"

HISTSIZE=999999
HISTFILESIZE=100000
HISTCONTROL="erasedups:ignoreboth"
HISTTIMEFORMAT="%y-%m-%d %H:%M:%S "
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
shopt -s histappend
export MANWIDTH=80
VISUAL=vim
EDITOR=vim
PAGER="less -R"
LESS="-R"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

export EDITOR VISUAL PAGER LESS
export CLICOLOR=1
