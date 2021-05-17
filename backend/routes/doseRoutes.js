const express = require("express");

const doseController = require("./../controllers/doseController");

const router = express.Router();

router
  .route("/")
  .post(doseController.createDose);

router
  .route("/:id")
  .get(doseController.getDoseByUserId)
  .put(doseController.updateDoseById)
  .patch(doseController.setStatus);

module.exports = router;
