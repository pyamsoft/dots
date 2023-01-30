# shellcheck shell=bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
  bcomp="/usr/share/bash-completion/bash_completion"

  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"

  bcomp="/etc/bash_completion"
  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"

  bcomp="/usr/local/share/bash-completion/bash_completion"
  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"

  bcomp="/opt/homebrew/share/bash-completion/bash_completion"
  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"

  unset bcomp

  return 0
}

__bash_qol()
{
  aliases="${XDG_CONFIG_HOME}/bash/aliases"
  # shellcheck disable=SC1090
  [ -f "${aliases}" ] && . "${aliases}"

  functions="${XDG_CONFIG_HOME}/bash/functions"
  # shellcheck disable=SC1090
  [ -f "${functions}" ] && . "${functions}"

  unset aliases
  unset functions

  return 0
}

__ensure_env()
{
  # Source bash_profile if the environment is not setup
  if [ -z "${PYAMSOFT_ENVIRONMENT}" ]; then
    # shellcheck disable=SC1091
    [ -f "${HOME}"/.bash_profile ] && . "${HOME}"/.bash_profile
  fi

  return 0
}

__direnv()
{
  # Source bash_profile if the environment is not setup
  if command -v direnv > /dev/null; then
    eval "$(direnv hook bash)"
  fi

  return 0
}

__bashrc()
{
  __ensure_env || return 1
  __bash_qol || return 1
  __enable_bash_completion || return 1
  __launch_starship || return 1
  __direnv || return 1

  return 0
}

# Setup
__bashrc

# Do not export the functions
unset -f __bashrc
unset -f __enable_bash_completion
unset -f __launch_starship
unset -f __bash_qol
unset -f __ensure_env
unset -f __direnv

# vim: set syntax=sh tabstop=2 softtabstop=2 shiftwidth=2 shiftround:
