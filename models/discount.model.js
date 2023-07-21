const connect = require("../config/connect.config");

const discountModel = {
  getAllDiscount: async () => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `discounts` ORDER BY id DESC"
      );
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  createDiscount: async (data) => {
    try {
      const [result] = await connect.execute(
        "INSERT INTO discounts (`name`, `totalPrice`, `userID`) VALUES (?,?,?)",
        [data.name, data.totalPrice, data.userID]
      );
      const [newDiscount] = await connect.execute(
        "SELECT * FROM discounts WHERE id = ?",
        [result.insertId]
      );

      return newDiscount;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  checkDuplicateDiscount: async (name) => {
    try {
      const [result] = await connect.execute(
        "SELECT * FROM discounts WHERE `name` = ?",
        [name]
      );
      return result.length > 0;
    } catch (error) {
      console.error("Lỗi trong quá trình kiểm tra trùng lặp :", error);
      throw error;
    }
  },

  deleteDiscount: async (id) => {
    try {
      const [existingDiscount] = await connect.execute(
        "SELECT * FROM discounts WHERE id = ?",
        [id]
      );

      if (existingDiscount.length === 0) {
        throw new Error("Discount not found");
      }

      await connect.execute("DELETE FROM `discounts` WHERE id = ?", [id]);
      return true;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },
};

module.exports = discountModel;
