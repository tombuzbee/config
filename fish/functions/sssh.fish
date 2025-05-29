function sssh -a host -a session
    if test -z "$session"
        ssh $host
    else if command -q autossh
        autossh -M 0 -t $host tmux new -As $session
    else
        ssh -t $host tmux new -As $session
    end
end
