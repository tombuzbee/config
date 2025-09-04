function fish_jj_prompt
    jj log --no-pager --no-graph --color always \
        -r '@ | latest(@-) ~ trunk()' \
        -T 'if(current_working_copy,
                if(empty && description.len() == 0,
                    label("rest", "∅"),
                    label("node working_copy", "@")
                ) ++ label("rest", surround(" (", ")",
                    if(description.first_line().len() <= 20,
                        description.first_line(),
                        description.first_line().substr(0, 20) ++ "…"
                    )
                )),
                label("rest", stringify(surround("──[", "]",
                    if(description.first_line().len() <= 20,
                        description.first_line(),
                        description.first_line().substr(0, 20) ++ "…"
                    )
                )))
            )' 2>/dev/null
end
