const connect = require("../config/connect.config");

const userModel = {
  getAllUser: async () => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `users` ORDER BY id DESC"
      );
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  getUserById: async (id) => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `users` WHERE id = ?",
        [id]
      );
      return data[0];
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },
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

  updateUser: async (id, data) => {
    try {
      const [existingUser] = await connect.execute(
        "SELECT * FROM users WHERE id = ?",
        [id]
      );

      if (existingUser.length === 0) {
        throw new Error("User not found");
      }

      await connect.execute(
        "UPDATE `users` SET `email` = ?, `fullname` = ? , `username` = ? ,`phone` = ?, `address` = ?, `role` = ? WHERE id = ?",
        [
          data.email,
          data.fullname,
          data.username,
          data.phone,
          data.address,
          data.role,
          id,
        ]
      );

      const [updatedUser] = await connect.execute(
        "SELECT * FROM users WHERE id = ?",
        [id]
      );

      return updatedUser;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
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
      console.error("Lỗi trong quá trình kiểm tra trùng lặp user:", error);
      throw error;
    }
  },

  deleteUser: async (id) => {
    try {
      const [existingUser] = await connect.execute(
        "SELECT * FROM users WHERE id = ?",
        [id]
      );

      if (existingUser.length === 0) {
        throw new Error("User not found");
      }

      await connect.execute("DELETE FROM `users` WHERE id = ?", [id]);
      return true;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },
};

module.exports = userModel;
