# shellcheck disable=SC1090,SC1091
if [ -z "${PYAMSOFT_ENVIRONMENT}" ]; then
  [ -f "${HOME}"/.environment ] && . "${HOME}"/.environment
fi

# Strict umask
umask 077

set_stty_options()
{
  # Disable stopping the shell output with Ctrl+S
  # Disable job sleep with Ctrl+Z
  # stty options
  stty -ixon
  stty susp undef
}

set_shopt_options()
{
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

set_env_vars()
{
  # Disable the bash_history file
  HISTCONTROL=ignoreboth
  export HISTCONTROL
  unset HISTFILE

  # dircolors outputs an export command
  eval "$(dircolors -b "${HOME}/.dir_colors")"

  EDITOR=vim
  export EDITOR

  SYSTEMD_EDITOR=vim
  export SYSTEMD_EDITOR

  SUDO_EDITOR=vim
  export SUDO_EDITOR

  CC=gcc
  export CC

  CXX=g++
  export CXX

  # Incase LANG is not defined since Java and other tools nolikey POSIX
  # May be UserLand related on Android
  export LANG="en_US.UTF-8"
  export LANGUAGE="en_US.UTF-8"

  export LC_CTYPE="en_US.UTF-8"
  export LC_NUMERIC="en_US.UTF-8"
  export LC_TIME="en_US.UTF-8"
  export LC_COLLATE="en_US.UTF-8"
  export LC_MONETARY="en_US.UTF-8"
  export LC_MESSAGES="en_US.UTF-8"
  export LC_PAPER="en_US.UTF-8"
  export LC_NAME="en_US.UTF-8"
  export LC_ADDRESS="en_US.UTF-8"
  export LC_TELEPHONE="en_US.UTF-8"
  export LC_MEASUREMENT="en_US.UTF-8"
  export LC_IDENTIFICATION="en_US.UTF-8"
}

enable_bash_completion()
{
  # Enable bash completion
  bcomp="/usr/share/bash-completion/bash_completion"
  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"
  unset bcomp

  bcomp="/etc/bash_completion"
  # shellcheck disable=SC1090
  [ -r "${bcomp}" ] && . "${bcomp}"
  unset bcomp
}

set_stty_options
set_shopt_options
set_env_vars
enable_bash_completion

unset enable_bash_completion
unset set_env_vars
unset set_stty_options
unset set_shopt_options

[ -f "${HOME}"/.bashrc ] && . "${HOME}"/.bashrc

# Start xserver if on first VT and not started
# if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#   exec startx
# fi

# vim: set syntax=sh tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab:
