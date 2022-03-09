#!/bin/sh

# Set up X11 session
#
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    # shellcheck disable=SC1090
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Source .xprofile
#
# shellcheck disable=SC1091
[ -f "${HOME}/.xprofile" ] && . "${HOME}/.xprofile"

# Start desktop
#
# XFCE4
exec /usr/bin/startxfce4
