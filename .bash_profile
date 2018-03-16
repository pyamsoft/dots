# shellcheck disable=SC1090,SC1091
if [ -z "${PYAMSOFT_ENVIRONMENT}" ]; then
  [ -f "${HOME}"/.environment ] && . "${HOME}"/.environment
fi

[ -f "${HOME}"/.bashrc ] && . "${HOME}"/.bashrc

# Start xserver if on first VT and not started
# if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#   exec startx
# fi

# vim: set syntax=sh tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab:
