# ---------------------------------------------------------------------------
# GOLANG CROSS-COMPILE

$ env GOOS=linux GOARCH=amd64 go build -v github.com/freiny/projectfolder

# ---------------------------------------------------------------------------
# BUILD

$ docker build -t test .
$ docker run test

$ docker run -it test /bin/bash

# ---------------------------------------------------------------------------
# COPY

# copy from host to running image
$ docker cp file.txt ContainerID:/somefolder/file.txt

# copy form running image to host
$ docker cp ContainerID:/somefolder/file.txt file.txt

# ---------------------------------------------------------------------------
# DELETE

# delete all containers
$ docker rm $(docker ps -a -q)

# delete all images
$ docker rmi $(docker images -q)

# ---------------------------------------------------------------------------
# RESET / FIX

# Reset/Fix Docker when giving following message:
# You may want to check your internet connection or if you are behind a proxy..
$ docker-machine restart default      # Restart the environment
$ eval $(docker-machine env default)  # Refresh your environment settings

# ---------------------------------------------------------------------------
# NGINX

$ docker build -t nginx-custom .
$ docker run --name nginx-a -d nginx-custom

# hostport:containerport => 8080:80
$ docker run --name nginx-a -d -p 8080:80 nginx-custom

# ---------------------------------------------------------------------------
# MYSQL

# mysql container
$ docker run --name db-mysql -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD -d mysql:5.7

$ docker run -i --name db -e MYSQL_ROOT_PASSWORD=abc mysql:5.7

# mysql shell access
$ docker exec -it db bash

$ mysql logs
$ docker logs db

# mysql shell
$ mysql -u root -p -e "create database somedb"
$ mysql -u root -pabc -e "show databases"
