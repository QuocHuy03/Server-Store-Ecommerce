const connect = require("../config/connect.config");

const userModel = {
  createUser: async (data) => {
    try {
      const [result] = await connect.execute(
        "INSERT INTO users (`fullname`,`username`,`email`, `password`) VALUES (?,?,?,?)",
        [data.fullname, data.username, data.email, data.password]
      );

      return result;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  checkDuplicateUser: async (data) => {
    try {
      const [result] = await connect.execute(
        "SELECT * FROM users WHERE `email` = ?",
        [data]
      );
      return result.length > 0;
    } catch (error) {
      console.error("Lỗi trong quá trình kiểm tra trùng lặp danh mục:", error);
      throw error;
    }
  },

  checkUser: async (data) => {
    try {
      const [result] = await connect.execute(
        "SELECT * FROM users WHERE username = ?",
        [data]
      );
      return result;
    } catch (error) {
      console.error("Lỗi trong quá trình kiểm tra trùng lặp danh mục:", error);
      throw error;
    }
  },
};

module.exports = userModel;
