# etc

## fstab

UEFI may mount `/boot` as umask 0077 because the user ran
`genfstab` in the install ISO under a 22 umask.
Use 0077 instead of default 0022, or systemd complains about
[security](https://bbs.archlinux.org/viewtopic.php?id=287695)
