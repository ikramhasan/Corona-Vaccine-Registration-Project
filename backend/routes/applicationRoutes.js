const express = require("express");

const applicationController = require("./../controllers/applicationController");

const router = express.Router();

router
  .route("/")
  .post(applicationController.createApplication)
  .get(applicationController.getAllApplications);

router
  .route("/:id")
  .get(applicationController.getApplicationByUserId)
  .patch(applicationController.updateComment);

module.exports = router;
