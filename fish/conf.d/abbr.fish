status is-interactive || return

abbr c cd
abbr c. cd (path dirname (path dirname (path resolve $__fish_config_dir/conf.d)))
abbr cdd cd ~/Desktop
abbr cdf --set-cursor 'cd (path dirname %)'
abbr clip fish_clipboard_copy
abbr e -f __fish_anyeditor
abbr m sssh tom@ssh.koholi.net
abbr py python3
abbr w -p anywhere --set-cursor '(realpath (which %))'

abbr g git status
abbr ga git add
abbr gb git branch
abbr gc git checkout
abbr gcm git commit -m
abbr gcma git commit --amend --no-edit
abbr gd git diff
abbr gds git diff --stat
abbr gdt git difftool
abbr gl git log --oneline
abbr gr git rebase

abbr j jj status
abbr j+ jj next
abbr j- jj prev
abbr jD jj desc
abbr jd jj diff
abbr je jj edit
abbr jl jj log
abbr jN jj new "'trunk()'"
abbr jn jj new
abbr jr jj rebase

abbr l eza
abbr la eza -laa
abbr ll eza -l
abbr lt eza -T

if test "$(uname)" = Linux
    abbr jc journalctl
    abbr jcu journalctl --user
    abbr sc systemctl
    abbr scu systemctl --user
end
