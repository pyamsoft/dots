# dockerize

A simple script which runs a docker container using
more locked down defaults.

Setup will automatically create a configuration directory
as well as a special user and group to run the docker container as.

The systemd service can be installed and used to automatically run docker
containers via the dockerize script by symlinking the script to a program name:

`$ ln -s dockerize adguardhome`
