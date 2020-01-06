module.exports = function(app) {
    const Database = require("./database");

    app.get('/test', function(req, res){
        res.send("I am a message from the server!");
    });
    
    
    app.get('/widgets', function(req, res){
      res.send("I am a message from the server!");
    });
    
    
    app.get('/database/:operation', function(req, res){
      var operation = req.params.operation;


      var database = new Database();
      
    
      if(operation == "insertDemoData") {
       database.query(function(client) {
        const collection = client.db("static").collection("catalogue");
        collection.insertMany([
          {"title": "Page", "desc": "test"}
        ])
        res.send("Inserting of demodata was successful");
       });
      } else if(operation == "deleteDemoData") {
        database.query(function(client) {
          const collection = client.db("static").collection("catalogue");
          collection.deleteMany({})
          res.send("Deleting of demodata was successful");
         });
      }
    });
}