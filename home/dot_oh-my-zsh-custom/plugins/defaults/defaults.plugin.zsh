# -*- mode:sh; -*-
###############################################################################
export GOPATH=$HOME/golang
export GOROOT=$(brew --prefix)/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export PAGER="less -R"
export LESS="-R"
export CLICOLOR=1

