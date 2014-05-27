#!/usr/bin/env zsh
# -------------------------------------------------------------------------------------------------
# Copyright (c) Pavel Osipov <posipov84@gmail.com> 2013.
# All rights reserved.

bindkey -e
autoload edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line
bindkey "^B" history-incremental-search-forward