'use strict';

const PORT = process.env.DOCKER_FRONTEND_PORT;
const express = require('express');
const app = express();

app.use(
	express.static('public')
);

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
