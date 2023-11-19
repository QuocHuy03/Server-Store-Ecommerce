const mysql = require("mysql2/promise");

const connect = mysql.createPool({
  host: "103.169.35.190",
  user: "ecommerce",
  password: "~UpQcl.gpV&}",
  port: 3306,
  database: "ecommerce"
});

if (!connect) {
  console.log("Connect Failed");
}

module.exports = connect;
