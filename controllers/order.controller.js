const orderModel = require("../models/order.model");

exports.listOrder = (req, res, next) => {
  orderModel
    .getAllOrder()
    .then((data) => {
      res.status(200).json(data);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.getOrderById = (req, res, next) => {
  const id = req.params.id;
  orderModel
    .getOrderById(id)
    .then((data) => {
      res.status(200).json(data);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.postOrder = async (req, res, next) => {
  try {
    const result = await orderModel.createOrder(req.body);

    if (result) {
      return res
        .status(200)
        .json({ status: true, message: "Thanh Toán Thành Công !", result });
    } else {
      next();
    }
  } catch (error) {
    console.error(error);
    return res
      .status(500)
      .json({ status: false, message: "Lỗi trong quá trình thanh toán !" });
  }
};

exports.updateStatus = (req, res, next) => {
  orderModel
    .updateStatus(req.params.id, req.body.data)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Update Trạng Thái Thành Công", data });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Update Trạng Thái Thất Bại" });
    });
};

exports.deleteOrderById = (req, res, next) => {
  orderModel
    .deleteOrder(req.params.id)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Order Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Order Thất Bại" });
    });
};
