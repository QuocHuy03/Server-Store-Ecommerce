const jwt = require("jsonwebtoken");

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
