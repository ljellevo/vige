const express = require('express');
const cors = require('cors');
const app = express();
const WebSocket = require('ws');
const wss = new WebSocket.Server({port: 3001});


wss.on('connection', function connection(ws) {
  ws.on('message', function incomming(message) {
    console.log("Recieved message: " + message);
  })

  setInterval(() => {
    ws.send(new Date().toTimeString());
  }, 1000);
});



app.use(cors())
app.use(express.json());
app.use(express.static('bin'));


app.get('/test', function(req, res){
    res.send("I am a message from the server!");
});


app.listen(3000, function(){
  console.log("Listening on port 3000!")
});