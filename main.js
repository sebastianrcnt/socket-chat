const app = require("express")();
const http = require("http").createServer(app);
const io = require("socket.io")(http);

app.get("/", (req, res) => {
  res.send("<h1>Hello, World!</h1>");
});

io.on("connection", (socket) => {
  console.log("A User is connected");
});

http.listen(3000, () => {
  console.log("listening on port 3000");
});
