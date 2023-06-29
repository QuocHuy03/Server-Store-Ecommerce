const connect = require("../config/connect.config");
const slugify = require("slugify");

const categoryModel = {
  getAllCategory: async () => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `categories` ORDER BY id DESC"
      );
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  getCategoryById: async (cateId) => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `categories` WHERE id = ?",
        [cateId]
      );
      return data[0];
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  getCategoryBySlug: async (cateSlug) => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `categories` WHERE slugCategory = ?",
        [cateSlug]
      );
      return data[0];
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  createCategory: async (cateData) => {
    try {
      const [result] = await connect.execute(
        "INSERT INTO categories (`nameCategory`,`slugCategory`,`outstandingCategory`,`statusCategory`) VALUES (?,?,?,?)",
        [
          cateData.nameCategory,
          slugify(cateData.nameCategory, { lower: true }),
          cateData.outstandingCategory,
          cateData.statusCategory,
        ]
      );
      const [newCategory] = await connect.execute(
        "SELECT * FROM categories WHERE id = ?",
        [result.insertId]
      );

      return newCategory;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  checkDuplicateCategory: async (nameCategory) => {
    try {
      const [result] = await connect.execute(
        "SELECT * FROM categories WHERE `nameCategory` = ?",
        [nameCategory]
      );
      return result.length > 0;
    } catch (error) {
      console.error("Lỗi trong quá trình kiểm tra trùng lặp danh mục:", error);
      throw error;
    }
  },

  updateCategory: async (slug, data) => {
    try {
      const [existingCategory] = await connect.execute(
        "SELECT * FROM categories WHERE slugCategory = ?",
        [slug]
      );

      if (existingCategory.length === 0) {
        throw new Error("Category not found");
      }

      await connect.execute(
        "UPDATE `categories` SET `nameCategory` = ?, `slugCategory` = ? , `outstandingCategory` = ? ,`statusCategory` = ? WHERE slugCategory = ?",
        [
          data.nameCategory,
          slugify(data.nameCategory, { lower: true }),
          data.outstandingCategory,
          data.statusCategory,
          slug,
        ]
      );

      const [updatedCategory] = await connect.execute(
        "SELECT * FROM categories WHERE slugCategory = ?",
        [slug]
      );

      return updatedCategory;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteCategory: async (cateId) => {
    try {
      const [existingCategory] = await connect.execute(
        "SELECT * FROM categories WHERE id = ?",
        [cateId]
      );

      if (existingCategory.length === 0) {
        throw new Error("Category not found");
      }

      await connect.execute("DELETE FROM `categories` WHERE id = ?", [cateId]);
      return true;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteAllCategory: async () => {
    try {
      const [data] = await connect.execute("DELETE FROM categories");
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteCategoriesByIds: async (categoryIds) => {
    try {
      const joinedIds = categoryIds.join(", "); // Kết hợp các ID thành một chuỗi được phân tách bằng dấu phẩy
      const query = `DELETE FROM categories WHERE id IN (${joinedIds})`;
      const [data] = await connect.execute(query);
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },
};

module.exports = categoryModel;
