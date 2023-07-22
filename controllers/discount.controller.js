const discountModel = require("../models/discount.model");

exports.listDiscount = (req, res, next) => {
  discountModel
    .getAllDiscount()
    .then((data) => {
      res.status(200).json(data);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.getDiscountById = (req, res, next) => {
  const id = req.params.id;
  discountModel
    .getDiscountById(id)
    .then((data) => {
      res.status(200).json(data);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.postDiscount = async (req, res, next) => {
  try {
    const existingDiscount = await discountModel.checkDuplicateDiscount(
      req.body.name
    );

    if (existingDiscount) {
      return res
        .status(200)
        .json({ status: false, message: "Mã giảm giá đã tồn tại!" });
    }

    const result = await discountModel.createDiscount(req.body);

    if (result) {
      return res.status(200).json({
        status: true,
        message: "Áp Dụng Mã Giảm Giá Thành Công",
        result,
      });
    } else {
      next();
    }
  } catch (error) {
    console.error(error);
    return res
      .status(500)
      .json({ status: false, message: "Lỗi trong quá trình apply discount!" });
  }
};

exports.deleteDiscountById = (req, res, next) => {
  discountModel
    .deleteDiscount(req.params.id)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Mã Giảm Giá Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete  Mã Giảm Giá Thất Bại" });
    });
};
