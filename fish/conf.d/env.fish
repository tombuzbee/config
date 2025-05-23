fish_add_path -g ~/.local/bin

set -gx FZF_DEFAULT_OPTS_FILE ~/.config/fzf/fzfrc
set -gx INPUTRC ~/.config/readline/inputrc
set -gx JJ_CONFIG ~/.config/jj/config.toml
set -gx RIPGREP_CONFIG_PATH ~/.config/rg/rgrc
set -gx WGETRC ~/.config/wget/wgetrc

set -gx LESSHISTFILE ~/.local/state/less/history
set -gx PYTHON_HISTORY ~/.local/state/python/history
set -gx SQLITE_HISTORY ~/.local/state/sqlite3/history

set -gx MYPY_CACHE_DIR ~/.cache/mypy
set -gx PYTHONPYCACHEPREFIX ~/.cache/python
set -gx RUFF_CACHE_DIR ~/.cache/ruff

set -gx SUDO_EDITOR (command -s hx vim nvim vi nano)[1]
set -gx EDITOR (path basename $SUDO_EDITOR)
set -gx PAGER less

set -gx LESS -iR --follow-name
set -gx --path LS_COLORS 'di=34' 'ex=91' 'ln=35' 'mi=7;31' 'or=7;31' 'ow=34;40' \
    '*.'{bak,class,DS_Store,lock,log,o,pyc,swp,tmp}'=90'
set -gx MANPAGER less --use-color -Dd+b -DP+Wk
set -gx MANROFFOPT -c
