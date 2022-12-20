const express = require("express");
const connection = require("../db");

connection
  .promise()
  .query("use blog;")
  .catch((e) => console.error(e));

const app = express();
app.use(express.json());

module.exports = app;
