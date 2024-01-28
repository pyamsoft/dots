# gamer

A set of scripts to setup a secondary user for JUST GAMING on the host machine,
without giving access like `wheel` or `user directories` to the gaming software.

This is needed because `gamescope` won't run in flatpak except
- If you use an outdated unmaintained Proton-GE (which is bad)

`gamescope` won't run in `podman` or `bwrap` because the sandbox prevents us from touching `/tmp/.X11-unix`,
which is also no good.

So we trade off.

Less security (running on the host system) but with a "user-home" sandbox (running as a second, less privileged user).

## What

`setup` unprivileged but will ask for sudo, and will setup a gaming user.

`gamer` is unprivileged will run the provided binary as the `gaming-{name}` user and grant the
user access to the local X server via `xhost`, as well as correctly setting up a `systemctl --user`
connection and a `loginctl` session.

`gamelaunch` is a privileged script that will grant the `gaming-{name}` user access to the local X server
by forwarding the `main user` `$DISPLAY` and `$XAUTHORITY` environment.

`delete` will remove a `gaming-{name}` user and delete their `$HOME`

### sudo

You'll probably want to copy the sudoer file here into `/etc/sudoers.d`
Note that, intentionally, this sudoers file only offers passwordless access for
the "default run" mode of the launcher script. To pass arguments to the launcher,
you'll need to input a sudo password on the command line.
