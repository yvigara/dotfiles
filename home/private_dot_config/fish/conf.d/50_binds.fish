function __bind_keys --on-event fish_startup
    functions -e (status current-function)

    bind \r  execute-or-preexec    # enhanced Enter: emit fish_preexec on empty line
    bind \er push-line             # save commandline, restore after next command
    bind !   history-prev-command  # !! expands to last command
    bind \$  history-prev-arguments # !$ expands to last argument

    # fzf.fish bindings (directory picker on Ctrl-O, variables on Ctrl-Alt-V)
    fzf_configure_bindings --directory=\co --variables=\ev

    # git pickers
    bind \eg fzf-git-switch   # Alt-g: branch picker
    bind \cg fzf-git-commit   # Ctrl-g: commit hash → insert at cursor
end
