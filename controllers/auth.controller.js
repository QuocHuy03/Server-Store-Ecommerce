const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const userModel = require("../models/user.model");

exports.register = async (req, res, next) => {
  const { fullname, username, email, password, verifyPassword } = req.body;
  try {
    const checkDuplicateUser = await userModel.checkDuplicateUser(email);
    if (checkDuplicateUser) {
      return res
        .status(200)
        .json({ status: false, message: "Email đã được đăng ký trước đó" });
    }

    if (password !== verifyPassword) {
      return res
        .status(200)
        .json({ status: false, message: "Mật khẩu xác nhận không khớp" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = {
      fullname,
      username,
      email,
      password: hashedPassword,
    };

    const createdUser = await userModel.createUser(newUser);

    const payload = {
      user: {
        id: createdUser.insertId,
        fullname,
        username,
        email,
      },
    };

    jwt.sign(payload, "LeQuocHuy", { expiresIn: "7d" }, (err, token) => {
      if (err) {
        return res
          .status(200)
          .json({ status: false, message: "Lỗi Nghiêm Trọng" });
      }

      res.status(200).json({
        status: true,
        message: "Đăng ký thành công",
        accessToken: token,
      });
    });
  } catch (err) {
    console.log(err);
    return res
      .status(500)
      .json({ status: false, message: "Lỗi trong quá trình đăng ký" });
  }
};

exports.login = async (req, res, next) => {
  const { username, password } = req.body;

  try {
    const checkUser = await userModel.checkUser(username);

    if (checkUser.length === 0) {
      return res
        .status(200)
        .json({ status: false, message: "Tên đăng nhập không tồn tại" });
    }

    const user = checkUser[0];

    const passwordMatch = await bcrypt.compare(password, user.password);

    if (!passwordMatch) {
      return res
        .status(200)
        .json({ status: false, message: "Mật khẩu không đúng" });
    }

    const payload = user;

    jwt.sign(payload, "LeQuocHuy", { expiresIn: "7d" }, (err, token) => {
      if (err) {
        console.log(err);
        return res
          .status(200)
          .json({ status: false, message: "Lỗi Nghiêm Trọng" });
      }

      res.status(200).json({
        status: true,
        message: "Đăng nhập thành công",
        accessToken: token,
      });
    });
  } catch (err) {
    return res
      .status(500)
      .json({ status: false, message: "Lỗi trong quá trình đăng nhập" });
  }
};

exports.verifyAccessToken = async (req, res, next) => {
  const accessToken = req.headers.authorization.split(" ")[1];
  if (!accessToken) {
    return res.status(401).json({ message: "Access Token is missing" });
  }
  try {
    jwt.verify(accessToken, "LeQuocHuy", (err, decoded) => {
      if (err) {
        res.status(401).json({ message: "Unauthorized" });
      } else {
        res.json(decoded);
      }
    });
  } catch (error) {
    return res.status(401).json({ message: "Invalid Access Token" });
  }
};
