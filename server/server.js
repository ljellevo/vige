const express = require('express');
const cors = require('cors');
const app = express();

var sockets = require("./websockets")(app);
var path = require('path');

app.use(cors())
app.use(express.json());
//app.use("*", express.static(path.join(__dirname, '/../bin/index.html')));

/*

app.use(express.static('bin'));
*/
app.use("/", express.static('bin'));

//app.use("/widgets", express.static('bin'));
//app.use(express.static(path.join(__dirname, '/../bin')));


const rest = require("./maintenance")(app);
const api = require("./api")(app); 



/*
app.get('/widgets/:category', function(req, res, next){
    console.log("query");
    //res.send("From server")
    res.sendFile(path.resolve(__dirname + '/../bin/index.html')); 
    //res.render(path.resolve(__dirname + '/../bin/index.html'));
    next()
});
*/
/*
app.get('/widgets/category', function(req, res, next){
  console.log("query");
  console.log("specific page was requested");
  console.log(path.resolve(__dirname + '/../bin'));
  //res.send("From server")
  res.sendFile(path.resolve(__dirname + '/../bin/index.html'));
  //res.render(path.resolve(__dirname + '/../bin/index.html'));
});

app.use("/*", function(req, res) {
    //resp.sendFile("/../bin/index.html");
    res.sendFile(path.resolve(__dirname + '/../bin/index.html')); 
});
*/

app.get("*", function(req, res, next){
  //res.redirect("/");
  console.log("page was requested"); 
  console.log(path.resolve(__dirname + '/../bin/index.html'));
  //app.use(express.static('bin'));
  res.sendFile(path.resolve(__dirname + '/../bin/index.html')); 
  //res.sendFile(path.join(__dirname, '../bin', 'index.html'));
  
 //res.render(path.resolve(__dirname + '/../bin/index.html'));
}); 


//https://medium.com/@lowewenzel/serving-express-with-a-react-single-page-app-within-the-same-application-c168f1c44201
 

/*
app.get('/*', function(req, res, next){
  //app.use(express.static('bin'));
  //res.sendFile(path.resolve(__dirname + '/../bin/index.html')); 
  
 //res.render(path.resolve(__dirname + '/../bin/index.html'));
});
*/









app.listen(3000, function(){
  console.log("Listening on port 3000!")
});

