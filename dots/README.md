# dots

[Inspired](https://www.atlassian.com/git/tutorials/dotfiles)

```bash
# Manage dotfiles in a bare git repository in your HOME
dotfiles()
{
  # Treat an empty command as status instead of help, for help call "help" explicitly
  if [ "$#" -le 0 ]; then
    git --git-dir "${HOME}"/.dotfiles --work-tree "${HOME}" status
  else
    git --git-dir "${HOME}"/.dotfiles --work-tree "${HOME}" "$@"
  fi
}
```

# Structure

Most of the dotfiles are in the bare repository, so they are
already a part of the real HOME directory

For other files that are copied into place, see `dots/`

## Notes

For video acceleration in docker, make sure you
[setup hardware accel in the container](https://jellyfin.org/docs/general/administration/hardware-acceleration#hardware-acceleration-on-docker-linux)

For headphone audio, plug into Green back and use Analog Stereo Duplex

For RDP, use Remmina as client with Gnome-Remote-Desktop as server.
To work around GRDP not allowing you to see the lock screen, install the extension
[Allow Locked Remote Desktop](https://extensions.gnome.org/extension/4338/allow-locked-remote-desktop/)

## License

GPLv2

```
  The GPLv2 License

    Copyright (C) 2022  Peter Kenji Yamanaka

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
```
