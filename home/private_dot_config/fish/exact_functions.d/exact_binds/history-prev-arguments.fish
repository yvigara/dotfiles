function history-prev-arguments --description 'Expand $ to last argument of last command (bash-style !$)'
    switch (commandline -t)
        case '$'
            commandline -t -- (string split ' ' -- $history[1])[-1]
            commandline -f repaint
        case '*'
            commandline -i '$'
    end
end
