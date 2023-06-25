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
        "INSERT INTO categories (`nameCategory`,`slugCategory`) VALUES (?,?)",
        [cateData.nameCategory, slugify(cateData.nameCategory, { lower: true })]
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

  updateCategory: async (cateId, data) => {
    try {
      const [existingCategory] = await connect.execute(
        "SELECT * FROM categories WHERE id = ?",
        [cateId]
      );
      
      if (existingCategory.length === 0) {
        throw new Error("Category not found");
      }
      
      await connect.execute(
        "UPDATE `categories` SET `nameCategory` = ?, `slugCategory` = ? WHERE id = ?",
        [data.nameCategory, slugify(data.nameCategory, { lower: true }), cateId]
      );
  
      const [updatedCategory] = await connect.execute(
        "SELECT * FROM categories WHERE id = ?",
        [cateId]
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
};

module.exports = categoryModel;
