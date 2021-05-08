const express = require("express");

const doseController = require("./../controllers/doseController");

const router = express.Router();

router
  .route("/")
  .post(doseController.createDose);

router
  .route("/:id")
  .get(doseController.getDoseByUserId)
  .patch(doseController.setStatus);

module.exports = router;
