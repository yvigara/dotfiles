function push-line --description 'Save current commandline, clear it, restore it after next command'
    set -g __pushed_commandline (commandline)
    set -g __pushed_cursor (commandline --cursor)
    commandline --replace ''

    function __push_line_pop --on-event fish_prompt \
            --inherit-variable __pushed_commandline \
            --inherit-variable __pushed_cursor
        functions -e (status current-function)
        commandline $__pushed_commandline
        commandline --cursor $__pushed_cursor
        commandline -f repaint
    end
end
