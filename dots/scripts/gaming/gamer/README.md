# gamer

A set of scripts to setup a secondary user for JUST GAMING on the host machine,
without giving access like `wheel` or `user directories` to the gaming software.

`setup` will setup a gaming user and grant them `systemctl --user` session access

`gamer` will run the provided binary as the `gaming-{name}` user and grant the
user access to the local X server via `xhost`

`delete` will remove a `gaming-{name}` user and delete their `$HOME`
