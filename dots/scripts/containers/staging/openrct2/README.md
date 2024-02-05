# openrct2

Build your own container using the Openrct2 docker [github](https://github.com/OpenRCT2/openrct2-docker).
This is because the new images are not published onto Dockerhub.

## Running

Run once the first time to create the /config directory,
then paste your `.park` file from a client into the `save` directory.

### Container Admin

To attach to a running instance of the openrct2 server cli
```shell
$ podman attach openrct2-server

# Disconnect with ctrl-p,ctrl-q
```

### Server Admin

To pause the game from the server console:

```js
context.executeAction("pausetoggle", {});
```

To grant a player access:
```js
// i is the index of your player, 0 is the "server", 1 is "first joined"
network.players[i].group = 0 // To grant admin
```
