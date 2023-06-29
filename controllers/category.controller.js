const categoryModel = require("../models/category.model");

exports.listCategory = (req, res, next) => {
  if (req.query.page && req.query.limit) {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const skip = (page - 1) * limit;
    categoryModel
      .getAllCategory()
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
    categoryModel
      .getAllCategory()
      .then((data) => {
        res.status(200).json(data);
      })
      .catch((error) => {
        console.error(error);
      });
  }
};

exports.getCategoryById = (req, res, next) => {
  const cateID = req.params.id;
  categoryModel
    .getCategoryById(cateID)
    .then((cate) => {
      res.status(200).json(cate);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.getCategoryBySlug = (req, res, next) => {
  const cateSlug = req.params.slug;
  categoryModel
    .getCategoryBySlug(cateSlug)
    .then((cate) => {
      res.status(200).json(cate);
    })
    .catch((error) => {
      console.error(error);
    });
};

exports.addCategory = async (req, res, next) => {
  try {
    const existingCategory = await categoryModel.checkDuplicateCategory(
      req.body.nameCategory
    );

    if (existingCategory) {
      return res
        .status(200)
        .json({ status: false, message: "Danh mục đã tồn tại!" });
    }

    const result = await categoryModel.createCategory(req.body);

    if (result) {
      return res
        .status(200)
        .json({ status: true, message: "Thêm danh mục thành công!", result });
    } else {
      next();
    }
  } catch (error) {
    console.error(error);
    return res
      .status(500)
      .json({ status: false, message: "Lỗi trong quá trình thêm danh mục!" });
  }
};

exports.updateCategory = (req, res, next) => {
  categoryModel
    .updateCategory(req.params.slug, req.body.data)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Update Danh Mục Thành Công", data });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Update Danh Mục Thất Bại" });
    });
};

exports.deleteCategoryById = (req, res, next) => {
  categoryModel
    .deleteCategory(req.params.id)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Danh Mục Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Danh Mục Thất Bại" });
    });
};

exports.deleteCategoryAll = (req, res, next) => {
  categoryModel
    .deleteAllCategory(req.params.id)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Danh Mục Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Danh Mục Thất Bại" });
    });
};

exports.deleteCategoriesByIds = (req, res, next) => {
  // console.log(req.body.id.data);
  const categoryIds = req.body.id.data;
  categoryModel
    .deleteCategoriesByIds(categoryIds)
    .then((data) => {
      return res
        .status(200)
        .json({ status: true, message: "Delete Danh Mục Thành Công" });
    })
    .catch((error) => {
      console.error(error);
      return res
        .status(500)
        .json({ status: false, message: "Delete Danh Mục Thất Bại" });
    });
};
