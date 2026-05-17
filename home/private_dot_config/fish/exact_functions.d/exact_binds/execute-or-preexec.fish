function execute-or-preexec --description 'Execute command, or emit fish_preexec if commandline is empty'
    set -f cmdline (commandline)
    if test -z "$cmdline"
        emit fish_preexec
    end
    commandline -f execute
end
