const mysql = require("mysql");
const pool = require("./../databaseConnection");

exports.createDose = (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const params = req.body;

    connection.query("INSERT INTO dose SET ?", params, (error, rows) => {
      connection.release();

      if (!error) {
        res.status(200).send({
          status: "success",
          message: "Dose has been added succesfully",
        });
      } else {
        res.status(200).send({
          status: "fail",
          message: "Could not add dose to database",
        });
      }
    });
  });
};

exports.getDoseByUserId = (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    connection.query(
      "SELECT * from dose WHERE user_id = ?",
      [req.params.id],
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
            message: "Could not get your application",
          });
        }
      }
    );
  });
};

exports.setStatus = (req, res) => {
  pool.getConnection((error, connection) => {
    if (error) throw error;
    console.log(`Connect to database as ${connection.threadId}`);

    const id = req.params.id;
    const params = req.body.status;

    connection.query(
      "UPDATE dose SET status = ? where dose_id = ?",
      [params, id],
      (error, rows) => {
        connection.release();

        if (!error) {
          res.status(200).send({
            status: "success",
            data: "Status updated successfully",
          });
        } else {
          console.log(error);
          res.status(200).send({
            status: "fail",
            message: "Could not update status",
          });
        }
      }
    );
  });
};
