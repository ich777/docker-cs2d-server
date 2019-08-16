# CS2D Dedicated Server in Docker optimized for Unraid

This Docker will download and install the latest version of CounterStrike 2D.
CounterStrike 2D is a free to play top down shooter (you can get it on Steam or at https://www.cs2d.com/)

## Env params

| Name | Value | Example |
| --- | --- | --- |
| SERVER_DIR | Folder for gamefiles | /serverdata/serverfiles |
| GAME_PARAMS | Commandline startup parameters | [empty] |
| GAME_PORT | The UDP Game Port | 36963 |
| FORCE_UPDATE | Force updata check on start | [empty] |
| UID | User Identifier | 99 |
| GID | Group Identifier | 100 |

# Run example
```
docker run --name CS2D -d \
    -p 36963:36963/udp \
    --env 'GAME_PARAMS=' \
    --env 'GAME_PORT=36963' \
    --env 'FORCE_UPDATE=' \
    --env 'UID=99' \
    --env 'GID=100' \
    --volume /mnt/user/appdata/cs2d:/serverdata/serverfiles \
    --restart=unless-stopped \
    ich777/cs2dserver:latest
```

This Docker was mainly created for the use with Unraid, if you don’t use Unraid you should definitely try it!

#### Support Thread: https://forums.unraid.net/topic/79530-support-ich777-gameserver-dockers/