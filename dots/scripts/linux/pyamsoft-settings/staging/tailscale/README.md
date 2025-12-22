TailScale has a Docker container which works, but it must run as root,
and a container running as root is basically the same as a normal program running
as root.

Since "normal" Tailscale can be hardened with systemd, we are actually LESS secure
running TailScale via container
