function fzf-git-commit --description 'Pick a git commit hash and insert it at the cursor'
    set -f commit (git log --no-merges --color=always --oneline | \
        fzf --ansi --scheme=history | \
        string split -f 1 ' ')

    if test -n "$commit"
        commandline --insert $commit
    end
end
