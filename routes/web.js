const express = require("express");
const router = express.Router();

const categoryController = require("../controllers/category.controller");
const productController = require("../controllers/product.controller");
const orderController = require("../controllers/order.controller");
const userController = require("../controllers/user.controller");
const {
  verifyAccessTokenMiddleware,
} = require("../middlewares/verifyAccessToken");

const authController = require("../controllers/auth.controller");

router.get("/", (req, res, next) => {
  res.send("Bé Họt Lu");
});

// Category

router.get("/getAllCategories", categoryController.listCategory);
router.get("/getCategoryById/:id", categoryController.getCategoryById);
router.get("/getCategoryBySlug/:slug", categoryController.getCategoryBySlug);

// Product

router.get("/getAllProducts", productController.listProduct);
router.get("/getProductById/:id", productController.getProductById);

router.get("/getProductOfCategory/:id", productController.getProductOfCategory);

router.get("/getProductBySlug/:slug", productController.getProductBySlug);

// Order

router.post(
  "/postOrder",
  verifyAccessTokenMiddleware,
  orderController.postOrder
);

router.get(
  "/getAllOrders",
  verifyAccessTokenMiddleware,
  orderController.listOrder
);
router.get(
  "/getOrderById/:id",
  verifyAccessTokenMiddleware,
  orderController.getOrderById
);

// Auth

router.post("/register", authController.register);
router.post("/login", authController.login);
router.get("/verifyAccessToken", authController.verifyAccessToken);

// user

router.get("/getAllUsers", userController.listUsers);
router.get("/getUserById/:id", userController.getUserById);

module.exports = router;