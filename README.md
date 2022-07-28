# docker-steam-tf2
Container for running Team Fortress 2 dedicated server.



## Building and running from github

Update docker-compose.yml and cfg
```
docker-compose build
docker-compose up -d
```



## Default server startup options:

```
+log on +sv_pure 1 +map cp_granary +maxplayers 24
```

Update in docker-compose.yml