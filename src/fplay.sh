#!/bin/sh

# FPLAY
# Simon Hugh Moore
#
# Lists all video media (mkv, mp4, mp3 etc) and plays them in mpv.
# 
# You can choose max depth of directory in first argument.
# Default max depth is 5.

extensions='mkv|mp4|mp3|mov'

# get max depth to traverse for files.
[ $1 ] && depth="$1" || depth="5"

get_files(){
    if command -v fd > /dev/null; then
        fd "^.*\.($extensions)" -d "$depth" -t f 
    else
        echo "Currently does not work with find!"
    fi
}

choice="$(get_files | fzf --prompt="$(pwd)/")" || exit

mpv "$choice"
