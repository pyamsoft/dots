# lockdown

Like distrobox, but more restrictive by default

- Seperate `$HOME`
- Do not mount the host into the container
- Do not share namespaces except where required
- Does not run containers as `--privileged`

## Why

Meant for running graphical and audio applications in an arbitrary container.

Currently only `podman` is supported as a container hypervisor.

## Should I use this?

Heck no.

This is a highly experimental proof of concept for running things like Firefox and Steam
in a container while having access to things like the host GPU, webcam, pipewire server,
and other various "desktop" experiences.

It's basically distrobox, but without the nice things.
