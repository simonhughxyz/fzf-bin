#!/bin/sh

# FGB
# Simon H Moore
# 
# Checkout to chosen git branch using fzf

# Get list of branches
branches=$(git --no-pager branch --all -vv | grep -v HEAD)

# choose branch using fzf
branch=$(echo "$branches" | fzf +m --preview="git diff --color ..{1}" --preview-window=up:80%) &&

# checkout branch
git checkout $(echo "$branch" | awk '{print $1}' | sed "s#remotes/[^/]*/##")

