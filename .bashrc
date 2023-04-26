# shellcheck shell=bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

_cfg="${XDG_CONFIG_HOME:-${HOME}/.config}"

# shellcheck disable=SC1091
[ -f "${_cfg}/bash/rc" ] && . "${_cfg}/bash/rc"

unset _cfg
