#!/usr/bin/env zsh
# -------------------------------------------------------------------------------------------------
# Copyright (c) Pavel Osipov <posipov84@gmail.com> 2013.
# All rights reserved.

# Applying dircolors
case $OSTYPE in
	darwin*)
		alias dircolors='gdircolors'
		alias ls='gls --color=auto'
		alias dir='gdir --color=auto'
		alias vdir='gvdir --color=auto'
		;;
	*)
		alias ls='ls --color=auto'
		alias dir='dir --color=auto'
		alias vdir='vdir --color=auto'
		;;
esac
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
test -r $ZSH_DIRCOLORS_PATH && eval "$(dircolors -b $ZSH_DIRCOLORS_PATH)" || eval "$(dircolors -b)"

# Shortcuts for most used commands
alias d='dirs -v'
alias h=history
alias la='ls -la'
alias ll='ls -l'
alias less='less -M'