$ env GOOS=linux GOARCH=amd64 go build -v github.com/freiny/projectfolder

$ docker build -t test .
$ docker run test

$ docker run -it test /bin/bash


# copy from host to running image
$ docker cp file.txt ContainerID:/somefolder/file.txt

# copy form running image to host
$ docker cp ContainerID:/somefolder/file.txt file.txt

# delete all containers
$ docker rm $(docker ps -a -q)

# delete all images
$ docker rmi $(docker images -q)

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
