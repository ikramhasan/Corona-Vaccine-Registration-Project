const express = require("express");

const testControlller = require("./../controllers/testControlller");

const router = express.Router();

router
  .route("/")
  .get(testControlller.getAllApplications);

module.exports = router;