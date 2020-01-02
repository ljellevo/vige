
const express = require('express');
const cors = require('cors');

const app = express();

var path = require('path');


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


/*
app.get('*', function(req, res){
  res.sendFile(path.join(__dirname, '../bin/index.html'));
});
*/

var expressWs = require('express-ws')(app);

app.get('/test', function(req, res){
    res.send("Hello World");
  

});


/*
app.ws('/socket', function(ws, req) {
  ws.on('open', function(msg) {
    ws.send("WebSocket is open");
  });

  ws.on('message', function(msg) {
    setInterval(() => {
      ws.send(new Date().toTimeString());
    }, 1000);
  });

  

  ws.on('close', function(msg) {
    ws.send("Server closed connection");
  });
})

*/






 

app.listen(3000, function(){
  console.log("Listening on port 3000!")
});