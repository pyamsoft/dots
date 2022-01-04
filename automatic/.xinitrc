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

# For GTK desktops
# So that wifi passwords work
# Don't start ssh as it is handled by ssh-agent
#
eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)"

# Start desktop
#
# XFCE
exec /usr/bin/startxfce4
