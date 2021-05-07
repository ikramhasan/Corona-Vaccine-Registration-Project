const mysql = require("mysql");
const pool = require("./../databaseConnection");

exports.createApplication = (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const params = req.body;

    connection.query("INSERT INTO application SET ?", params, (error, rows) => {
      connection.release();

      if (!error) {
        res.status(200).send({
          status: "success",
          message: "Application has been added succesfully",
        });
      } else {
        res.status(200).send({
          status: "fail",
          message: "Could not add application to database",
        });
      }
    });
  });
};

exports.getApplicationByUserId = (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    connection.query(
      "SELECT * from application WHERE user_id = ?",
      [req.params.id],
      (error, rows) => {
        connection.release();

        if (!error) {
          res.status(200).send({
            status: "success",
            data: rows[0],
          });
        } else {
          res.status(200).send({
            status: "fail",
            message: "Could not get your application",
          });
        }
      }
    );
  });
};

exports.getAllApplications = (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    connection.query(
      "SELECT * from user u inner join application a on u.user_id = a.user_id",
      (error, rows) => {
        connection.release();

        if (!error) {
          res.status(200).send({
            status: "success",
            data: rows,
          });
        } else {
          res.status(200).send({
            status: "fail",
            message: "Could not get applications",
          });
        }
      }
    );
  });
};

exports.updateComment = (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const id = req.params.id;
    const params = req.body.admin_comment;

    connection.query(
      "UPDATE application SET admin_comment = ? where user_id = ?",
      [params, id],
      (error, rows) => {
        connection.release();

        if (!error) {
          res.status(200).send({
            status: "success",
            data: "Application updated successfully",
          });
        } else {
          console.log(error);
          res.status(200).send({
            status: "fail",
            message: "Could not get applications",
          });
        }
      }
    );
  });
};
