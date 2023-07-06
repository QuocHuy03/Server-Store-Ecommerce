const connect = require("../config/connect.config");
const slugify = require("slugify");

const orderModel = {
  getAllOrder: async () => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `orders` ORDER BY id DESC"
      );
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  getOrderById: async (order) => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `orders` WHERE id = ?",
        [order]
      );
      return data[0];
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  createOrder: async (cateData) => {
    try {
      const [result] = await connect.execute(
        "INSERT INTO orders (`nameCategory`,`slugCategory`,`outstandingCategory`,`statusCategory`) VALUES (?,?,?,?)",
        [
          cateData.nameCategory,
          slugify(cateData.nameCategory, { lower: true }),
          cateData.outstandingCategory,
          cateData.statusCategory,
        ]
      );
      const [newCategory] = await connect.execute(
        "SELECT * FROM orders WHERE id = ?",
        [result.insertId]
      );

      return newCategory;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  updateStatus: async (id, data) => {
    try {
      const [existingOrder] = await connect.execute(
        "SELECT * FROM orders WHERE id = ?",
        [id]
      );

      if (existingOrder.length === 0) {
        throw new Error("Order not found");
      }

      await connect.execute("UPDATE `order` SET `status` = ?", [data.status]);

      const [updatedOrder] = await connect.execute(
        "SELECT * FROM orders WHERE id = ?",
        [id]
      );

      return updatedOrder;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteOrder: async (id) => {
    try {
      const [existingOrder] = await connect.execute(
        "SELECT * FROM orders WHERE id = ?",
        [id]
      );

      if (existingOrder.length === 0) {
        throw new Error("Order not found");
      }

      await connect.execute("DELETE FROM `orders` WHERE id = ?", [id]);
      return true;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },
};

module.exports = orderModel;
