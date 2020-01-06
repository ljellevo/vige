const express = require('express');
const cors = require('cors');
const app = express();

var sockets = require("./websockets")(app);
var path = require('path');

app.use(cors())
app.use(express.json());
app.use(express.static('bin'));



const rest = require("./rest")(app);


  

 

app.get('/*', function(req, res, next){
  res.sendFile(path.resolve(__dirname + '/../bin/index.html')); 
});


app.listen(3000, function(){
  console.log("Listening on port 3000!")
});

