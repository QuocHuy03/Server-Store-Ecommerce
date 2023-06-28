const jwt = require("jsonwebtoken");

exports.verifyAccessTokenMiddleware = async (req, res, next) => {
  try {
    const accessToken = req.headers.authorization.split(" ")[1];
    if (!accessToken) {
      return res
        .status(200)
        .json({ status: false, message: "Access Token is missing" });
    }
    jwt.verify(accessToken, "LeQuocHuy", (err, decoded) => {
      if (err) {
        res.status(200).json({ status: false, message: "Unauthorized" });
      } else {
        req.user = decoded;
        next();
      }
    });
  } catch (error) {
    return res
      .status(200)
      .json({ status: false, message: "Invalid Access Token" });
  }
};
