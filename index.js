const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
require("dotenv").config();

const port = process.env.PORT || 8080;

app.use(
  cors({
    origin: "*",
    methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
    credentials: true,
  })
);

const webRoutes = require("./routes/index");
const uploadRoutes = require("./modules/upload");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use("/api", webRoutes);
app.use("/api/uploadFile", uploadRoutes);

app.listen(port, () => {
  console.log(`Connect Success Port ${port}`);
});
