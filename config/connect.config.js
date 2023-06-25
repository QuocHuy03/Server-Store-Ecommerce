const mysql = require("mysql2/promise");

const connect = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  port: 3306,
  database: "ecommerce",
});

if (!connect) {
  console.log("Connect Failed");
}

module.exports = connect;
