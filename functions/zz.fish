function zz -d "List Z jump options in fzf" -a dir
    eval "z -l | fzf --height=10 --reverse --query '$dir'" \
    | read -l output

    set target_dir (echo "$output" | awk -F ' ' '{print $2}')

    if test -n $target_dir
        cd "$target_dir"
    end
end
