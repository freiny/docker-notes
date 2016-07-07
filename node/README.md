## Setup

<pre><code>
# build the new image
$ docker build -t node-custom .

# setup ports, volumes
$ docker run -p 8080:8080 -v $FLOCAL/docker/node/code:/code -d node-custom

# the container enters at start.sh
# on first-run it installs dependencies from package.json
# (copying node_modules to the host folder for next run)
# then installs and runs nodemon

# changes to code take effect immediately and can be seen with a browser refresh

</code></pre>
