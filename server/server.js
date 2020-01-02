const express = require('express');
const cors = require('cors');
const app = express();
var path = require('path');
app.use(cors())
app.use(express.json());
app.use(express.static('bin'));

/*
app.get('*', function(req, res){
  res.sendFile(path.join(__dirname, '../bin/index.html'));
});
*/


app.get('/test', function(req, res){
  setTimeout(function(){
    res.send("Hello World");
  }, 1000);
  
});


 

app.listen(3000, function(){
  console.log("Listening on port 3000!")
});