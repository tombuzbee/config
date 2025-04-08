function fish_jj_prompt
    command -sq jj
    and jj log --no-pager --no-graph --color always \
        -r '@ | latest(::@ & (bookmarks() | immutable_heads()))' \
        -T 'if(current_working_copy,
                surround("", " ", coalesce(
                    bookmarks,
                    if(!empty, format_short_change_id(change_id)),
                )),
                label("rest", stringify(surround("[", "]", coalesce(
                    bookmarks,
                    "main",
                ))))
            )' 2>/dev/null
end
