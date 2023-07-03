const connect = require("../config/connect.config");
const slugify = require("slugify");

const productModel = {
  getAllProduct: async () => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `products` ORDER BY id DESC"
      );
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  getProductById: async (cateId) => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `products` WHERE id = ?",
        [cateId]
      );
      return data[0];
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  getProductBySlug: async (data) => {
    try {
      const [result] = await connect.execute(
        "SELECT * FROM `products` WHERE slugProduct = ?",
        [data]
      );
      return result[0];
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  createProduct: async (data) => {
    try {
      const [result] = await connect.execute(
        "INSERT INTO products (`nameProduct`, `slugProduct`, `price_has_ropped`, `initial_price`, `categoryID`, `contentProduct`, `descriptionProduct`, `statusProduct`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        [
          data.nameProduct,
          slugify(data.nameProduct, { lower: true }),
          data.price_has_ropped,
          data.initial_price,
          data.categoryID,
          data.contentProduct,
          data.descriptionProduct,
          data.statusProduct,
        ]
      );

      const productId = result.insertId;

      // Insert images into the images table
      for (const imagePath of data.imageProducts) {
        await connect.execute(
          "INSERT INTO images (`product_id`, `image_path`) VALUES (?, ?)",
          [productId, imagePath]
        );
      }

      const [newProduct] = await connect.execute(
        "SELECT * FROM products WHERE id = ?",
        [productId]
      );

      return newProduct;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  checkDuplicateProduct: async (nameProduct) => {
    try {
      const [result] = await connect.execute(
        "SELECT * FROM products WHERE `nameProduct` = ?",
        [nameProduct]
      );
      return result.length > 0;
    } catch (error) {
      console.error("Lỗi trong quá trình kiểm tra trùng lặp danh mục:", error);
      throw error;
    }
  },

  updateProduct: async (slug, data) => {
    try {
      const [existingProduct] = await connect.execute(
        "SELECT * FROM products WHERE slugProduct = ?",
        [slug]
      );

      if (existingProduct.length === 0) {
        throw new Error("Product not found");
      }

      await connect.execute(
        "UPDATE `products` SET `nameProduct` = ?, `slugProduct` = ? , `price_has_ropped` = ? ,`categoryID` = ? ,`initial_price` = ? ,`contentProduct` = ? ,`descriptionProduct` = ? ,`statusProduct` = ? WHERE slugProduct = ?",
        [
          data.nameProduct,
          slugify(data.nameProduct, { lower: true }),
          data.price_has_ropped,
          data.categoryID,
          data.initial_price,
          data.contentProduct,
          data.descriptionProduct,
          data.statusProduct,
          slug,
        ]
      );

      const [updatedProduct] = await connect.execute(
        "SELECT * FROM products WHERE slugProduct = ?",
        [slug]
      );

      return updatedProduct;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteProduct: async (id) => {
    try {
      const [existingProduct] = await connect.execute(
        "SELECT * FROM products WHERE id = ?",
        [id]
      );

      if (existingProduct.length === 0) {
        throw new Error("Product not found");
      }

      await connect.execute("DELETE FROM `products` WHERE id = ?", [id]);
      return true;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteAllProduct: async () => {
    try {
      const [data] = await connect.execute("DELETE FROM products");
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteProductsByIds: async (products) => {
    try {
      const joinedIds = products.join(", "); // Kết hợp các ID thành một chuỗi được phân tách bằng dấu phẩy
      const query = `DELETE FROM products WHERE id IN (${joinedIds})`;
      const [data] = await connect.execute(query);
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },
};

module.exports = productModel;
