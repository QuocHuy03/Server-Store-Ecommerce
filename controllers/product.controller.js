const productModel = require("../models/product.model");

exports.listProduct = (req, res, next) => {
  if (req.query.page && req.query.limit) {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const skip = (page - 1) * limit;
    productModel
      .getAllProduct()
      .then((data) => {
        const paginatedData = data.slice(skip, skip + limit);
        res.status(200).json({
          totalItems: data.length,
          totalPages: Math.ceil(data.length / limit),
          currentPage: page,
          itemsPerPage: limit,
          data: paginatedData,
        });
      })
      .catch((error) => {
        console.error(error);
      });
  } else {
    productModel
      .getAllProduct()
      .then((data) => {
        res.status(200).json(data);
      })
      .catch((error) => {
        console.error(error);
      });
  }
};

exports.getProductById = (req, res, next) => {
  const id = req.params.id;
  productModel
    .getProductById(id)
    .then((cate) => {
      res.status(200).json(cate);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.getProductBySlug = (req, res, next) => {
  const slug = req.params.slug;
  productModel
    .getProductBySlug(slug)
    .then((cate) => {
      res.status(200).json(cate);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.addProduct = async (req, res, next) => {
  try {
    const existingProduct = await productModel.checkDuplicateProduct(
      req.body.nameProduct
    );

    if (existingProduct) {
      return res
        .status(200)
        .json({ status: false, message: "Sản phẩm đã tồn tại!" });
    }

    const result = await productModel.createProduct(req.body);

    if (result) {
      return res
        .status(200)
        .json({ status: true, message: "Thêm sản phẩm thành công!", result });
    } else {
      next();
    }
  } catch (error) {
    console.error(error);
    return res
      .status(500)
      .json({ status: false, message: "Lỗi trong quá trình thêm sản phẩm!" });
  }
};

exports.updateProduct = (req, res, next) => {
  productModel
    .updateProduct(req.params.slug, req.query.isEdit, req.body.data)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Update Sản Phẩm Thành Công", data });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Update Sản Phẩm Thất Bại" });
    });
};

exports.deleteProductById = (req, res, next) => {
  productModel
    .deleteProduct(req.params.id)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Sản Phẩm Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Sản Phẩm Thất Bại" });
    });
};

exports.deleteProductAll = (req, res, next) => {
  productModel
    .deleteAllProduct()
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Sản Phẩm Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Sản Phẩm Thất Bại" });
    });
};

exports.deleteProductsByIds = (req, res, next) => {
  const productIds = req.body.id.data;
  productModel
    .deleteProductsByIds(productIds)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Sản Phẩm Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Sản Phẩm Thất Bại" });
    });
};
