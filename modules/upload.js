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

router.post("/", uploadCloud.single("file"), async (req, res, next) => {
  try {
    if (!req.file) {
      throw new Error("No file uploaded!");
    }

    const result = await cloudinary.uploader.upload(req.file.path);
    const imageUrl = result.secure_url;

    res.json({ secure_url: imageUrl });
  } catch (err) {
    next(err);
  }
});

module.exports = router;
