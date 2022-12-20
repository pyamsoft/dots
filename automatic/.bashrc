# shellcheck shell=bash

__launch_starship()
{
  if command -v starship > /dev/null; then
    eval "$(starship init bash)"
  else
    export PS1='\w
\$ '
  fi

  return 0
}

__enable_bash_completion()
{
  # Enable bash completion
  local bcomp="/usr/share/bash-completion/bash_completion"

  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"
  unset bcomp

  bcomp="/etc/bash_completion"
  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"
  unset bcomp

  bcomp="/usr/local/share/bash-completion/bash_completion"
  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"
  unset bcomp

  return 0
}

__bashrc()
{
  # If not running interactively, don't do anything
  [[ $- != *i* ]] && return 0

  # Source bash_profile if the environment is not setup
  if [ -z "${PYAMSOFT_ENVIRONMENT}" ]; then
    # shellcheck disable=SC1091
    [ -f "${HOME}"/.bash_profile ] && . "${HOME}"/.bash_profile
  fi

  aliases="${XDG_CONFIG_HOME}/bash/aliases"
  # shellcheck disable=SC1090
  [ -f "${aliases}" ] && . "${aliases}"
  unset aliases

  functions="${XDG_CONFIG_HOME}/bash/functions"
  # shellcheck disable=SC1090
  [ -f "${functions}" ] && . "${functions}"
  unset functions

  __enable_bash_completion || return 1
  __launch_starship || return 1

  return 0
}

# Setup
__bashrc

# Do not export the functions
unset -f __bashrc
unset -f __enable_bash_completion
unset -f __launch_starship

# vim: set syntax=sh tabstop=2 softtabstop=2 shiftwidth=2 shiftround:
