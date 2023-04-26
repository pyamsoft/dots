# shellcheck shell=bash
#
# Source bash profile

_cfg="${XDG_CONFIG_HOME:-${HOME}/.config}"

# shellcheck disable=SC1091
[ -f "${_cfg}/bash/profile" ] && . "${_cfg}/bash/profile"

unset _cfg
