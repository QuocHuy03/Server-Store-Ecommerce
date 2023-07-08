const colorModel = require("../models/color.model");

exports.listColor = (req, res, next) => {
  colorModel
    .getAllColor()
    .then((data) => {
      res.status(200).json(data);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.getColorById = (req, res, next) => {
  const id = req.params.id;
  colorModel
    .getColorById(id)
    .then((cate) => {
      res.status(200).json(cate);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.addColor = async (req, res, next) => {
  try {
    const existingColor = await colorModel.checkDuplicateColor(req.body.name);

    if (existingColor) {
      return res
        .status(200)
        .json({ status: false, message: "Color đã tồn tại!" });
    }

    const result = await colorModel.createColor(req.body);

    if (result) {
      return res
        .status(200)
        .json({ status: true, message: "Thêm color thành công!", result });
    } else {
      next();
    }
  } catch (error) {
    console.error(error);
    return res
      .status(500)
      .json({ status: false, message: "Lỗi trong quá trình thêm color !" });
  }
};

exports.updateColor = (req, res, next) => {
  colorModel
    .updateColor(req.params.id, req.body.data)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Update Color Thành Công", data });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Update Color Thất Bại" });
    });
};

exports.deleteColorById = (req, res, next) => {
  colorModel
    .deleteColor(req.params.id)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Color Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Color Thất Bại" });
    });
};

exports.deleteColorAll = (req, res, next) => {
  colorModel
    .deleteAllColor()
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Color Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Color Thất Bại" });
    });
};

exports.deleteColorsByIds = (req, res, next) => {
  // console.log(req.body.id.data);
  const colorIds = req.body.id.data;
  colorModel
    .deleteColorsByIds(colorIds)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Color Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Color Thất Bại" });
    });
};
