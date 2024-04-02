# dots

[Inspired](https://www.atlassian.com/git/tutorials/dotfiles)

See `installer` in the `dots/` folder

## Structure

Most of the dotfiles are in the bare repository, so they are
already a part of the real HOME directory

For other files that are copied into place, see `dots/`

## Notes

## Fonts

I code with a monospace Comic Sans like font. Yes, I am serious.  
Currently I'm using a fork of "Comic Shanns", found here on github:  
[you have been warned](https://github.com/jesusmgg/comic-shanns-mono)

## Sound on Linux
You may need `alsa-firmware` and `sof-firmware` for sound cards. You also would generally
want to install `alsa-utils` and `alsa-plugins` for higher quality sound resampling.

## USBGuard
[Generally speaking, mask usbguard services](https://wiki.archlinux.org/title/USBGuard)

We basically exclusively use USB, don't allow any program to accidentally start the usbguard service
as it will immediately disconnect all of our devices

### Wayland
- Sunshine needs cap_sys_admin `sudo setcap cap_sys_admin+p /usr/bin/sunshine`
- KDE Connect prompts Screen Sharing every time start remote mouse
  - No real way around this? Not sure if it's Portal or KDEConnect's job to solve.

### Docker
For video acceleration in docker, make sure you
[setup hardware accel in the container](https://jellyfin.org/docs/general/administration/hardware-acceleration#hardware-acceleration-on-docker-linux)

Use `podman` instead of `docker` to avoid the root daemon

### Flatpak
For OBS capture, install `OBSVkCapture` from freedesktop.Platform and ObsStudio
Also include `gstreamer-vaapi` from Freedesktop and `Plugins.Gstreamer` from ObsStudio
You will need to install `MangoHud` `vkBasalt` `gamescope` `protonup-qt` and `Adwaita-dark` manually

### Steam (Flatpak)
See notes in `~dots/scripts/gaming/README.md`

### Moonlight
Make sure you do not block the X11 or fallback x11 sockets for moonlight or else --grab won't work
Sunshine Right-Alt tweak does not work because Wayland GNOME does not respond to the re-bound key.

### Sunshine
Don't enable the user level systemd service - it's weird. Use our customer autostart-sunshine user service
which calls through to the `restart-sunshine` script, which it expects to live in `${HOME}/.local/bin`

The `restart-sunshine` script is unixy platform agnostic and will handle known quirks of sunshine 

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
