const express = require("express");
const router = express.Router();

const categoryController = require("../controllers/category.controller");
const authController = require("../controllers/auth.controller");
const uploadModule = require("../modules/upload");

router.get("/", (req, res, next) => {
  res.send("Bé Họt Lu");
});

router.post("/addCategory", categoryController.addCategory);

router.get("/getAllCategories", categoryController.listCategory);
router.get("/getCategoryById/:id", categoryController.getCategoryById);
router.get("/getCategoryBySlug/:slug", categoryController.getCategoryBySlug);

router.put("/updateCategory/:slug", categoryController.updateCategory);
router.delete("/deleteCategory/:id", categoryController.deleteCategoryById);

router.post("/register", authController.register);
router.post("/login", authController.login);
router.get("/verifyAccessToken", authController.verifyAccessToken);

module.exports = router;
