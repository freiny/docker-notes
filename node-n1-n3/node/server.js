'use strict';

const express = require('express');
const PORT = process.env.HTTP_PORT;
// const PORT = 8080;

const app = express();
app.get('/', function (req, res) {
  res.send('Hello World!\n');
	var x = 0;
	for(var i=0;i<400000000;i++){
		x++;
	}
	console.log("ping", x);
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
