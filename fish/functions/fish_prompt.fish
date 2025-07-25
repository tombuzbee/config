function fish_prompt
    set -l parts

    set -q SSH_CONNECTION
    and set -a parts (set_color brgreen)(prompt_hostname)

    set -q TMUX
    and set -a parts (set_color cyan)'['(tmux display -p '#{session_name}')']'

    set -a parts (set_color blue)(prompt_pwd -D 3)
    set -a parts (fish_vcs_prompt '%s')

    string join (set_color normal)' ' $parts

    echo (set_color brblue)'❯'(set_color normal)' '

    function __fish_prompt_before --on-event fish_prompt
        if test $status -ne 0
            echo -n (set_color brred)'✘'
        end
        echo
    end
end
