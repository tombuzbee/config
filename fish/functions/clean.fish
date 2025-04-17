function clean -a dir
    set -a dir .
    find $dir[1] -name .DS_Store -type f -print -delete
end
