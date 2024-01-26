# gamer

A set of scripts to setup a secondary user for JUST GAMING on the host machine,
without giving access like `wheel` or `user directories` to the gaming software.

`setup` will setup a gaming user and grant them `systemctl --user` session access

`gamer` will run the provided binary as the `gaming-{name}` user and grant the
user access to the local X server via `xhost`

`delete` will remove a `gaming-{name}` user and delete their `$HOME`

## sudo

You'll probably want to copy the sudoer file here into `/etc/sudoers.d`
Note that, intentionally, this sudoers file only offers passwordless access for
the "default run" mode of the launcher script. To pass arguments to the launcher,
you'll need to input a sudo password on the command line.
