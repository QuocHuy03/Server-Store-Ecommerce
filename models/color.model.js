const connect = require("../config/connect.config");
const slugify = require("slugify");

const colorModel = {
  getAllColor: async () => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `colors` ORDER BY id DESC"
      );
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  getColorById: async (cateId) => {
    try {
      const [data] = await connect.execute(
        "SELECT * FROM `colors` WHERE id = ?",
        [cateId]
      );
      return data[0];
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  createColor: async (data) => {
    try {
      const [result] = await connect.execute(
        "INSERT INTO colors (`name`) VALUES (?)",
        [data.name]
      );
      const [newColor] = await connect.execute(
        "SELECT * FROM colors WHERE id = ?",
        [result.insertId]
      );

      return newColor;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  checkDuplicateColor: async (nameColor) => {
    try {
      const [result] = await connect.execute(
        "SELECT * FROM colors WHERE `name` = ?",
        [nameColor]
      );
      return result.length > 0;
    } catch (error) {
      console.error("Lỗi trong quá trình kiểm tra trùng lặp :", error);
      throw error;
    }
  },

  updateColor: async (id, data) => {
    try {
      const [existingColor] = await connect.execute(
        "SELECT * FROM colors WHERE id = ?",
        [id]
      );

      if (existingColor.length === 0) {
        throw new Error("Color not found");
      }

      await connect.execute("UPDATE `colors` SET `name` = ? WHERE id = ?", [
        data.name,
        id,
      ]);

      const [updatedColor] = await connect.execute(
        "SELECT * FROM colors WHERE id = ?",
        [id]
      );

      return updatedColor;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteColor: async (id) => {
    try {
      const [existingColor] = await connect.execute(
        "SELECT * FROM colors WHERE id = ?",
        [id]
      );

      if (existingColor.length === 0) {
        throw new Error("Color not found");
      }

      await connect.execute("DELETE FROM `colors` WHERE id = ?", [id]);
      return true;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteAllColor: async () => {
    try {
      const [data] = await connect.execute("DELETE FROM colors");
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },

  deleteColorsByIds: async (ColorIds) => {
    try {
      const joinedIds = ColorIds.join(", ");
      const query = `DELETE FROM id WHERE id IN (${joinedIds})`;
      const [data] = await connect.execute(query);
      return data;
    } catch (error) {
      console.error("Lỗi trong quá trình truy vấn cơ sở dữ liệu:", error);
      throw error;
    }
  },
};

module.exports = colorModel;
