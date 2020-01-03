const express = require('express');
const cors = require('cors');
const app = express();
const WebSocket = require('ws');
var path = require('path');
const wss = new WebSocket.Server({port: 3001, noServer: true});


try {
wss.on('connection', function connection(ws) {
  ws.on('message', function incomming(message) {
    console.log("Recieved message: " + message);
  });

  ws.on('error', console.log);

  setInterval(() => {
    ws.send(new Date().toTimeString());
  }, 1000);
});
} catch (e) {
  console.log(e);
}



app.use(cors())
app.use(express.json());
app.use(express.static('bin'));


app.get('/test', function(req, res){
    res.send("I am a message from the server!");
});

app.get('*', function(req, res){
  //res.send("I am a message from the server yo");
  res.sendFile(path.resolve(__dirname + '/../bin/index.html')); 
});


app.listen(3000, function(){
  console.log("Listening on port 3000!")
});