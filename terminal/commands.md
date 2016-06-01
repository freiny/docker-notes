$ env GOOS=linux GOARCH=amd64 go build -v github.com/freiny/projectfolder

$ docker build -t test .
$ docker run test

$ docker run -it test /bin/bash


# copy from host to running image
$ docker cp file.txt ContainerID:/somefolder/file.txt

# copy form running image to host
$ docker cp ContainerID:/somefolder/file.txt file.txt 

