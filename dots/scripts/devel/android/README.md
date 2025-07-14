# Development Environment

## Jetbrains IDE crashes on start
Something about the sandbox and the zygote process dies.
Try disabling the `Markdown` plugin before opening a project.

[Issue](https://github.com/flathub/com.jetbrains.PyCharm-Community/issues/542)

## ADB in Android Studio

Make sure to install the `android-udev` package, and add your user to the `adbusers` system
group. Keep restarting Android Studio and unplugging and replugging your phone until it works, basically.
Or use wireless ADB
