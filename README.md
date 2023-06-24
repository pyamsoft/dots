# dots

[Inspired](https://www.atlassian.com/git/tutorials/dotfiles)

See `installer` in the `dots/` folder

# Structure

Most of the dotfiles are in the bare repository, so they are
already a part of the real HOME directory

For other files that are copied into place, see `dots/`

## Notes

### Docker
For video acceleration in docker, make sure you
[setup hardware accel in the container](https://jellyfin.org/docs/general/administration/hardware-acceleration#hardware-acceleration-on-docker-linux)

Use `podman` instead of `docker` to avoid the root daemon

### Steam (Flatpak)

Sometimes Steam loses the location of game libraries in the "Storage" menu. Going back in to add them
opens the document portal, which incorrectly adds a /run/user temp path (due to document exporting).
Make sure you:

1. Have allowed --filesystem access to the library path
2. Add the library in Steams UI to create the library entry. It will not work but thats fine, we just
   need it to update a config file.
3. Close steam once all paths are added
4. Go into <LIBRARY_PATH>/libraryfolder.vdf and see what the "contentid" is.
5. Go into <STEAM_ROOT>/steamapps/libraryfolders.vdf and correct the paths of your folder entries.
   Make sure the "contentid" matches the path of your chosen folder.
6. Go into <STEAM_ROOT>/config/libraryfolders.vdf and correct the paths of your folder entries.
   Make sure the "contentid" matches the path of your chosen folder.
7. Restart steam, should work?

## Flatpak

For OBS capture, install `OBSVkCapture` from freedesktop.Platform and ObsStudio
Also include `gstreamer-vaapi` from Freedesktop and `Plugins.Gstreamer` from ObsStudio
You will need to install `MangoHud` `vkBasalt` `gamescope` `proton-GE` and `Adwaita-dark` manually

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
