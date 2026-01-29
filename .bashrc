# shellcheck shell=bash

case "$-" in
*i*)
  # Continue as normal
  ;;
*)
  # Stop if not running interactively
  return 0
  ;;
esac

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
[ -f "${_cfg}/bash/rc" ] && . "${_cfg}/bash/rc" "${_cfg}" "$(uname)"

unset _cfg

# vim: set filetype=sh :
