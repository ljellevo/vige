
module.exports = class Database {

  constructor(){}

  ask(callback) {
    
  }

  query(callback) {
    var config = require('./database_config');
    const MongoClient = require('mongodb').MongoClient;

    const uri = config.config.url;

    const client = new MongoClient(uri, {useNewUrlParser: true, useUnifiedTopology: true});
    client.connect(err => {

      if(err) console.log(err)
      console.log("Done");
      callback(client);
      

      client.close();
    });
  }
  
  insertCatalogueDemoData(){
    console.log("Here");
    this.ask(function(client) {
      console.log("Insert");
      const collection = client.db("static").collection("catalogue");
      collection.insertMany([
        {"title": "Page", "desc": "test"}
      ])
    })
  }
}

/* 
module.exports = {
    ask: (performAction) => {
      var config = require('./database_config');
      const MongoClient = require('mongodb').MongoClient;
  
      const uri = config.config.url;
  
      const client = new MongoClient(uri, {useNewUrlParser: true, useUnifiedTopology: true});
      client.connect(err => {
        performAction(client);
        
        // perform actions on the collection object
        client.close();
      });
    },
  
    insertCatalogueDemoData: (client) => {
      console.log("Inser");
      const collection = client.db("static").collection("catalogue");
      collection.insertMany([
  
      ])
    }
  }
  */
