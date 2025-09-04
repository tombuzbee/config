function up
    if test "$(uname)" = Darwin
        brew update
        and brew upgrade
        and brew cleanup -s

        if command -q mas && test -z "$SSH_CONNECTION"
            mas upgrade
        end
    else if set -q TERMUX_VERSION
        pkg update
        and pkg upgrade
        and apt autoremove
    else if command -q yay
        yay
        set -l unneeded (yay -Qdtq)
        if test -n "$unneeded"
            yay -R $unneeded
        end
    end
end
