function sssh -a host -a session
    if test -z "$session"
        ssh $host
    else if command -q autossh
        autossh -M 0 -t $host shpool attach -ff $session
    else
        ssh -t $host shpool attach -f $session
    end
end
