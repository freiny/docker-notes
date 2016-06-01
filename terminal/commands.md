$ env GOOS=linux GOARCH=amd64 go build -v github.com/freiny/projectfolder

$ docker build -t test .
$ docker run test

$ docker run -it test /bin/bash

