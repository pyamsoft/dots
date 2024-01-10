# Flatpak

## ProtonUp-QT
Flatpak complains because ~/.var/app/com.valvesoftware.Steam/data is an existing symlink.
Fix by bind-mounting .local/share -> data
