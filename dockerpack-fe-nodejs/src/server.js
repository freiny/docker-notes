'use strict';

const express = require('express');
const PORT = process.env.HTTP_PORT;

const app = express();

app.use(
	express.static('public')
);

app.get('/server', function (req, res) {
  res.send('FE Hello World! (server)\n');
	console.log("ping");
});

app.listen(PORT);

if (process.env.APP_ENVIRONMENT === "dev"){
	console.log('****************** App Ready');
}
