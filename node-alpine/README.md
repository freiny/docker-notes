## Setup

<pre><code>
# build the new image
$ docker build -t tag-name .

# setup ports, volumes
$ docker run -p 10080:10080 -v $FLOCAL/docker/node-alpine/code:/code -d tag-name

# verify server is running
$ curl localhost:10080

</code></pre>
