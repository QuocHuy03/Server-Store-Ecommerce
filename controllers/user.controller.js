const userModel = require("../models/user.model");

exports.listUsers = (req, res, next) => {
  userModel
    .getAllUser()
    .then((data) => {
      res.status(200).json(data);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.getUserById = (req, res, next) => {
  const id = req.params.id;
  userModel
    .getUserById(id)
    .then((data) => {
      res.status(200).json(data);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.updateUser = (req, res, next) => {
  userModel
    .updateUser(req.params.id, req.body.data)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Update User Thành Công", data });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Update User Thất Bại" });
    });
};

exports.deleteUserById = (req, res, next) => {
  userModel
    .deleteUser(req.params.id)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete User Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Order Thất Bại" });
    });
};
