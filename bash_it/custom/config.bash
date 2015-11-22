export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
#export PATH=$PATH:$GOROOT/bin
#export `gb info|sed -e 's/"//g'`
~/.vim/plugged/gruvbox/gruvbox_256palette_osx.sh

HISTSIZE=999999
HISTFILESIZE=$HISTSIZE
HISTCONTROL=erasedups
export MANWIDTH=80
VISUAL=vim
EDITOR=vim
PAGER="less -R"
LESS="-R"

export EDITOR VISUAL PAGER LESS
export CLICOLOR=1

export RERUN_HOME=$HOME/projects/puppet-rerun
export PATH=$PATH:$RERUN_HOME
export RERUN_MODULES=$RERUN_HOME/modules
[ -t 0 ] && export RERUN_COLOR=true
[ -r $RERUN_HOME/etc/bash_completion.sh ] && source $RERUN_HOME/etc/bash_completion.sh
