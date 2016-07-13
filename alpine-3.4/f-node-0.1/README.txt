# Run a container from alpine linux image, then install python, node.js, and nodemon
$ docker run alpine:3.4 --name tempcname sh -c "apk add --update python; apk add --update nodejs; npm install -g nodemon"

# Create image from container
$ docker commit tempcname tempiname

# Remove container
$ docker rm tempcname

# Name and Tag temporary image
$ docker tag tempiname f-node:0.1

# Remove temporary image
$ docker rmi tempiname
