# lockdown

Like distrobox, but more restrictive by default

- Seperate `$HOME`
- Do not mount the host into the container
- Do not share namespaces except where required

## Why

Meant for running graphical and audio applications in an arbitrary container.

Currently only `podman` is supported as a container hypervisor.
