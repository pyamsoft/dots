# Flatpak

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

### Games don't launch
EAC games in particular don't like SDL_VIDEODRIVER being set to anything.
Make sure you unset it via --unset-env override in the flatpak file

### Team Fortress 2 and other Old Source Games
They require `lib32-gperftools` installed from the AUR, and run with  
`LD_PRELOAD=/usr/lib32/libtcmalloc.so %command%`  
[see here](https://github.com/ValveSoftware/Source-1-Games/issues/5043)

This may be fixed by the latest TF2 update that moves it to 64bit Vulkan,
but who knows, the game is so botted that I haven't played in a while.

### XDefiant and Ubisoft Connect

Shit is usually borked, but this may work:
[who knows](https://www.reddit.com/r/linux_gaming/comments/1cyl7us/guide_to_make_xdefiant_work_without_issues_no/)

### Wine and niceness

You may need to assign gamescope to allow it to set niceness or it will spam
the console and cause slowdown

[here](https://github.com/ValveSoftware/Proton/issues/6141)
`sudo setcap 'CAP_SYS_NICE=eip' $(which gamescope)`
