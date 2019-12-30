#!/bin/bash

# FPLAY
# Simon Hugh Moore
#
# Lists all media (mkv, mp4, mp3 etc) and plays them in mpv.
# 
# You can choose max depth of directory in first argument.
# Default max depth is 5.

extensions='mkv|mp4|mp3|mp2|mov|mpg|mpeg|mpv|mpe|ogg|oga|ogv|m4p|m4v|avi|wmv|mov|qt|flv|gif|webm|aac|wma|flac|alac|wav'
depth="5"

# get max depth to traverse for files.
# [ $1 ] && depth="$1" || depth="5"

get_files(){
    if command -v fd > /dev/null; then
        fd "^.*\.($extensions)$" -d "$depth" -t f 
    else
        echo "Currently does not work with find!"
    fi
}

# get user options
while getopts "e:d:" flag; do
    case "${flag}" in
        e) extensions=${OPTARG};;
        d) depth="${OPTARG}";;
    esac
done
shift $((OPTIND-1))

choice="$(get_files | fzf --prompt="$(pwd)/")" || exit

mpv "$choice"
