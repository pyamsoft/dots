# shellcheck shell=bash

__set_shopt_options()
{
  if ! command -v shopt > /dev/null; then
    return 0
  fi

  # shopt options
  shopt -s checkwinsize
  shopt -s histappend
  shopt -s autocd
  shopt -s cdspell
  shopt -s cmdhist
  shopt -s dirspell
  shopt -s extglob
  shopt -s globstar
  shopt -s no_empty_cmd_completion
  shopt -s dotglob
}

__setup_shell_env()
{
  # dircolors outputs an export command
  if command -v dircolors > /dev/null; then
    eval "$(dircolors -b "${HOME}/.dir_colors")"
  fi

  # Disable the bash_history file
  export HISTCONTROL=ignoreboth
  unset HISTFILE
}

__bash_profile()
{
  # shellcheck disable=SC1090,SC1091
  if [ -z "${PYAMSOFT_ENVIRONMENT}" ]; then
    [ -f "${HOME}"/.environment ] && . "${HOME}"/.environment
  fi

  # Strict umask
  if command -v umask > /dev/null; then
    umask 077
  fi

  __set_shopt_options
  __setup_shell_env

  [ -f "${HOME}"/.bashrc ] && . "${HOME}"/.bashrc
}

__bash_profile

unset -f __bash_profile
unset -f __set_shopt_options
unset -f __setup_shell_env

# vim: set syntax=sh tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab:
