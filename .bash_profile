# shellcheck shell=bash
#
# Source bash profile

_cfg="${XDG_CONFIG_HOME:-${HOME}/.config}"

##
# Source our pyamsoft bashrc
#
# Arguments always provided as:
#
# $1 - CONFIG_DIR
# $2 - OS
#
# shellcheck disable=SC1091
[ -f "${_cfg}/bash/profile" ] && . "${_cfg}/bash/profile" "${_cfg}" "$(uname)"

unset _cfg
unset _os
