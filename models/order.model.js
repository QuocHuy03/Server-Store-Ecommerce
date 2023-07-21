const connect = require("../config/connect.config");
const slugify = require("slugify");
const { v4: uuidv4 } = require("uuid");
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
    try {
      const cartOrderJson = JSON.stringify(data.data.carts);

      if (data.data.methodPayment === "vnpay") {
        const uid = uuidv4();
        const [existingOrder] = await connect.execute(
          "SELECT * FROM paymentvnpay WHERE vnp_TransactionNo = ?",
          [data.data.paymentVnpay.vnp_TransactionNo]
        );
        if (existingOrder && existingOrder.length > 0) {
          return existingOrder;
        } else {
          const [huyit] = await connect.execute(
            "INSERT INTO paymentvnpay (`vnp_Amount`, `vnp_BankCode`, `vnp_BankTranNo`, `vnp_CardType`, `vnp_OrderInfo`, `vnp_TransactionNo`, `vnp_TransactionStatus`) VALUES (?,?,?,?,?,?,?)",
            [
              data.data.paymentVnpay.vnp_Amount,
              data.data.paymentVnpay.vnp_BankCode,
              data.data.paymentVnpay.vnp_BankTranNo,
              data.data.paymentVnpay.vnp_CardType,
              data.data.paymentVnpay.vnp_OrderInfo,
              data.data.paymentVnpay.vnp_TransactionNo,
              data.data.paymentVnpay.vnp_TransactionStatus,
            ]
          );

          const [result] = await connect.execute(
            "INSERT INTO orders (`code`,`userID`, `vnpayID`, `productOrder`, `totalPrice`, `paymentMethod`) VALUES (?,?,?,?,?,?)",
            [
              uid,
              data.data.userID,
              huyit.insertId,
              cartOrderJson,
              data.data.totalPrice,
              data.data.methodPayment,
            ]
          );

          const [insertedOrder] = await connect.execute(
            "SELECT * FROM orders WHERE id = ?",
            [result.insertId]
          );

          return insertedOrder[0];
        }
      } else if (data.data.methodPayment === "receive") {
        const uid = uuidv4();
        const [result] = await connect.execute(
          "INSERT INTO orders (`code`,`userID`, `productOrder`, `totalPrice`, `paymentMethod`) VALUES (?,?,?,?,?)",
          [
            uid,
            data.data.userID,
            cartOrderJson,
            data.data.totalPrice,
            data.data.methodPayment,
          ]
        );

        const [insertedOrder] = await connect.execute(
          "SELECT * FROM orders WHERE id = ?",
          [result.insertId]
        );

        return insertedOrder[0];
      } else {
        console.error("Lỗi không có phương phức thanh toán");
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
