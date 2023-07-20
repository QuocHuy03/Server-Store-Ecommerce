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

  createOrder: async (data) => {
    console.log(data);
    try {
      const [existingRecord] = await connect.execute(
        "SELECT * FROM address WHERE userID = ?",
        [data.userID]
      );

      // Check if the record exists
      if (existingRecord.length === 0) {
        // The record doesn't exist, insert a new one
        const [insertedInformation] = await connect.execute(
          "INSERT INTO address (`userID`,`phone`,`city`,`district`,`commune`,`address`) VALUES (?,?,?,?,?,?)",
          [
            data.userID,
            data.values.phone,
            data.values.city,
            data.values.district,
            data.values.commune,
            data.values.address,
          ]
        );

        console.log("Insert successful.");
      } else {
        // The record exists, check if there are any changes
        const existingData = existingRecord[0];

        const hasChanged =
          existingData.phone !== data.values.phone ||
          existingData.city !== data.values.city ||
          existingData.district !== data.values.district ||
          existingData.commune !== data.values.commune;
          existingData.address !== data.values.address;

        if (hasChanged) {
          const [updatedInformation] = await connect.execute(
            "UPDATE address SET phone = ?, city = ?, district = ?, commune = ?, address = ? WHERE userID = ?",
            [
              data.values.phone,
              data.values.city,
              data.values.district,
              data.values.commune,
              data.values.address,
              data.userID,
            ]
          );

          console.log("Update successful.");
        } else {
          console.log("No changes to update.");
        }
      }
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
