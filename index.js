var http = require('http');
var couchbase = require('couchbase');
var cluster = new couchbase.Cluster('couchbase://127.0.0.1:8091', {
  username: 'Administrator',
  password: 'Test@1234',
});






const app = http.createServer(function (req, res) {
  var bucket = cluster.bucket('nodejs');
  var coll = bucket.defaultCollection();
  coll.get('1',(err,result)=>{
    if(err){
      res.writeHead(200, {'Content-Type': 'text/html'});
      res.end("No data found");
    }    
    else{
      res.writeHead(200, {'Content-Type': 'text/html'});
      res.end(JSON.stringify(result.value));
    }      
  })
  
});
app.listen(9003,()=> console.log("listening server"));