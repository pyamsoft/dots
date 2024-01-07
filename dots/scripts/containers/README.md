Add a file `/etc/hosts.container` containing the following:

```
127.0.0.1 localhost
```

and update the `base_hosts_file` option in `/etc/containers/containers.conf` to
`base_hosts_file = "/etc/hosts.container"`

This allows us to not leak the system hosts file and also add automatic support
for the routes to `host.containers.internal` and `host.docker.internal`
