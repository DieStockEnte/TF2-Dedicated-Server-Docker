# TF2 dedicated server with Docker compose
With this docker compose you can create customizable dedicated servers for Team Fortress 2.
This might only work on Linux operating systems and not on Windows.
This Docker compose needs approximately 7GB of disk space.

## Building and running
**1.** Install Docker and Docker-Compose.<br />
**2.** Download all files from this repository and put them in a folder.<br />
**3.** Go with your CMD into the folder and run the following commands:<br />
```
docker-compose build
docker-compose up -d
```
**And your done!** You should now be able to connect to your tf2 server.
If you are not able to connect to the server, then check if the ports `27015/udp` and `27015/tpc` are open.

### With the following commands you can do some actions with the server:
#### See if a container is existing and running:
```
docker ls
```
#### Stop the server:
```
docker-compose stop
```
#### Enter into the docker containers CMD, for example to see logs:
`<container-id>` Insert here the id of the container or if it works just `tf`. Leave the `<>` signs away.
```
docker exec -it <container-id> bash
```
If you want to leave the Docker containers CMD press `ctrl` + `c`.

## Settings:
### Add plugins to the server:
To add plugins to the server, go under `addons/sourcemod/plugins` and add there the plugin file.

### Change the tf2 server settings:
You can change settings inside `cfg/server.cfg`

### Change the motd when entering the server:
You can change the motd inside `cfg/motd.txt`. Inside this file can be plain text or HTML code.

### Add a map:
Insert you map into the `maps/` folder and then go inside `cfg/mapcycle.txt` and write the filename without the file ending. For every map use a seperate line. For example:
```
koth_hangar_rc5
ctf_2fort
pl_test_map_a1
```
### Add a bots:
To add bots add these lines to the config file `cfg/server.cfg`:
```
tf_bot_quota 24
tf_bot_quota_mode "fill"
tf_bot_auto_vacate 1
```

## Final part:
You can use, change, share and modify the files in this repository.<br />
I do not own and did not created the map `koth_hangar_rc5.bsp`. Credits go to: *Uncuepa*<br />
If you have any questions or want to contribute to this repository feel free to do so!<br />
Have fun with this little project! 😜
