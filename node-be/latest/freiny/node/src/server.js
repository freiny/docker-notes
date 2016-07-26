'use strict';

const express = require('express');
const PORT = process.env.DOCKER_BACKEND_PORT;

const app = express();
app.get('/', function (req, res) {
  res.send('BE Hello World!\n');
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
