const express = require("express");
const userController = require('./../controllers/userController');


const router = express.Router();

router
  .route("/")
  .get(userController.getUserByEmailAndPass)
  .post(userController.createUser)
  .put(userController.updateUser)
  .delete(userController.deleteUser);

router.route("/:id").get(userController.getUserById);

module.exports = router;