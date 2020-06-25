# -*- mode:sh; -*-
###############################################################################
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
VISUAL=vim
EDITOR=vim
PAGER="less -R"
LESS="-R"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

export EDITOR VISUAL PAGER LESS
export CLICOLOR=1

if [ -d "$HOME/bin" ]; then
  export PATH="$PATH:$HOME/bin"
fi

fpath=('/usr/local/share/zsh-completions' $fpath)
[[ ! -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] || source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ -n "$(which direnv)" ]; then
  eval "$(direnv hook zsh)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
