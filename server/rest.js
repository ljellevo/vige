module.exports = function(app) {
  const Database = require("./database");


  app.get('/maintenance/database/widgets/categories/:operation', function(req, res){
    var operation = req.params.operation;

    var database = new Database();
    
  
    if(operation == "insert") {
      database.query(function(client) {
        const collection = client.db("static").collection("categories");
        collection.insertMany([
          {"title": "Layout", "desc": "Widgets that is used to structure the layout of the website", "order": 0},
          {"title": "Functionality", "desc": "Widgets that provide functionality to the website", "order": 1},
          {"title": "Customization", "desc": "Components used to customize widgets", "order": 2},
          {"title": "Components", "desc": "More spesific and complete components that is used for clearly defined usecases", "order": 3},
          {"title": "Utilities", "desc": "Technical tools to help utilize the features provided by the browser", "order": 4},
        ]);
        res.send("Categories was " + operation + "ed");
      });
    } else if(operation == "delete") {
      database.query(function(client) {
        const collection = client.db("static").collection("categories");
        collection.deleteMany({})
        res.send("Categories was " + operation + "d");
      });
    }
  });
  
  app.get('/maintenance/database/widgets/catalogue/:operation', function(req, res){
    var operation = req.params.operation;

    var database = new Database();
    
  
    if(operation == "insert") {
      database.query(function(client) {
        const collection = client.db("static").collection("catalogue");
        collection.insertMany([
          {"title": "Page", "desc": "test"}
        ])
        res.send("Catalogue was " + operation + "ed");
      });
    } else if(operation == "delete") {
      database.query(function(client) {
        const collection = client.db("static").collection("catalogue");
        collection.deleteMany({})
        res.send("Catalogue was " + operation + "d");
      });
    }
  });

  app.get('/test', function(req, res){
    res.send("Single response");
  });
}