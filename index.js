var http = require('http');

const app = http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('Hello World!');
});
app.listen(9003,()=> console.log("listening server"));