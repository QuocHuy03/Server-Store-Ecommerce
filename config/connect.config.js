const mysql = require("mysql2/promise");

const connect = mysql.createPool({
  host: "103.200.23.139",
  user: "quochuyd_profile",
  password: "quochuyd_profile",
  port: 3306,
  database: "quochuyd_profile"
});

if (!connect) {
  console.log("Connect Failed");
}

module.exports = connect;
