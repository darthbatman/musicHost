var app = require("express")();
var http = require("http").Server(app);
var static = require('node-static');

app.get("/", function(req, res){
   res.send("<embed name=\"yv\" src=\"\" loop=\"false\" hidden=\"true\" autostart=\true\">");
});

var fileServer = new static.Server('./');

require('http').createServer(function (request, response) {
    request.addListener('end', function () {
        fileServer.serve(request, response);
    }).resume();
}).listen(8899);

http.listen(8080, function(){
   console.log("Listening on *:8080"); 
});