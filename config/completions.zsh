#!/usr/bin/env zsh
# -------------------------------------------------------------------------------------------------
# Copyright (c) Pavel Osipov <posipov84@gmail.com> 2013.
# All rights reserved.

zstyle ':completion:*' verbose true
zstyle ':completion:*' list-separator '#'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' squeeze-slashes true

zstyle ':completion:*:default' list-prompt '%SAt %p: Hit <TAB> for more, or the character to insert, or <q> to exit%s'
zstyle ':completion:*:default' menu 'select=0'
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:windows' menu 'on=0'

zstyle ':completion::*:::' completer _expand _complete _prefix
zstyle ':completion:*:prefix:*' add-space true

zstyle ':completion:*' group-name ''

zstyle ':completion:*:descriptions' format '%B%d%b' `echo -n "\u2b81"`

zstyle ':completion:*:descriptions' format '%B%d%b'

zstyle ':completion:*:expand:*' tag-order 'all-expansions original'
zstyle ':completion:*:expand:*' substitute true
zstyle ':completion:*:expand:*' accept-exact continue


zstyle ':completion:*' ignore-parents parent pwd

zstyle ':completion:*:*files' ignored-patterns '*?.(o|swp|pyc|pyo)' '*?~'
zstyle ':completion:*:*:cd:*' ignored-patterns '(*/|)CVS'
[[ ${OSTYPE} == cygwin ]] && zstyle ':completion:*:-command-:*' ignored-patterns '(#i)*.(exe|dll)'

zstyle ':completion::*:(-command-|export):*' fake-parameters LD_LIBRARY_PATH

autoload -Uz compinit
compinit
