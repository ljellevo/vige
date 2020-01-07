module.exports = function(app) {
  const Database = require("./database");



  
  app.get('/widgets/categories', function(req, res){
    var database = new Database();

    database.query(function(client) {
      const collection = client.db("static").collection("categories");
      collection.find({}).toArray(function(err, result) {
        if(err) console.log(err);
        console.log(result);
        res.send(result);
      })
    });
  });
}