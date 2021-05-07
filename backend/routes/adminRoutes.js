const express = require("express");

const adminController = require("./../controllers/adminController");

const router = express.Router();

router
  .route("/")
  .get(adminController.getAdminByEmailAndPass)
  .post(adminController.createAdmin);

module.exports = router;
