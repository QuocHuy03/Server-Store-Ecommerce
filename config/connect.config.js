const mysql = require("mysql2/promise");

const connect = async () => {
  try {
    const pool = mysql.createPool({
      host: "103.169.35.190",
      user: "ecommerce",
      password: "~UpQcl.gpV&}",
      port: 3306,
      database: "ecommerce"
    });

    // Kiểm tra kết nối
    await pool.getConnection();
    console.log("Connect successful");
    return pool;
  } catch (error) {
    console.error("Connect failed:", error.message);
    throw error;
  }
};

module.exports = connect;
