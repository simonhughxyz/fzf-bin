#!/bin/bash

# FPLAY
# Simon Hugh Moore
#
# Lists all media (mkv, mp4, mp3 etc) and plays them in mpv.
# 
# Options:
# -e    : Choose extensions to find (have to be separated by `|`).
# -d    : Choose directory depth to traverse, default is 5.

usage="$(basename "$0") [-h] [-e s] [-d n] -- find media files and play them in mpv.

where:
    -h  show this help text.
    -e  set the extensions to find (have to be separated by \`|\`)
    -d  set directory depth to traverse (default: 5)"

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
while getopts "he:d:" flag; do
    case "${flag}" in
        h) echo "$usage"; exit;;
        e) extensions=${OPTARG};;
        d) depth="${OPTARG}";;
    esac
done
shift $((OPTIND-1))

choice="$(get_files | fzf --prompt="$(pwd)/")" || exit

mpv "$choice"
