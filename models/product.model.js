const connect = require("../config/connect.config");
const slugify = require("slugify");

const productModel = {
  getAllProduct: async () => {
    try {
      const [productData] = await connect.execute(
        "SELECT p.id, p.nameProduct, p.slugProduct, p.price_has_ropped, p.categoryID, p.initial_price, p.contentProduct,p.descriptionProduct, p.statusProduct, p.createAt, p.updatedAt, GROUP_CONCAT(DISTINCT i.image_path) AS imagePaths, GROUP_CONCAT(DISTINCT pc.nameColor) AS nameColors, cat.nameCategory FROM products AS p LEFT JOIN images AS i ON p.id = i.product_image_id LEFT JOIN colors AS pc ON p.id = pc.product_color_id LEFT JOIN categories AS cat ON p.categoryID = cat.id GROUP BY p.id"
      );

      return productData;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  getProductById: async (productId) => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `products` WHERE id = ?",
        [productId]
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
        "SELECT p.id, p.nameProduct, p.slugProduct, p.price_has_ropped, p.categoryID, p.initial_price, p.contentProduct, p.descriptionProduct, p.statusProduct, p.createAt, p.updatedAt, GROUP_CONCAT(DISTINCT i.image_path) AS imagePaths, GROUP_CONCAT(DISTINCT pc.nameColor) AS nameColors, cat.nameCategory FROM products AS p LEFT JOIN images AS i ON p.id = i.product_image_id LEFT JOIN colors AS pc ON p.id = pc.product_color_id LEFT JOIN categories AS cat ON p.categoryID = cat.id WHERE p.slugProduct = ? GROUP BY p.id",
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

      // vòng qua từng image
      for (const imagePath of data.imageProducts) {
        await connect.execute(
          "INSERT INTO images (`product_image_id`, `image_path`) VALUES (?, ?)",
          [productId, imagePath]
        );
      }

      for (const colors of data.nameColors) {
        await connect.execute(
          "INSERT INTO colors (`product_color_id`, `nameColor`) VALUES (?, ?)",
          [productId, colors]
        );
      }

      const [newProduct] = await connect.execute(
        "SELECT * FROM products WHERE id = ?",
        [productId]
      );

      return newProduct;
    } catch (error) {
      console.error(
        "Lỗi trong quá trình truy vấn cơ sở dữ liệu product:",
        error
      );
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

  updateProduct: async (slug, isEdit, data) => {
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
    
      // Cập nhật ảnh
      if (!isEdit) {
        // Xóa các ảnh cũ của sản phẩm
        await connect.execute(
          "DELETE FROM images WHERE `product_image_id` = ?",
          [existingProduct[0].id]
        );

        // Thêm ảnh mới vào sản phẩm
        for (const imagePath of data.imageProducts) {
          await connect.execute(
            "INSERT INTO images (`product_image_id`, `image_path`) VALUES (?, ?)",
            [existingProduct[0].id, imagePath]
          );
        }
      }

      // Cập nhật màu sắc
      // Xóa các màu sắc cũ của sản phẩm
      await connect.execute("DELETE FROM colors WHERE `product_color_id` = ?", [
        existingProduct[0].id,
      ]);

      // Thêm màu sắc mới vào sản phẩm
      for (const color of data.nameColors) {
        await connect.execute(
          "INSERT INTO colors (`product_color_id`, `nameColor`) VALUES (?, ?)",
          [existingProduct[0].id, color]
        );
      }

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
      await connect.execute("DELETE FROM `images` WHERE product_id = ?", [id]);

      await connect.execute("DELETE FROM `products` WHERE id = ?", [id]);
      return true;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteAllProduct: async () => {
    try {
      await connect.execute(
        "DELETE images FROM images JOIN products ON images.product_id = products.id"
      );
      const [data] = await connect.execute("DELETE FROM products");
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteProductsByIds: async (products) => {
    try {
      const joinedIds = products.join(", ");

      await connect.execute(
        "DELETE FROM images WHERE product_id IN (SELECT id FROM products WHERE id = ?)",
        products
      );

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
