

module.exports = function(app) {
  const WebSocket = require('ws');

  
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
}
