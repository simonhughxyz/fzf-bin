#!/bin/sh

# FPLAY
# Simon Hugh Moore
#
# Lists all video media (mkv, mp4, mp3 etc) and plays them in mpv.

extensions='mkv|mp4|mp3|mov'

get_files(){
    if command -v fd > /dev/null; then
        fd "^.*\.($extensions)" -d 5 -t f 
    else
        echo "Currently does not work with find!"
    fi
}

choice="$(get_files | fzf --prompt="$(pwd)/")" || exit

mpv "$choice"
