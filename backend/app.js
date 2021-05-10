const express = require("express");
var cors = require("cors");

const app = express();
app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const pool = require("./databaseConnection");

const userRouter = require("./routes/userRoutes");
const adminRouter = require("./routes/adminRoutes");
const applicationRouter = require("./routes/applicationRoutes");
const doseRouter = require("./routes/doseRoutes");
const testRouter = require("./routes/testRoutes");

app.use("/api/v1/admins", adminRouter);
app.use("/api/v1/users", userRouter);
app.use("/api/v1/applications", applicationRouter);
app.use("/api/v1/doses", doseRouter);
app.use("/api/v1/testing", testRouter);

module.exports = app;
