# gaming-* users


## Managing the gaming-* user

gaming-* users can be managed via `run0`  
To update the Proton/Wine in the container, I use `net.davidotek.pupgui2`
from Flatpak

## Wine and niceness

You may need to assign gamescope to allow it to set niceness or it will spam
the console and cause slowdown

[here](https://github.com/ValveSoftware/Proton/issues/6141)
`sudo setcap 'CAP_SYS_NICE=eip' $(which gamescope)`

# Flatpak

## Steam

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

## Games don't launch
EAC games in particular don't like SDL_VIDEODRIVER being set to anything.
Make sure you unset it via --unset-env override in the flatpak file

Try using the `gametime` script, try not using the script. See what
makes things work. Sometimes the `gamescope` version is broken, so play around
with rolling back.
