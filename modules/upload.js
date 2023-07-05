const express = require("express");
const router = express.Router();

const cloudinary = require("cloudinary").v2;
const { CloudinaryStorage } = require("multer-storage-cloudinary");
const multer = require("multer");

cloudinary.config({
  cloud_name: "djy3vgwfi",
  api_key: "569177614734588",
  api_secret: "if-TZHrD9eTPjth-x-LsihL9F3k",
});

const storage = new CloudinaryStorage({
  cloudinary,
  params: {
    folder: "uploads",
    allowedFormats: ["jpg", "png"],
    transformation: [{ width: 400, height: 400, crop: "limit" }],
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});

const uploadCloud = multer({ storage });

router.post("/", uploadCloud.array("file[]"), async (req, res, next) => {
  try {
    if (!req.files || req.files.length === 0) {
      throw new Error("No files uploaded!");
    }

    const results = await Promise.all(
      req.files.map(async (file) => {
        const result = await cloudinary.uploader.upload(file.path);
        return result.secure_url;
      })
    );

    res.json({ secure_urls: results });
  } catch (err) {
    next(err);
  }
});

module.exports = router;
