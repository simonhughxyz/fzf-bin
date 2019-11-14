#!/bin/sh

# FCONF
# Simon H Moore
# 
# Gives a list of config files top open with $EDITOR
# 
# Requires fzf and $EDITOR to be set to work

# location of config/dotfiles
dotfiles=~/.dotfiles

# cd into dotfiles to avoid having full path for every choice in fzf
cd $dotfiles

# get config file from fzf
choice="$(find ./*/ -path ~/.dotfiles/.git -prune -o -type f -print | fzf --prompt="$dotfiles/" --preview="cat {}" --preview-window=up:60%:wrap)" || exit

# open config file in $EDITOR
$EDITOR "$choice" && exit
