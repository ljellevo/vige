const express = require('express');
const cors = require('cors');
const app = express();
var sockets = require("./websockets")(app);
var path = require('path');


//Middleware
app.use(cors())
app.use(express.json());
app.use(express.static('bin'));


//Developer routes for quick data load/removal
const rest = require("./maintenance")(app);


//Backend routes for data retriveal/upload
const api = require("./api")(app);  


//Page routings
app.get('/widgets/*', function (req, res) {
  console.log("Widget category was requested")
  res.sendFile(path.resolve(__dirname, '../bin/index.html'))
});

app.get('/guides/*', function (req, res) {
  console.log("Widget category was requested")
  res.sendFile(path.resolve(__dirname, '../bin/index.html'))
});

app.get('/*', function (req, res) {
  res.sendFile(path.resolve(__dirname, '../bin/index.html'))
});



app.listen(3000, function(){
  console.log("Listening on port 3000!")
});

