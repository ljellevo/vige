const express = require('express');
const app = express();
var path = require('path');
app.use(express.json());
app.use(express.static('bin'));

/*
app.get('*', function(req, res){
  res.sendFile(path.join(__dirname, '../bin/index.html'));
});
*/

 

app.listen(3000, function(){
  console.log("Listening on port 3000!")
});