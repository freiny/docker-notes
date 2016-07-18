'use strict';
// console.log(process.env.HTTP_PORT)

const PORT = 20080;

const express = require('express');
const app = express();

app.use(
	express.static('public')
);

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
