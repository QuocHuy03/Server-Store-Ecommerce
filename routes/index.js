const express = require("express");
const router = express.Router();

const categoryController = require("../controllers/category.controller");
const productController = require("../controllers/product.controller");
const orderController = require("../controllers/order.controller");
const authController = require("../controllers/auth.controller");
const uploadModule = require("../modules/upload");
const {
  verifyAccessTokenMiddleware,
} = require("../middlewares/verifyAccessToken");

router.get("/", (req, res, next) => {
  res.send("Bé Họt Lu");
});

// Category
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

router.delete(
  "/deleteCategoriesAll",
  verifyAccessTokenMiddleware,
  categoryController.deleteCategoryAll
);

router.delete(
  "/deleteCategoriesByIds",
  verifyAccessTokenMiddleware,
  categoryController.deleteCategoriesByIds
);

// Product

router.post(
  "/addProduct",
  verifyAccessTokenMiddleware,
  productController.addProduct
);

router.get(
  "/getAllProducts",
  verifyAccessTokenMiddleware,
  productController.listProduct
);
router.get(
  "/getProductById/:id",
  verifyAccessTokenMiddleware,
  productController.getProductById
);
router.get(
  "/getProductBySlug/:slug",
  verifyAccessTokenMiddleware,
  productController.getProductBySlug
);

router.put(
  "/updateProduct/:slug",
  verifyAccessTokenMiddleware,
  productController.updateProduct
);
router.delete(
  "/deleteProduct/:id",
  verifyAccessTokenMiddleware,
  productController.deleteProductById
);

router.delete(
  "/deleteProductsAll",
  verifyAccessTokenMiddleware,
  productController.deleteProductAll
);

router.delete(
  "/deleteProductsByIds",
  verifyAccessTokenMiddleware,
  productController.deleteProductsByIds
);

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

router.put(
  "/updateStatus/:slug",
  verifyAccessTokenMiddleware,
  orderController.updateStatus
);

router.delete(
  "/deleteProduct/:id",
  verifyAccessTokenMiddleware,
  orderController.deleteOrderById
);

// Auth

router.post("/register", authController.register);
router.post("/login", authController.login);
router.get("/verifyAccessToken", authController.verifyAccessToken);

module.exports = router;
