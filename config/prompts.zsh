#!/usr/bin/env zsh
# -------------------------------------------------------------------------------------------------
# Copyright (c) Pavel Osipov <posipov84@gmail.com> 2013.
# All rights reserved.

ZSH_PROMPT_COLOR='[00;38;5;166m'
ZSH_RESET_COLOR='[0m'
ZSH_BASE_PS1=$'%{\e${ZSH_PROMPT_COLOR}%}%25<..<%~ %#%{\e${ZSH_RESET_COLOR}%} '
ZSH_BASE_RPS1=$'%{\e${ZSH_PROMPT_COLOR}%}%D{%L}:%D{%M}%{\e${ZSH_RESET_COLOR}%}'

PS1=$ZSH_BASE_PS1
PS2=$'%{\e${ZSH_PROMPT_COLOR}%}%_ %{\e${ZSH_RESET_COLOR}%}'
PS2=$'%{\e${ZSH_PROMPT_COLOR}%}+%N:%i %{\e${ZSH_RESET_COLOR}%}'
RPS1=$ZSH_BASE_RPS1

function zle-line-init zle-keymap-select {
    PS1="${${KEYMAP/vicmd/${CMD_MODE_PS1}}/(main|viins)/${ZSH_BASE_PS1}}"
    RPS1=$ZSH_BASE_RPS1

    zle reset-prompt
    zle -R
}

function zle-line-finish {
	zle expand-history

	typeset last_cmd cmd hnum
	fc -l | tail -n1 | sed -e 's/^\s\+\([0-9]\+\)\*\?\s\+\(.*\)\s*$/\1:\2/' | IFS=':' read hnum last_cmd
	echo $BUFFER | sed -e 's/^\s\+//' | sed -e 's/\s\+$//' | read cmd

	if [[ $cmd = "" ]]; then
		PS1=${ZSH_BASE_PS1:s/'%25<..<%~'/}
	elif [[ $cmd = $last_cmd ]]; then
		PS1=${ZSH_BASE_PS1:s/'%25<..<%~'/'!'$hnum}
	else
		PS1=${ZSH_BASE_PS1:s/'%25<..<%~'/'!%h'}
    fi
	RPS1=''

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select