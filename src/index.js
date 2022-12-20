require("dotenv").config();
const app = require("./app");

const PORT = process.env.server_port || 8000;

app.listen(PORT, (err) => {
  if (err) console.error(err);
  console.log(`Server running on http://localhost:${PORT}`);
});
