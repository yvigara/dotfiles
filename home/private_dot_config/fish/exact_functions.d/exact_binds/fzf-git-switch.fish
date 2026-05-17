function fzf-git-switch --description 'Interactively pick a git branch to checkout'
    set -f branch (git branch --color=always --sort=-committerdate | \
        fzf --tac --no-sort --ansi --query (commandline))

    if test -n "$branch"
        git checkout (string trim --left --chars='* ' $branch)
    end

    commandline -f repaint
end
