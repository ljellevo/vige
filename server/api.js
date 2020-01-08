module.exports = function(app) {
  const Database = require("./database");
  var ObjcetId = require('mongodb').ObjectId;



  
  app.get('/api/widgets/categories', function(req, res){
    var database = new Database();
    database.query(function(client) {
      const collection = client.db("static").collection("categories");
      collection.find({}).toArray(function(err, result) {
        if(err) console.log(err);
        //console.log(result);
        res.send(result);
      })
    });
  });

  app.get('/api/guides', function(req, res){
    var database = new Database();
    database.query(function(client) {
      const collection = client.db("static").collection("quick-start-guides");
      collection.find({}, {projection: {_id: 1, title: 1, desc: 1}}).toArray(function(err, result) {
        if(err) console.log(err);
        //console.log(result);
        res.send(result);
      })
    });
  });

  app.get('/api/guides/:id', function(req, res){
    var id = req.params.id
    console.log(id);
    var database = new Database();
    database.query(function(client) {
      const collection = client.db("static").collection("quick-start-guides");
      collection.findOne({_id: ObjcetId(id)}, function(err, result){

        if(err) console.log(err);
        console.log(result);
        res.send(result);
      })
    });
  });
}