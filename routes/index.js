const express = require("express");
const router = express.Router();

const categoryController = require("../controllers/category.controller");
const authController = require("../controllers/auth.controller");
const uploadModule = require("../modules/upload");
const {
  verifyAccessTokenMiddleware,
} = require("../middlewares/verifyAccessToken");

router.get("/", (req, res, next) => {
  res.send("Bé Họt Lu");
});

router.post(
  "/addCategory",
  verifyAccessTokenMiddleware,
  categoryController.addCategory
);

router.get(
  "/getAllCategories",
  verifyAccessTokenMiddleware,
  categoryController.listCategory
);
router.get(
  "/getCategoryById/:id",
  verifyAccessTokenMiddleware,
  categoryController.getCategoryById
);
router.get(
  "/getCategoryBySlug/:slug",
  verifyAccessTokenMiddleware,
  categoryController.getCategoryBySlug
);

router.put(
  "/updateCategory/:slug",
  verifyAccessTokenMiddleware,
  categoryController.updateCategory
);
router.delete(
  "/deleteCategory/:id",
  verifyAccessTokenMiddleware,
  categoryController.deleteCategoryById
);

router.post("/register", authController.register);
router.post("/login", authController.login);
router.get("/verifyAccessToken", authController.verifyAccessToken);

module.exports = router;
