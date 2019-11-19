#!/bin/sh

# FKILL
# Simon H Moore
# 
# Find process and kill it

# get process using fzf
pid=$(ps aux | sed 1d | fzf -m --preview="ps -p {2}" --preview-window=down:2 | awk '{print $2}') && exit

kill -9 "$pid"
