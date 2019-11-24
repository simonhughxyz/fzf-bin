#!/bin/sh

man "$(man -k . | fzf --prompt='Man> ' | awk '{print $1}' | tr -d ',' | cut -d'(' -f1)"
