module.exports = function(app) {
  const Database = require("./database");



  
  app.get('/api/widgets/categories', function(req, res){
    var database = new Database();
    console.log("API was requested");
    database.query(function(client) {
      const collection = client.db("static").collection("categories");
      collection.find({}).toArray(function(err, result) {
        if(err) console.log(err);
        //console.log(result);
        res.send(result);
      })
    });
  });
}