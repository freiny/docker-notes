#!/bin/sh

if hash nodemon 2>/dev/null; then
	nodemon -L server.js
else
	npm install
	npm install -g --force nodemon
	nodemon -L server.js
fi
