function zz -d "List Z jump options in fzf" -a dir
    eval "z -l \
    | sort -k1 -nr \
    | awk -F ' ' '{print \$2}' \
    | fzf --height=10 --reverse --query '$dir'\
    --preview 'ls --color=always {}'" \
    | read -l target_dir

    if not test -z "$target_dir"
        cd "$target_dir"

        commandline -t ""
    end

    commandline -f repaint
end
