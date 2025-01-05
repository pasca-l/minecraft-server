# Minecraft Server
Minecraft server built in Docker.

## Requirements
- Docker 25.0.3
- Docker Compose v2.24.6

## Usage
1. Start server.
```
$ docker compose up
```
- If starting for the first time, `eula.txt` is generated with `eula=false`, which needs to be updated to `eula=true` (agreeing to the EULA).

### Connecting Minecraft
1. Connect to the server from Minecraft, listening on port `25565` as default.
- If the server is on localhost, server address can be specified as `localhost` or `127.0.0.1`.
- If the server is on another device within the same network, server address is `inet` value of `en0`.
```
$ ifconfig en0
```
- If the server is on another device outside of the local network, server address is the public IP.
  - The router of the local network should port forward to the server's listening port.

## Optimizations
Set configurations below as starting values for server optimization. ([reference](https://github.com/YouHaveTrouble/minecraft-optimization))

### Good starting value on `server.properties`
- ```sync-chunk-writes=false```

Allows the server to save chunks off the main thread, lessening the load on the main tick loop.

- ```network-compression-threshold=256```

Allows to set the cap for the size of a packet before the server attempts to compress it. Setting it higher can save some CPU resources at the cost of bandwidth, however may also hurt clients with slower network connections. If the server is in a network with a proxy or on the same machine (with less than 2 ms ping), disabling (=-1) will be beneficial, since internal network speeds can usually handle the additional uncompressed traffic.

- ```simulation-distance=4```

Allows to set the distance in chunks around the player that the server will tick (distance from player that things will happen), including furnaces smelting, crops and sapling growing, etc. Setting it lower allows to load more chunks without ticking them.

- ```view-distance=7```

Allows to set the distance in chunks that will be sent to players. The total view distance will equal to the greatest value between `view-distance` and `simulation-distance`.

### Recommended server software
- [Paper](https://github.com/PaperMC/Paper)
> The most widely used, high-performance Minecraft server that aims to fix gameplay and mechanics inconsistencies.
