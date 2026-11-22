# shellcheck shell=bash

# bash completion support for container-vpncheck script
__container-vpncheck() {
  COMPREPLY=()
  local prev="${COMP_WORDS[COMP_CWORD - 1]}"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  local modes="--mullvad --airvpn"

  _reply() {
    # shellcheck disable=SC2207
    COMPREPLY=($(compgen -W "$1" -- "$2"))
  }

  _strip() {
    printf -- '%s' "$1" | tr -d '[:space:]'
  }

  if [ "${COMP_CWORD}" -le 1 ]; then
    # Not enough commands, offer containers
    _reply "${modes}" "${cur}"
    return
  fi

  if [ -n "${prev}" ]; then
    local _previous
    _previous="$(_strip "${prev}")"

    if [ -n "${_previous}" ]; then
      # We have picked a mode, offer containers
      _reply "$(podman ps --noheading --format '{{ .Names }}')" "${cur}"
      return
    fi
  fi

  if [ -n "${cur}" ]; then
    local _current
    _current="$(_strip "${cur}")"

    if [ -n "${_current}" ]; then
      # No mode yet, pick one
      _reply "${modes}" "${cur}"
      return
    fi
  fi

  # Nothing at all, fill with suggestions
  _reply "${modes}" "${cur}"
}

complete -o bashdefault -o default -F __container-vpncheck container-vpncheck

# vim: set filetype=sh:
