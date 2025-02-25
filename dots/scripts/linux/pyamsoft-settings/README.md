# pyamsoft-settings

A package that installs pyamsoft custom settings

## What

The installer script reads the `hosts` folder
Inside the `hosts` folder are various hostnames

The special name `all` matches everything, and every file under this folder is installed on every machine.

Otherwise, files are only installed on machines where a `MATCH` condition is met:

- The hostname is an exact match
- The hostname matches a "start condition"
  - Ex: hostname `hello-world123` will match a "start condition" folder named `hello-`
- The hostname matches a "end condition"
  - Ex: hostname `bar12-baz` will match a "end condition" folder named `-baz`
- OR the hostname matches a `SKIP` conditon

`SKIP` conditions follow the same rules as `MATCH` conditions, but inverted.

- The hostname is an exact match, these files will NOT be installed
- The hostname matches a "start condition", these files will NOT be installed
  - Ex: hostname `hello-world123` will match a "start condition" folder named `hello-`
- The hostname matches a "end condition", these files will NOT be installed
  - Ex: hostname `bar12-baz` will match a "end condition" folder named `-baz`

This means that as long as the machine hostname DOES NOT MATCH ANY `SKIP` conditions,
the files will be installed

- Ex: the machine `nerd1` will install files from `all`, `nerd1`,
  `skip:helloworld` and `skip:123-` but will NOT install files
  from `skip:nerd1`, or `nerd2`

## After Install

Create a system group called `ssh-users` and add your user to it

### License

Parts of this configuration are taking from
[CachyOS-Settings](https://github.com/CachyOS/CachyOS-Settings)
which is GPLv3 Licensed.

All of my configuration in this repository and package is GPLv2 or
later - unless this conflicts with the GPLv3, which in that case,
all code and config is GPLv3 or later, or whatever is most compliant.

I am not a lawyer.
