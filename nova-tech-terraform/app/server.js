const http = require("http");

const PORT = 3002;

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("🚀 NovaTech Node.js App is running on AWS via Terraform!");
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
