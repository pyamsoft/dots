# dots

[Inspired](https://www.atlassian.com/git/tutorials/dotfiles)

See `installer` in the `dots/` folder

## Structure

Most of the dotfiles are in the bare repository, so they are
already a part of the real HOME directory

For other files that are copied into place, see `dots/`

## Notes

### Proxy

For proxy usage

- First you should run `apply-http-proxy default` to see the settings, and then
  `eval $(apply-http-proxy default)` to set the environment.
- For systemd services that need proxy access, you should run `apply-http-proxy systemd-apply`
  first, and then restart any services that need to use the proxy.
- For git, update your git-ssh config to use the socat proxy line

### Fonts

I code with a monospace Comic Sans like font. Yes, I am serious.  
Currently I'm using a fork of "Comic Shanns", found here on github:  
[you have been warned](https://github.com/jesusmgg/comic-shanns-mono)

### USBGuard

[Make sure you setup USBGuard](https://wiki.archlinux.org/title/USBGuard)
`usbguard generate-policy > /etc/usbguard/rules.conf`

Otherwise, if another service starts usbguard somehow, you will be locked out!

### Overclocking / Undervolting

#### GPU

I use LACT for AMD GPU overclocking and undervolting
Be sure to setup the daemon for usage by creating the `lact` group and
specifying the group in `/etc/lact/config.yaml`

#### CPU

For CPU clocking, I use my own developed utility called `pstate-frequency`

### Firmware Update

I prefer `fwupd` and using the `org.gnome.Firmware` flatpak for the frontend.
To enable `fwupd.service`, you may wish to mask `passim.service`, which
for example reports problems on my machine and prevents fwupd from running.

### Wayland

- Sunshine needs cap_sys_admin `sudo setcap 'CAP_SYS_ADMIN+p' /usr/bin/sunshine`
  - Can be automatically handled by a pacman hook
- Gamescope may need cap_sys_nice `sudo setcap 'CAP_SYS_NICE=eip' /usr/bin/sunshine`
  - Can be automatically handled by a pacman hook
- See Arch wiki for enabling Wayland for Android Studio / Webstorm

### Docker

For video acceleration in docker, make sure you
[setup hardware accel in the container](https://jellyfin.org/docs/general/administration/hardware-acceleration#hardware-acceleration-on-docker-linux)

Use `podman` instead of `docker` to avoid the root daemon

### Flatpak

For OBS capture, install `OBSVkCapture` from freedesktop.Platform and ObsStudio
Also include `gstreamer-vaapi` from Freedesktop and `Plugins.Gstreamer` from ObsStudio
You will need to install `MangoHud` `gamescope` `protonup-qt` manually

For Dark Mode you'll need the following flatpaks for the correct runtime (assuming GNOME)

QT:
`QAdwaitaDecorations`
`QGnomePlatform`
`QGnomePlatform-decorations`

GTK:
See the `themepak` script, which copies your GTK theme into the user folders

### Steam (Flatpak)

See notes in `dots/scripts/gaming/README.md`

### Moonlight

Make sure you do not block the X11 or fallback x11 sockets for moonlight or else --grab won't work
Sunshine Right-Alt tweak does not work because Wayland GNOME does not respond to the re-bound key.

### Sunshine

Be sure to add the [LizardByte Archlinux repository](https://github.com/LizardByte/pacman-repo)
to `/etc/pacman.conf`

Don't enable the user level systemd service - it's weird. Use our customer autostart-sunshine user service
which calls through to the `restart-sunshine` script, which it expects to live in `${HOME}/.local/bin`
The `restart-sunshine` script is unixy platform agnostic and will handle known quirks of sunshine

### Secure Boot

You should install `sbctl` to easily manage secure boot, and reference the Arch wiki for usage.
On specific machines, the secure boot BIOS process is a little janky. On my minisforum UM780XTX it is as follows

At any point if you are asked to "restore factory keys" or "reboot without saving", DO NOT DO IT.

- Boot into Admin BIOS -> Security -> Secure Boot
- You should see you are in "User" or "Standard" mode at the top
- Disable Secure Boot
- Set to Custom Mode
- Manually restore the factory keys
- Enable setup mode
- Reboot the machine, go into BIOS again
- Boot into Admin BIOS -> Security -> Secure Boot
- You should see you are in "User" or "Standard" mode at the top
- Enable setup mode (it should be allowed and the machine still in Custom mode with Disabled SB)
- Now at the top you should see you are in "Setup" mode instead of "User"
- DO NOT REBOOT - IF YOU REBOOT YOU WILL LEAVE SETUP MODE
- Go to the boot override and select your main boot device.
- Verify you are in setup mode via `sbctl status` and enroll your keys

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
