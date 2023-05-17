#!/usr/bin/env python3

"""Set iTerm2 color preset according to macOS theme.

Requires iTerm2 version 3.3 or newer.

Save as ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch/sync_theme.py and
enable under scripts menu in iTerm2.
"""

import iterm2

# Change according to your preferences
LIGHT_COLOR_PRESET = 'catppuccin-latte'
DARK_COLOR_PRESET  = 'catppuccin-mocha'


async def set_theme(connection: iterm2.connection.Connection, dark: bool):
    preset = await iterm2.ColorPreset.async_get(
        connection,
        DARK_COLOR_PRESET if dark else LIGHT_COLOR_PRESET,
    )

    # Update the list of all profiles and iterate over them.
    profiles = await iterm2.PartialProfile.async_query(connection)
    for partial in profiles:
        # Fetch the full profile and then set the color preset in it.
        profile = await partial.async_get_full_profile()
        await profile.async_set_color_preset(preset)


async def sync_theme_on_start(connection: iterm2.connection.Connection):
    app = await iterm2.app.async_get_app(connection)
    theme = await app.async_get_theme()
    await set_theme(connection, 'dark' in theme)


async def main(connection: iterm2.connection.Connection):
    await sync_theme_on_start(connection)

    async with iterm2.VariableMonitor(
        connection, iterm2.VariableScopes.APP, 'effectiveTheme', None,
    ) as mon:
        while True:
            # Block until theme changes
            theme: str = await mon.async_get()
            
            # Themes have space-delimited attributes, one of which will be light or dark.
            parts = theme.split(' ')

            await set_theme(connection, 'dark' in parts)


iterm2.run_forever(main)
