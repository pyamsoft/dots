# dots

[Inspired](https://www.atlassian.com/git/tutorials/dotfiles)

See `installer` in the `dots/` folder

## Structure

Most of the dotfiles are in the bare repository, so they are
already a part of the real HOME directory

For other files that are copied into place, see `dots/`

## Notes

### Wayland
- Moonlight does not claim display properly in Wayland with mirrored monitor setup   (solved with cap_sys_admin tweak)
- Sunshine needs cap_sys_admin `sudo setcap cap_sys_admin+p /usr/bin/sunshine`
- Moonlight may not respect the keyboard input - run `sudo loginctl unlock-sessions` in an SSH session.
- No mouse cursor in fullscreen when using SW cursor tweak
  - This can be partially remidied by using software cursors and the extension `gnome-shell-extension-disable-unredirect-git`
  - This allows the use of the SW cursor, while also not making it invisible in an unredirect (fullscreen) window
- No mouse cursor in Moonlight without SW cursor tweak
  - This can be partially remidied by using software cursors and the extension `gnome-shell-extension-disable-unredirect-git`
  - This allows the use of the SW cursor, while also not making it invisible in an unredirect (fullscreen) window
- KDE Connect prompts Screen Sharing every time start remote mouse
  - No real way around this? Not sure if it's Portal or KDEConnect's job to solve.

### Docker
For video acceleration in docker, make sure you
[setup hardware accel in the container](https://jellyfin.org/docs/general/administration/hardware-acceleration#hardware-acceleration-on-docker-linux)

Use `podman` instead of `docker` to avoid the root daemon

### Flatpak
For OBS capture, install `OBSVkCapture` from freedesktop.Platform and ObsStudio
Also include `gstreamer-vaapi` from Freedesktop and `Plugins.Gstreamer` from ObsStudio
You will need to install `MangoHud` `vkBasalt` `gamescope` `proton-GE` and `Adwaita-dark` manually

Gamescope is currently masked/pinned to a [specific commit](https://github.com/flathub/org.freedesktop.Platform.VulkanLayer.gamescope/issues/49). See also Steam (Flatpak)

#### Steam (Flatpak)
See notes in `~dots/scripts/linux/flatpak/games/notes.txt`

#### Moonlight
You can run moonlight in gamescope via the `gametime-moonlight` script.
Note to capture keys you'll need to use the Grab command in gamescope, which is `Super+G`
You will not need to use the moonlight Fullscreen (Ctrl+Shift+X) or capture (Ctrl+Shift+Z)
as these are handled by gamescope. Exit is still possible via (Ctrl+Shift+Q) but may hang on final
window kill

## Tweaks

### FS performance
Enable [fast_commit for ext4](https://wiki.archlinux.org/title/Ext4#Enabling_fast_commit_in_existing_filesystems)
Disable [crypt workqueues](https://wiki.archlinux.org/title/Dm-crypt/Specialties)

## License

GPLv2

```
  The GPLv2 License

    Copyright (C) 2023  pyamsoft

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
