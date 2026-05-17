function history-prev-command --description 'Expand ! to last command (bash-style bang)'
    switch (commandline -t)
        case '!'
            commandline -t -- $history[1]
            commandline -f repaint
        case '*'
            commandline -i '!'
    end
end
